library(DescTools)


### Name: Range
### Title: (Robust) Range
### Aliases: Range
### Keywords: univar

### ** Examples

x <- c(0:10, 50)
xm <- Range(x)
c(xm, Range(x, trim = 0.10))

x <- c(rnorm(20), rnorm(3, 5, 20))
Range(x, robust=TRUE)

# compared to
Range(x)



