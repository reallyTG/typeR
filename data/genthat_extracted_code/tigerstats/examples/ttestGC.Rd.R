library(tigerstats)


### Name: ttestGC
### Title: t-Procedures
### Aliases: ttestGC

### ** Examples

#One-sample t, 95%-confidence interval only:
ttestGC(~fastest,data=m111survey)

#For other confidence levels, set argument conf.level as desired.  For 90%-interval:
ttestGC(~fastest,data=m111survey,conf.level=0.90)

# One-sample t, 95%-confidence interval and two-sided test with H_0:  mu = 100:
ttestGC(~fastest,data=m111survey,mu=100)

#Two-sample t, 95%-confidence interval only:
ttestGC(fastest~sex,data=m111survey)

#control order of groups with argument first:
ttestGC(fastest~sex,data=m111survey,first="male")

# Matched pairs, confidence interval with one-sided test, H_0: mu-d = 0:
ttestGC(~ideal_ht-height,data=m111survey,mu=0,alternative="greater")

#Summary data, one sample, one-sided test with H_0:  mu = 52.5:
ttestGC(mean=55,sd=4,n=16,mu=52.5,alternative="greater")

#Summary data, two samples:
ttestGC(mean=c(50,55),sd=c(3,4),n=c(25,40),mu=0)



