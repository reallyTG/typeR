library(unmarked)


### Name: ranef-methods
### Title: Methods for Function 'ranef' in Package 'unmarked'
### Aliases: ranef ranef-methods ranef,unmarkedFitOccu-method
###   ranef,unmarkedFitOccuFP-method ranef,unmarkedFitOccuRN-method
###   ranef,unmarkedFitPCount-method ranef,unmarkedFitMPois-method
###   ranef,unmarkedFitDS-method ranef,unmarkedFitGMM-method
###   ranef,unmarkedFitGDS-method ranef,unmarkedFitGPC-method
###   ranef,unmarkedFitGMMorGDS-method ranef,unmarkedFitColExt-method
###   ranef,unmarkedFitPCO-method
### Keywords: methods

### ** Examples

# Simulate data under N-mixture model
set.seed(4564)
R <- 20
J <- 5
N <- rpois(R, 10)
y <- matrix(NA, R, J)
y[] <- rbinom(R*J, N, 0.5)

# Fit model
umf <- unmarkedFramePCount(y=y)
fm <- pcount(~1 ~1, umf, K=50)

# Estimates of conditional abundance distribution at each site
(re <- ranef(fm))
# Best Unbiased Predictors
bup(re, stat="mean")           # Posterior mean
bup(re, stat="mode")           # Posterior mode
confint(re, level=0.9) # 90% CI

# Plots
plot(re, subset=site %in% c(1:10), layout=c(5, 2), xlim=c(-1,20))

# Compare estimates to truth
sum(N)
sum(bup(re))

# Extract all values in convenient formats
post.df <- as(re, "data.frame")
head(post.df)
post.arr <- as(re, "array")





