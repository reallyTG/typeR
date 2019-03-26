library(vcdExtra)


### Name: Gilby
### Title: Clothing and Intelligence Rating of Children
### Aliases: Gilby
### Keywords: datasets

### ** Examples

data(Gilby)

mosaic(Gilby, shade=TRUE)

# correspondence analysis to see relations among categories
if(require(ca)){
	ca(Gilby)
	plot(ca(Gilby))
	title(xlab="Dimension 1", ylab="Dimension 2")
}





