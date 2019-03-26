library(KScorrect)


### Name: KScorrect-package
### Title: KScorrect: Lilliefors-Corrected Kolmogorov-Smirnov
###   Goodness-of-Fit Tests
### Aliases: KScorrect-package KScorrect

### ** Examples

# Get the package version and citation of KScorrect
packageVersion("KScorrect")
citation("KScorrect")

x <- runif(200)
Lc <- LcKS(x, cdf="pnorm", nreps=999)
hist(Lc$D.sim)
abline(v = Lc$D.obs, lty = 2)
print(Lc, max=50)  # Print first 50 simulated statistics
# Approximate p-value (usually) << 0.05

# Confirmation uncorrected version has increased Type II error rate when
#   using sample statistics to estimate parameters:
ks.test(x, "pnorm", mean(x), sd(x))   # p-value always larger, (usually) > 0.05

x <- rlunif(200, min=exp(1), max=exp(10)) # random loguniform sample
Lc <- LcKS(x, cdf="plnorm")
Lc$p.value      # Approximate p-value: (usually) << 0.05



