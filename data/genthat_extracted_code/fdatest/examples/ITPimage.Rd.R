library(fdatest)


### Name: ITPimage
### Title: Plot of the Interval Testing Procedure results
### Aliases: ITPimage
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Importing the NASA temperatures data set
data(NASAtemp)

# Performing the ITP for two populations with the B-spline basis
ITP.result <- ITP2bspline(NASAtemp$milan,NASAtemp$paris,nknots=20,B=1000)

# Plotting the results of the ITP
ITPimage(ITP.result,abscissa.range=c(0,12))

# Selecting the significant components for the radius at 5% level
which(ITP.result$corrected.pval < 0.05)




