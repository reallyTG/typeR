library(AROC)


### Name: compute.threshold.AROC.bsp
### Title: AROC-based threshold values.
### Aliases: compute.threshold.AROC.bsp

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

# Compute the threshold values
FPF = c(0.1, 0.3)
newdata <- data.frame(age = seq(52, 80, l = 50))

th_bsp <- compute.threshold.AROC.bsp(m1, newdata, FPF)
names(th_bsp)
## End(No test)
## Don't show: 
m1 <- AROC.bsp(formula.healthy = l_marker1 ~ age,
group = "status", tag.healthy = 0, data = newpsa, scale = TRUE,
p = seq(0,1,l=101), compute.lpml = TRUE, compute.WAIC = TRUE,
a = 2, b = 0.5, nsim = 500, nburn = 150)

# Compute the threshold values
FPF = c(0.1, 0.3)
newdata <- data.frame(age = 52)

th_bsp <- compute.threshold.AROC.bsp(m1, newdata, FPF)
names(th_bsp)
## End(Don't show)



