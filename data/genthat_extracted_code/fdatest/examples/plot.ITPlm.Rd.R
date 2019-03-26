library(fdatest)


### Name: plot.ITPlm
### Title: Plotting ITP results for functional-on-scalar linear model
###   testing
### Aliases: plot.ITPlm
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Importing the NASA temperatures data set
data(NASAtemp)

data <- rbind(NASAtemp$milan,NASAtemp$paris)
lab <- c(rep(0,22),rep(1,22))

# Performing the ITP
ITP.result <- ITPlmbspline(data ~ lab,B=1000,nknots=20,order=3)
# Summary of the ITP results
summary(ITP.result)

# Plot of the ITP results
layout(1)
plot(ITP.result,main='NASA data',xlab='Day',xrange=c(1,365))

# Plots of the adjusted p-values
plot(ITP.result,main='NASA data', plot.adjpval = TRUE,xlab='Day',xrange=c(1,365))

# To have all plots in one device
layout(matrix(1:6,nrow=3,byrow=FALSE))
plot(ITP.result,main='NASA data', plot.adjpval = TRUE,xlab='Day',xrange=c(1,365))





