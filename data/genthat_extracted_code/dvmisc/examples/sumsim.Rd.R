library(dvmisc)


### Name: sumsim
### Title: Summarize Simulation Results
### Aliases: sumsim

### ** Examples

# For X ~ N(mu, sigma^2), the MLE for sigma^2 is the sample variance with n 
# in the denominator, but the unbiased version with (n - 1) is typically used 
# for its unbiasedness. Compare these estimators in 1,000 trials with n = 25. 
MLE <- c()
Unbiased <- c()
for (ii in 1: 1000) {
   x <- rnorm(n = 25)
   MLE[ii] <- sum((x - mean(x))^2) / 25
   Unbiased[ii] <- sum((x - mean(x))^2) / 24
 }
sumsim(estimates = cbind(MLE, Unbiased), truth = 1)




