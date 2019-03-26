library(RsimMosaic)


### Name: bilinearInterpolator
### Title: A function to perform bilinar interpolation
### Aliases: bilinearInterpolator
### Keywords: utilities misc

### ** Examples

library('jpeg')
 
# Read the R logo
logo <- readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))

# Create a scaled down version of the R channel
intrpArray <- array(dim=c(20, 20, 3))
intrpArray[,,1] <- bilinearInterpolator(logo[,,1], dim(intrpArray)[1], dim(intrpArray)[2])

# Display the results
dev.new()
image(logo[,,1], main="Original")
dev.new()
image(intrpArray[,,1], main="Scaled down")



