library(NostalgiR)


### Name: nos.density
### Title: nos.density text-based plot of a kernel density function.
### Aliases: nos.density

### ** Examples

## Plot a kernel density function of 10 random standard normal points with
## a Gaussian kernel and with the locations of the data plotted along the x-axis.
data <- rnorm(10)
nos.density(data)

## Plot a kernel density function of 100 random stanard normal points with
## a triangular kernel and without the locations of the data plotted along the x-axis.
data <- rnorm(100)
nos.density(data,kernel='triangular',location=FALSE)



