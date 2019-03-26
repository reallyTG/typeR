library(MLEcens)


### Name: menopause
### Title: Menopause data
### Aliases: menopause
### Keywords: datasets

### ** Examples

# Load the data
data(menopause)

# Compute the MLE
mle <- computeMLE(R=menopause, B=c(0,1,1,1))

# Plot first sub-distribution function P(X<=x, 0.5<Y<=1.5) = P(X<=x, Y=1)
par(mfrow=c(1,1))
plotCDF1(mle, margin=1, bound="b", int=c(0.5,1.5), col="red", ylim=c(0,1),
 xlab="x", main="P(X<=x, Y=k), k=1,2")

# Plot second sub-distribution function P(X<=x, 1.5<Y<=2.5) = P(X<=x, Y=2)
plotCDF1(mle, margin=1, bound="b", int=c(1.5,2.5), col="black", add=TRUE)

# Add legend
legend(0,1,c("k=1: operative","k=2: natural"), col=c("red","black"), lty=1)

# Plot marginal distribution of the failure cause Y
plotCDF1(mle, margin=2, bound="u", col="black", xlim=c(0,3), 
 xlab="y", main="P(Y<=y)")



