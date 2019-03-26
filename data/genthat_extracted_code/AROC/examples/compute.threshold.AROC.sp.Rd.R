library(AROC)


### Name: compute.threshold.AROC.sp
### Title: AROC-based threshold values.
### Aliases: compute.threshold.AROC.sp

### ** Examples

library(AROC)
data(psa)
# Select the last measurement
newpsa <- psa[!duplicated(psa$id, fromLast = TRUE),]

# Log-transform the biomarker
newpsa$l_marker1 <- log(newpsa$marker1)
## No test: 
m3 <- AROC.sp(formula.healthy = l_marker1 ~ age,
group = "status", tag.healthy = 0, data = newpsa,
p = seq(0,1,l=101), B = 500)

FPF = c(0.1, 0.3)
newdata <- data.frame(age = seq(52, 80, l = 50))

th_sp <- compute.threshold.AROC.sp(m3, newdata, FPF)
names(th_sp)
## End(No test)
## Don't show: 
m3 <- AROC.sp(formula.healthy = l_marker1 ~ age,
group = "status", tag.healthy = 0, data = newpsa,
p = seq(0,1,l=101), B = 0)

FPF = c(0.1, 0.3)
newdata <- data.frame(age = 52)

th_sp <- compute.threshold.AROC.sp(m3, newdata, FPF)
names(th_sp)
## End(Don't show)



