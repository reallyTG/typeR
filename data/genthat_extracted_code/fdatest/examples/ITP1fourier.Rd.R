library(fdatest)


### Name: ITP1fourier
### Title: One population Interval Testing Procedure with Fourier basis
### Aliases: ITP1fourier
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Importing the NASA temperatures data set
data(NASAtemp)
# Performing the ITP
ITP.result <- ITP1fourier(NASAtemp$milan,maxfrequency=20,B=1000)
# Plotting the results of the ITP
plot(ITP.result,main='NASA data',xrange=c(1,365),xlab='Day')

# Plotting the p-value heatmap
ITPimage(ITP.result,abscissa.range=c(1,365))

# Selecting the significant coefficients
which(ITP.result$corrected.pval < 0.05)




