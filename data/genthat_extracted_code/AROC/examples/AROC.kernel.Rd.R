library(AROC)


### Name: AROC.kernel
### Title: Non parametric kernel-based estimation of the covariate-adjusted
###   ROC curve (AROC).
### Aliases: AROC.kernel

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

summary(m2)

plot(m2)
## End(No test)
## Don't show: 
m2 <- AROC.kernel(marker = "l_marker1", covariate = "age",
group = "status", tag.healthy = 0, data = newpsa, 
p = seq(0,1,l=101), B = 0)

summary(m2)

plot(m2)
## End(Don't show)



