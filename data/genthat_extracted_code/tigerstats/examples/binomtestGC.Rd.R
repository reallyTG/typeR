library(tigerstats)


### Name: binomtestGC
### Title: Exact Procedures for a Single Proportion
### Aliases: binomtestGC

### ** Examples

#Confidence interval only:
binomtestGC(~sex,data=m111survey,success="female")

#Confidence interval and two-sided test, Null Hypothesis p = 0.5:
binomtestGC(~sex,data=m111survey,success="female",p=0.5)

#For confidence level other than 95%, use conf.level argument.
#For 90% interval:
binomtestGC(~sex,data=m111survey,success="female",conf.level=0.90)

#For one-sided test, set alternative argument as desired:
binomtestGC(~sex,data=m111survey,p=0.50,
    success="female",alternative="greater")

#Summary data:
#In one sample, 40 successes in 100 trials.  Testing whether p = 0.45.
binomtestGC(x=40,n=100,p=0.45)



