library(RsimMosaic)


### Name: computeStatisticalQuantitiesPixel
### Title: A function to compute the pixel data in a certain parameter
###   space
### Aliases: computeStatisticalQuantitiesPixel
### Keywords: utilities misc

### ** Examples

# Read the R logo and output the value of its pixel (50, 5) in the parameter space
library('jpeg')
logo <- readJPEG(system.file("img", "Rlogo.jpg", package="jpeg")) # Read the R logo
computeStatisticalQuantitiesPixel(50, 5, logo) # Compute the quantities at the pixel (5,5)




