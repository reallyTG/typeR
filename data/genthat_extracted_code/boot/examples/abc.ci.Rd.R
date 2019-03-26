library(boot)


### Name: abc.ci
### Title: Nonparametric ABC Confidence Intervals
### Aliases: abc.ci
### Keywords: nonparametric htest

### ** Examples

## Don't show: 
op <- options(digits = 5)
## End(Don't show)
# 90% and 95% confidence intervals for the correlation 
# coefficient between the columns of the bigcity data

abc.ci(bigcity, corr, conf=c(0.90,0.95))

# A 95% confidence interval for the difference between the means of
# the last two samples in gravity
mean.diff <- function(y, w)
{    gp1 <- 1:table(as.numeric(y$series))[1]
     sum(y[gp1, 1] * w[gp1]) - sum(y[-gp1, 1] * w[-gp1])
}
grav1 <- gravity[as.numeric(gravity[, 2]) >= 7, ]
abc.ci(grav1, mean.diff, strata = grav1$series)
## Don't show: 
options(op)
## End(Don't show)



