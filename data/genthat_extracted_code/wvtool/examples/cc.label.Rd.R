library(wvtool)


### Name: cc.label
### Title: Connected Component Labelling.
### Aliases: cc.label

### ** Examples

## Not run: 
##D data(cryptomeria)
##D img <- rgb2gray(cryptomeria)
##D img.c <- crop(img,300,300)
##D img.bin <- gray2bin(img.c, auto=FALSE, th=180)
##D par(mfrow=c(2,2))
##D test <- cc.label(img.bin, connect=8, img.show=TRUE)
##D hist(test$summary$area,main="histogram of area")
##D hist(test$summary$dX,main="histogram of dX")
##D hist(test$summary$dY,main="histogram of dY")
## End(Not run)



