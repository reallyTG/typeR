library(AROC)


### Name: compute.threshold.AROC.kernel
### Title: AROC-based threshold values.
### Aliases: compute.threshold.AROC.kernel

### ** Examples

library(AROC)
data(psa)
# Select the last measurement
newpsa <- psa[!duplicated(psa$id, fromLast = TRUE),]

# Log-transform the biomarker
newpsa$l_marker1 <- log(newpsa$marker1)
## No test: 
m2 <- AROC.kernel(marker = "l_marker1", covariate = "age",
group = "status", tag.healthy = 0, data = newpsa, 
p = seq(0,1,l=101), B = 500)

# Compute the threshold values
cov.values <- seq(52, 80, l = 50)
FPF = c(0.1, 0.3)

th_np <- compute.threshold.AROC.kernel(m2, cov.values, FPF)
## End(No test)
## Don't show: 
m2 <- AROC.kernel(marker = "l_marker1", covariate = "age",
group = "status", tag.healthy = 0, data = newpsa, 
p = seq(0,1,l=101), B = 0)

# Compute the threshold values
cov.values <- 52
FPF = c(0.1, 0.3)

th_np <- compute.threshold.AROC.kernel(m2, cov.values, FPF)
## End(Don't show)



