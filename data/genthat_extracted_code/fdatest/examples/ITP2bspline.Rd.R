library(fdatest)


### Name: ITP2bspline
### Title: Two populations Interval Testing Procedure with B-spline basis
### Aliases: ITP2bspline
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Importing the NASA temperatures data set
data(NASAtemp)
# Performing the ITP
ITP.result <- ITP2bspline(NASAtemp$milan,NASAtemp$paris,nknots=50,B=1000)

# Plotting the results of the ITP
plot(ITP.result,main='NASA data',xrange=c(1,365),xlab='Day')

# Plotting the p-values heatmap
ITPimage(ITP.result,abscissa.range=c(0,12))

# Selecting the significant components at 5% level
which(ITP.result$corrected.pval < 0.05)




