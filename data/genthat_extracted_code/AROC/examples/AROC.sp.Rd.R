library(AROC)


### Name: AROC.sp
### Title: Semiparametric frequentist inference of the covariate-adjusted
###   ROC curve (AROC).
### Aliases: AROC.sp

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

summary(m3)

plot(m3)
## End(No test)
## Don't show: 
m3 <- AROC.sp(formula.healthy = l_marker1 ~ age,
group = "status", tag.healthy = 0, data = newpsa,
p = seq(0,1,l=101), B = 0)

summary(m3)

plot(m3)
## End(Don't show)



