library(Thermimage)


### Name: convertflirVID
### Title: Convert FLIR CSQ or SEQ into PNG or AVI, using shell commands.
### Aliases: convertflirVID

### ** Examples

# Based on the following command line unix code, this function will convert a 
# flir jpg into a 16 bit greyscale video or sequence of images for import into imageJ

# Equivalent command line code:
# ffmpeg -f image2 -vcodec tiff -r 30 -s 640x480 -i 'output/frame%05d.tiff' -pix_fmt gray16be 
# -vcodec png -s 640x480 file.avi

# Examples 
# See https://github.com/gtatters/FLIRJPGConvert/blob/master/Examples.R

# See https://github.com/gtatters/FLIRJPGConvert/blob/master/FLIRJPG_Convert.R 

# See https://github.com/gtatters/Thermimage/blob/master/README.md





