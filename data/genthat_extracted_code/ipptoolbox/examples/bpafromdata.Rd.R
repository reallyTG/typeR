library(ipptoolbox)


### Name: bpafromdata
### Title: Generating BPAs from point / interval data
### Aliases: dsecdffit dslapconf dsksconf

### ** Examples

print("Create random data sets")
setofpoints=rnorm(20,0,1)
setofintervals=cbind(setofpoints-runif(20,0,1),setofpoints+runif(20,0,1))
print("Plot ecdf for both points and interval data")
ecdfp=dsecdffit(setofpoints)
dscdf(ecdfp)

ecdfi=dsecdffit(setofintervals)
dscdf(ecdfi)

print("Plot Laplace BPA for both points and interval data")
lapp=dslapconf(setofpoints,lim=c(-5,5))
dscdf(lapp)

lapi=dslapconf(setofintervals,lim=c(-5,5))
dscdf(lapi)

print("Plot Kolmogorov-Smirnov 75 percent bound BPA for both points and interval data")

ksp=dsksconf(setofpoints,conf=0.75,lim=c(-5,5))
dscdf(ksp)

ksi=dsksconf(setofintervals,conf=0.75,lim=c(-5,5))
dscdf(ksi)



