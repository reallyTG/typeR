library(AROC)


### Name: predictive.checks.AROC.bsp
### Title: Posterior predictive checks.
### Aliases: predictive.checks.AROC.bsp

### ** Examples

library(AROC)
data(psa)
# Select the last measurement
newpsa <- psa[!duplicated(psa$id, fromLast = TRUE),]

# Log-transform the biomarker
newpsa$l_marker1 <- log(newpsa$marker1)
## No test: 
m1 <- AROC.bsp(formula.healthy = l_marker1 ~ age,
group = "status", tag.healthy = 0, data = newpsa, scale = TRUE,
p = seq(0,1,l=101), compute.lpml = TRUE, compute.WAIC = TRUE,
a = 2, b = 0.5, nsim = 5000, nburn = 1500)

predictive.checks.AROC.bsp(m1, statistics = "mean")
## End(No test)
## Don't show: 
m1 <- AROC.bsp(formula.healthy = l_marker1 ~ age,
group = "status", tag.healthy = 0, data = newpsa, scale = TRUE,
p = seq(0,1,l=101), compute.lpml = TRUE, compute.WAIC = TRUE,
a = 2, b = 0.5, nsim = 500, nburn = 100)

predictive.checks.AROC.bsp(m1, statistics = "mean")
## End(Don't show)



