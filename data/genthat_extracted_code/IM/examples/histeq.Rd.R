library(IM)


### Name: histeq
### Title: Perform histogram equalization on an image.
### Aliases: histeq histeq-methods histeq,Numbers-method
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
	## Not run: image(img,col=g)



