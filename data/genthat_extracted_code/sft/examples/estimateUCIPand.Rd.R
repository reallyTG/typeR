library(sft)


### Name: estimateUCIPand
### Title: UCIP Performance on AND Tasks
### Aliases: estimateUCIPand
### Keywords: sft

### ** Examples

# Channel completion times and accuracy
rt1 <- rexp(100, rate=.5)
cr1 <- runif(100) < .90
rt2 <- rexp(100, rate=.4)
cr2 <- runif(100) < .95
Kucip = estimateUCIPand(list(rt1, rt2), list(cr1, cr2))


# Plot the estimated UCIP cumulative reverse hazard function
plot(Kucip$K, do.p=FALSE, 
  main="Estimated UCIP Cumulative Reverse Hazard Function\n
    X~max(X1,X2)    X1~Exp(.5)    X2~Exp(.4)", 
  xlab="X", ylab="K_UCIP(x)")
# Plot 95% Confidence intervals
times <- seq(0,10, length.out=100)
lines(times, Kucip$K(times) + sqrt(Kucip$Var(times))*qnorm(1-.05/2), lty=2)
lines(times, Kucip$K(times) - sqrt(Kucip$Var(times))*qnorm(1-.05/2), lty=2)
# Plot true UCIP cumulative reverse hazard function
lines(times[-1], log(pexp(times[-1], .5)) + log(pexp(times[-1], .4)), col='red')




