library(RobPer)


### Name: TK95
### Title: Power law noise generator
### Aliases: TK95

### ** Examples

set.seed(31)
# Generate power law noise with exponent alpha=1.5:
y <- TK95(N=2000, alpha=1.5)
tt <- seq(along=y)

# Show time series:
plot(tt,y, type="l", main="Power Law Noise", xlab="t", ylab="y")

# Plot Fourier periodogram with log-axes:
temp <- spectrum(y, plot=FALSE)
plot(log(temp$freq), log(temp$spec), main="log-log-Fourier periodogram",
    xlab="log(frequency)", ylab="log(periodogram)")

# A line with slope -alpha for comparison
abline(a=8, b=-1.5, col="red")
text(-2, 12, expression(alpha==1.5), col="red")



