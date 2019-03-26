library(sft)


### Name: estimateNAK
### Title: Neslon-Aalen Estimator of the Reverse Cumulative Hazard Function
### Aliases: estimateNAK
### Keywords: survival sft

### ** Examples

x <- rexp(50, rate=.5)
censoring <- runif(50) < .90
K.NA <- estimateNAK(x, censoring)

# Plot the estimated cumulative reverse hazard function
plot(K.NA$K, 
  main="Cumulative Reverse Hazard Function\n X ~ Exp(.5)    n=50", 
  xlab="X", ylab="K(x)")

# Plot 95% Confidence intervals
times <- seq(0,10, length.out=100)
lines(times, K.NA$K(times) + sqrt(K.NA$Var(times))*qnorm(1-.05/2), lty=2)
lines(times, K.NA$K(times) - sqrt(K.NA$Var(times))*qnorm(1-.05/2), lty=2)

# Plot the true cumulative reverse hazard function
lines(times, log(pexp(times, .5)), col='red')



