library(prodlim)


### Name: quantile.prodlim
### Title: Quantiles for Kaplan-Meier and Aalen-Johansen estimates.
### Aliases: quantile.prodlim
### Keywords: survival

### ** Examples

library(lava)
set.seed(1)
d=SimSurv(30)

# Quantiles of the potential followup time
g=prodlim(Hist(time,status)~1,data=d,reverse=TRUE)
quantile(g)

# survival time
f=prodlim(Hist(time,status)~1,data=d)
f1=prodlim(Hist(time,status)~X1,data=d)
# default: median and IQR
quantile(f)
quantile(f1)
# median alone
quantile(f,.5)
quantile(f1,.5)

# competing risks
set.seed(3)
dd = SimCompRisk(30)
ff=prodlim(Hist(time,event)~1,data=dd)
ff1=prodlim(Hist(time,event)~X1,data=dd)
## default: median and IQR
quantile(ff)
quantile(ff1)

print(quantile(ff1),na.val="NA")
print(quantile(ff1),na.val="Not reached")




