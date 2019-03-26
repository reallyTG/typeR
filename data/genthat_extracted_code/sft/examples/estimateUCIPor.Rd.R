library(sft)


### Name: estimateUCIPor
### Title: UCIP Performance on OR Tasks
### Aliases: estimateUCIPor
### Keywords: sft

### ** Examples

# Channel completion times and accuracy
rt1 <- rexp(100, rate=.5)
cr1 <- runif(100) < .90
rt2 <- rexp(100, rate=.4)
cr2 <- runif(100) < .95
Hucip = estimateUCIPor(list(rt1, rt2), list(cr1, cr2))


# Plot the estimated UCIP cumulative hazard function
plot(Hucip$H, do.p=FALSE, 
  main="Estimated UCIP Cumulative Hazard Function\n
    X~min(X1,X2)    X1~Exp(.5)    X2~Exp(.4)", 
  xlab="X", ylab="H_UCIP(t)")
# Plot 95% Confidence intervals
times <- seq(0,10, length.out=100)
lines(times, Hucip$H(times) + sqrt(Hucip$Var(times))*qnorm(1-.05/2), lty=2)
lines(times, Hucip$H(times) - sqrt(Hucip$Var(times))*qnorm(1-.05/2), lty=2)
#Plot true UCIP cumulative hazard function
abline(0,.9, col='red')



