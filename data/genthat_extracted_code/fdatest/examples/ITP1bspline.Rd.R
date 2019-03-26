library(fdatest)


### Name: ITP1bspline
### Title: One population Interval Testing Procedure with B-spline basis
### Aliases: ITP1bspline
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Importing the NASA temperatures data set
data(NASAtemp)
# Performing the ITP for two populations with the B-spline basis
ITP.result <- ITP1bspline(NASAtemp$paris,mu=4,nknots=50,B=1000)
# Plotting the results of the ITP
plot(ITP.result,xrange=c(0,12),main='Paris temperatures')

# Plotting the p-value heatmap
ITPimage(ITP.result,abscissa.range=c(0,12))


# Selecting the significant components for the radius at 5% level
which(ITP.result$corrected.pval < 0.05)




