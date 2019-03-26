library(MLEcens)


### Name: plotCDF1
### Title: Create a marginal CDF (or survival function) plot of the MLE
### Aliases: plotCDF1
### Keywords: hplot dplot aplot

### ** Examples

# Load example data:
data(ex)

# Compute the MLE:
mle <- computeMLE(ex)

# Plot marginal CDF for X
par(mfrow=c(2,2))
plotCDF1(mle, margin=1, xlim=c(min(ex[,1])-1,max(ex[,2])+1), 
 bound="b", xlab="x", ylab="P(X<=x)", main="MLE for P(X<=x)")

# Plot marginal survival function for X
plotCDF1(mle, margin=1, surv=TRUE, xlim=c(min(ex[,1])-1,max(ex[,2])+1), 
 bound="b", xlab="x", ylab="P(X>x)", main="MLE for P(X>x)")

# Plot marginal CDF for Y
plotCDF1(mle, margin=2, xlim=c(min(ex[,3])-1,max(ex[,4])+1), 
 bound="b", xlab="y", ylab="P(Y<=y)", main="MLE for P(Y<=y)")

# Plot marginal survival function for Y
plotCDF1(mle, margin=2, surv=TRUE, xlim=c(min(ex[,3])-1,max(ex[,4])+1), 
 bound="b", xlab="y", ylab="P(Y>y)", main="MLE for P(Y>y)")



