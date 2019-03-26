library(fdatest)


### Name: ITPlmbspline
### Title: Interval Testing Procedure for testing Functional-on-Scalar
###   Linear Models with B-spline basis
### Aliases: ITPlmbspline
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Importing the NASA temperatures data set
data(NASAtemp)

# Defining the covariates 
temperature <- rbind(NASAtemp$milan,NASAtemp$paris)
groups <- c(rep(0,22),rep(1,22))

# Performing the ITP
ITP.result <- ITPlmbspline(temperature ~ groups,B=1000,nknots=20)
# Summary of the ITP results
summary(ITP.result)

# Plot of the ITP results
layout(1)
plot(ITP.result,main='NASA data', plot.adjpval = TRUE,xlab='Day',xrange=c(1,365))

# All graphics on the same device
layout(matrix(1:6,nrow=3,byrow=FALSE))
plot(ITP.result,main='NASA data', plot.adjpval = TRUE,xlab='Day',xrange=c(1,365))





