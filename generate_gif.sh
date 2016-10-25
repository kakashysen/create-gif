######################################
# @author Jose Aponte
# @createdat 2016-07-25
#
# This script need ffmpeg library, to install download from http://ffmpeg.org/
# or from Mac OS run brew install ffmpeg
#
# Create a gif from video
# This script need this parameters:
# $1 -> Video name, this are the supported extensions: .mp4 .mov
# $2 -> scale value, if this parameter is not set the default value is 320
# $3 -> fps value, if this parameter is not set the default value is 10
#####################################
scale=320
fps=10
inputVideo=$1
frameDir=`eval echo ~/Desktop/frames`

if [ -z $1 ]; then
	echo "*****************************************"
	echo "Error: Video name input is required"
	echo "*****************************************"
	exit 1
fi
 
if [ ! -z $2 ]; then
	scale=$2
fi

if [ ! -z $3 ]; then
	fps=$3
fi

# Create a directory to save frames temporaly
mkdir $frameDir 

# creating the frames into frames directory 
ffmpeg -i $inputVideo -vf scale=$scale:-1:flags=lanczos,fps=10 $frameDir/ffout%03d.png

# Creating the gif file
convert -loop 0 $frameDir/ffout*.png ~/Desktop/output.gif

echo "############################################"
echo "Gif file generated: `eval echo ~/Desktop/`output.gif"
echo "############################################"

# Delete the frames directory
#rm -rf $frameDir/
