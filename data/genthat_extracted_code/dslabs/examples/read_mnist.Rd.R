library(dslabs)


### Name: read_mnist
### Title: Download and read the mnist dataset
### Aliases: read_mnist

### ** Examples

# this can take several seconds, depending on internet speed.
## Not run: 
##D mnist <- read_mnist()
##D i <- 5
##D image(1:28, 1:28, matrix(mnist$test$images[i,], nrow=28)[ , 28:1], 
##D     col = gray(seq(0, 1, 0.05)), xlab = "", ylab="")
##D ## the labels for this image is: 
##D mnist$test$labels[i]
## End(Not run)




