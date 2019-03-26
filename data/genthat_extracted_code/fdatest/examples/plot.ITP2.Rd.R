library(fdatest)


### Name: plot.ITP2
### Title: Plotting ITP results for two-population tests
### Aliases: plot.ITP2
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Importing the NASA temperatures data set
data(NASAtemp)

# Performing the ITP for two populations with the B-spline basis
ITP.result.bspline <- ITP2bspline(NASAtemp$milan,NASAtemp$paris,nknots=30,B=1000)
# Plotting the results of the ITP
plot(ITP.result.bspline,xlab='Day',xrange=c(1,365),main='NASA data')

# Selecting the significant components for the radius at 5% level
which(ITP.result.bspline$corrected.pval < 0.05)





