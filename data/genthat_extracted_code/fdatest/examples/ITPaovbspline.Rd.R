library(fdatest)


### Name: ITPaovbspline
### Title: Interval Testing Procedure for testing Functional analysis of
###   variance with B-spline basis
### Aliases: ITPaovbspline
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Importing the NASA temperatures data set
data(NASAtemp)

temperature <- rbind(NASAtemp$milan,NASAtemp$paris)
groups <- c(rep(0,22),rep(1,22))

# Performing the ITP
ITP.result <- ITPaovbspline(temperature ~ groups,B=1000,nknots=20,order=3)

# Summary of the ITP results
summary(ITP.result)

# Plot of the ITP results
layout(1)
plot(ITP.result)

# All graphics on the same device
layout(matrix(1:4,nrow=2,byrow=FALSE))
plot(ITP.result,main='NASA data', plot.adjpval = TRUE,xlab='Day',xrange=c(1,365))




