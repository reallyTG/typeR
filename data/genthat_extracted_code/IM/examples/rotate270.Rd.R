library(IM)


### Name: rotate270
### Title: Rotate an image (or matrix) 270 degrees.
### Aliases: rotate270 rotate270-methods rotate270,Numbers-method
### Keywords: misc

### ** Examples

	data(pirate);
	#perform histogram equalization
	img = histeq(img);
	#convert to grayscale
	img = rowSums(img, dims=2)/3;
	#rotate image 270 degrees so it appears upright
	img = rotate270(img);
	#set colors
	levels = seq(0,1,.0000001);
	g = gray(levels);
	image(img,col=g)



