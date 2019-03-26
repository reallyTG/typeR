library(KScorrect)


### Name: LcKS
### Title: Lilliefors-corrected Kolmogorov-Smirnov Goodness-Of-Fit Test
### Aliases: LcKS

### ** Examples

x <- runif(200)
Lc <- LcKS(x, cdf="pnorm", nreps=999)
hist(Lc$D.sim)
abline(v = Lc$D.obs, lty = 2)
print(Lc, max=50)  # Print first 50 simulated statistics
# Approximate p-value (usually) << 0.05

# Confirmation uncorrected version has increased Type II error rate when
#   using sample statistics to estimate parameters:
ks.test(x, "pnorm", mean(x), sd(x))   # p-value always larger, (usually) > 0.05

# Confirm critical values for normal distribution are correct
nreps <- 9999
x <- rnorm(25)
Lc <- LcKS(x, "pnorm", nreps=nreps)
sim.Ds <- sort(Lc$D.sim)
crit <- round(c(.8, .85, .9, .95, .99) * nreps, 0)
# Lilliefors' (1967) critical values, using improved values from
#   Parsons & Wirsching (1982) (for n=25):
# 0.141 0.148 0.157 0.172 0.201
round(sim.Ds[crit], 3)			# Approximately the same critical values

# Confirm critical values for exponential are the same as reported by Lilliefors (1969)
nreps <- 9999
x <- rexp(25)
Lc <- LcKS(x, "pexp", nreps=nreps)
sim.Ds <- sort(Lc$D.sim)
crit <- round(c(.8, .85, .9, .95, .99) * nreps, 0)
# Lilliefors' (1969) critical values (for n=25):
# 0.170 0.180 0.191 0.210 0.247
round(sim.Ds[crit], 3)			# Approximately the same critical values

## Not run: 
##D # Gamma and Weibull tests require functions from the 'MASS' package
##D # Takes time for maximum likelihood optimization of statistics
##D require(MASS)
##D x <- runif(100, min=1, max=100)
##D Lc <- LcKS(x, cdf="pgamma", nreps=499)
##D Lc$p.value
##D 
##D # Confirm critical values for Weibull the same as reported by Parsons & Wirsching (1982)
##D nreps <- 9999
##D x <- rweibull(25, shape=1, scale=1)
##D Lc <- LcKS(x, "pweibull", nreps=nreps)
##D sim.Ds <- sort(Lc$D.sim)
##D crit <- round(c(.8, .85, .9, .95, .99) * nreps, 0)
##D # Parsons & Wirsching (1982) critical values (for n=25):
##D # 0.141 0.148 0.157 0.172 0.201
##D round(sim.Ds[crit], 3)			# Approximately the same critical values
##D 
##D # Mixture test requires functions from the 'mclust' package
##D # Takes time to identify model parameters
##D require(mclust)
##D x <- rmixnorm(200, mean=c(10, 20), sd=2, pro=c(1,3))
##D Lc <- LcKS(x, cdf="pmixnorm", nreps=499, G=1:9)   # Default G (1:9) takes long time
##D Lc$p.value
##D G <- Mclust(x)$parameters$variance$G              # Optimal model has only two components
##D Lc <- LcKS(x, cdf="pmixnorm", nreps=499, G=G)     # Restricting to likely G saves time
##D # But note changes null hypothesis: now testing against just two-component mixture
##D Lc$p.value
## End(Not run)




