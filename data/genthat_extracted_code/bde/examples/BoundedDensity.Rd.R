library(bde)


### Name: BoundedDensity
### Title: Class '"BoundedDensity"'
### Aliases: BoundedDensity BoundedDensity-class
### Keywords: classes

### ** Examples

# data points and its densities
a <- seq(0,1,0.01)
b <- dbeta(a,5,10)

# create the density model
model <- boundedDensity(x=a,densities=b)

# examples of usual functions
density(model,0.5)

distribution(model,0.2,discreteApproximation=FALSE)
distribution(model,0.2,discreteApproximation=TRUE)
 
# graphical representation
hist(b,freq=FALSE)
lines(model, col="red",lwd=2)




