library(sft)


### Name: estimateNAH
### Title: Neslon-Aalen Estimator of the Cumulative Hazard Function
### Aliases: estimateNAH
### Keywords: survival sft

### ** Examples

x <- rexp(50, rate=.5)
censoring <- runif(50) < .90
H.NA <- estimateNAH(x, censoring)

# Plot the estimated cumulative hazard function
plot(H.NA$H, 
  main="Cumulative Hazard Function\n X ~ Exp(.5)    n=50", 
  xlab="X", ylab="H(x)")

# Plot 95% Confidence intervals
times <- seq(0,10, length.out=100)
lines(times, H.NA$H(times) + sqrt(H.NA$Var(times))*qnorm(1-.05/2), lty=2)
lines(times, H.NA$H(times) - sqrt(H.NA$Var(times))*qnorm(1-.05/2), lty=2)

# Plot the true cumulative hazard function
abline(0,.5, col='red')



