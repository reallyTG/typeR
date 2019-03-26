library(ph2bye)


### Name: bayes.design
### Title: Bayesian design method for sequentially monitoring patients
###   using Beta-Binomial posterior probability based on observing data
### Aliases: bayes.design

### ** Examples

# Using Multiple Myeloma (MM) data example
MM.r = rep(0,6); MM.mean = 0.1; MM.var = 0.0225
a <- MM.mean^2*(1-MM.mean)/MM.var - MM.mean; b <- MM.mean*(1-MM.mean)^2/MM.var - (1-MM.mean)
bayes.design(a=a,b=b,r=MM.r,stop.rule="futility",p0=0.1)

# Using Acute Promyelocytic Leukaemia (APL) data example
APL.r <- c(0,1,0,0,1,1); APL.mean = 0.3; APL.var = 0.0191
a <- APL.mean^2*(1-APL.mean)/APL.var - APL.mean; b <- APL.mean*(1-APL.mean)^2/APL.var - (1-APL.mean)
bayes.design(a=a,b=b,r=APL.r,stop.rule="efficacy",p0=0.1)



