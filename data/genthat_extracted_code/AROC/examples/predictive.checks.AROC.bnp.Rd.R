library(AROC)


### Name: predictive.checks.AROC.bnp
### Title: Posterior predictive checks.
### Aliases: predictive.checks.AROC.bnp

### ** Examples

library(AROC)
data(psa)
# Select the last measurement
newpsa <- psa[!duplicated(psa$id, fromLast = TRUE),]

# Log-transform the biomarker
newpsa$l_marker1 <- log(newpsa$marker1)
## No test: 
m0 <- AROC.bnp(formula.healthy = l_marker1 ~ f(age, K = 0),
group = "status", tag.healthy = 0, data = newpsa, scale = TRUE,
p = seq(0,1,l=101), compute.lpml = TRUE, compute.WAIC = TRUE,
a = 2, b = 0.5, L = 10, nsim = 5000, nburn = 1000)

predictive.checks.AROC.bnp(m0, statistics = "skewness")
## End(No test)
## Don't show: 
m0 <- AROC.bnp(formula.healthy = l_marker1 ~ f(age, K = 0),
group = "status", tag.healthy = 0, data = newpsa, scale = TRUE,
p = seq(0,1,l=101), compute.lpml = TRUE, compute.WAIC = TRUE,
a = 2, b = 0.5, L = 10, nsim = 500, nburn = 100)

predictive.checks.AROC.bnp(m0, statistics = "skewness")
## End(Don't show)



