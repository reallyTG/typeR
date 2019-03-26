library(fdatest)


### Name: plot.ITP1
### Title: Plotting ITP results for one-population tests
### Aliases: plot.ITP1
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Importing the NASA temperatures data set
data(NASAtemp)

# Performing the ITP for one population with the B-spline basis
ITP.result.bspline <- ITP1bspline(NASAtemp$paris,mu=4,nknots=50,B=1000)
# Plotting the results of the ITP
plot(ITP.result.bspline,xlab='Day',xrange=c(0,365),main='NASA data')
# Selecting the significant components for the radius at 5% level
which(ITP.result.bspline$corrected.pval < 0.05)





