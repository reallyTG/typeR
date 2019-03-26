library(L1pack)


### Name: Laplace
### Title: The Laplace distribution
### Aliases: Laplace dlaplace plaplace qlaplace rlaplace
### Keywords: distribution

### ** Examples

x <- rlaplace(1000)
## Q-Q plot for Laplace data against true theoretical distribution:
qqplot(qlaplace(ppoints(1000)), x, main = "Laplace Q-Q plot",
  xlab = "Theoretical quantiles", ylab = "Sample quantiles")
abline(c(0,1), col = "red", lwd = 2)



