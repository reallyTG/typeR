library(fdatest)


### Name: fdatest-package
### Title: Interval Testing Procedure for Functional Data
### Aliases: fdatest-package fdatest
### Keywords: package

### ** Examples

# Importing the NASA temperatures data set
data(NASAtemp)

# Example 1: 
# Performing the ITP for one population with the Fourier basis
ITP.result <- ITP1fourier(NASAtemp$milan,maxfrequency=10,B=1000)
# Plotting the results of the ITP
plot(ITP.result)

# Plotting the p-value heatmap
ITPimage(ITP.result)

# Selecting the significant coefficients
which(ITP.result$corrected.pval < 0.05)

# Example 2: 
# Performing the ITP for two populations with the B-spline basis
ITP.result <- ITP2bspline(NASAtemp$milan,NASAtemp$paris,nknots=20,B=1000)
# Plotting the results of the ITP
plot(ITP.result)

# Plotting the p-values heatmap
ITPimage(ITP.result)

# Selecting the significant components for the radius at 5% level
which(ITP.result$corrected.pval < 0.05)


# Example 3:
# Fitting and testing a functional-on-scalar linear model  
# Defining data and covariates 
temperature <- rbind(NASAtemp$milan,NASAtemp$paris)
groups <- c(rep(0,22),rep(1,22))

# Performing the ITP
ITP.result <- ITPlmbspline(temperature ~ groups,B=1000,nknots=20,order=3)
# Summary of the ITP results
summary(ITP.result)

# Plot of the ITP results
layout(1)
plot(ITP.result,main='NASA data', plot.adjpval = TRUE,xlab='Day',xrange=c(1,365))

# All graphics on the same device
layout(matrix(1:6,nrow=3,byrow=FALSE))
plot(ITP.result,main='NASA data', plot.adjpval = TRUE,xlab='Day',xrange=c(1,365))





