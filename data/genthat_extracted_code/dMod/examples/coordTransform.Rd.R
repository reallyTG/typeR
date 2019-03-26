library(dMod)


### Name: coordTransform
### Title: Coordinate transformation for data frames
### Aliases: coordTransform

### ** Examples

mydata1 <- data.frame(name = c("A", "B"), time = 0:5, value = 0:5, sigma = .1)
coordTransform(mydata1, "log(value)")
coordTransform(mydata1, list(A = "exp(value)", B = "sqrt(value)"))



