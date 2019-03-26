library(AROC)


### Name: compute.threshold.AROC.bnp
### Title: AROC-based threshold values.
### Aliases: compute.threshold.AROC.bnp

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

# Compute the threshold values
FPF = c(0.1, 0.3)
newdata <- data.frame(age = seq(52, 80, l = 50))

th_bnp <- compute.threshold.AROC.bnp(m0, newdata, FPF)
names(th_bnp)
## End(No test)
## Don't show: 

m0 <- AROC.bnp(formula.healthy = l_marker1 ~ f(age, K = 0),
group = "status", tag.healthy = 0, data = newpsa, scale = TRUE,
p = seq(0,1,l=101), compute.lpml = TRUE, compute.WAIC = TRUE,
a = 2, b = 0.5, L = 10, nsim = 500, nburn = 100)

# Compute the threshold values
FPF = c(0.1, 0.3)
newdata <- data.frame(age = 52)

th_bnp <- compute.threshold.AROC.bnp(m0, newdata, FPF)
names(th_bnp)
## End(Don't show)



