library(rms)


### Name: sensuc
### Title: Sensitivity to Unmeasured Covariables
### Aliases: sensuc plot.sensuc
### Keywords: regression htest models survival

### ** Examples

set.seed(17)
x <- sample(0:1, 500,TRUE)
y <- sample(0:1, 500,TRUE)
y[1:100] <- x[1:100]  # induce an association between x and y
x2 <- rnorm(500)


f <- lrm(y ~ x + x2, x=TRUE, y=TRUE)


#Note: in absence of U odds ratio for x is exp(2nd coefficient)


g <- sensuc(f, c(1,3))


# Note: If the generated sample of U was typical, the odds ratio for
# x dropped had U been known, where U had an odds ratio
# with x of 3 and an odds ratio with y of 3


plot(g)


# Fit a Cox model and check sensitivity to an unmeasured confounder


# f <- cph(Surv(d.time,death) ~ treatment + pol(age,2)*sex, x=TRUE, y=TRUE)
# sensuc(f, event=function(y) y[,2] & y[,1] < 365.25 )
# Event = failed, with event time before 1 year
# Note: Analysis uses f$y which is a 2-column Surv object



