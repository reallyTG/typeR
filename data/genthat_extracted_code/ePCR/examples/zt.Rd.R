library(ePCR)


### Name: zt
### Title: Extended function for z-transformation, filling non-finite
###   values and changes column names at will
### Aliases: zt

### ** Examples

somedata <- cbind(rnorm(100), runif(100))
normdata <- zt(somedata)
head(normdata)
apply(normdata, MARGIN=2, FUN=mean)
apply(normdata, MARGIN=2, FUN=sd)



