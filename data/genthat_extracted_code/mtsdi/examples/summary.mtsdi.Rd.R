library(mtsdi)


### Name: summary.mtsdi
### Title: Summary Information
### Aliases: summary.mtsdi
### Keywords: NA multivariate ts smooth

### ** Examples

data(miss)
f <- ~c31+c32+c33+c34+c35
i <- mnimput(f,miss,eps=1e-3,ts=TRUE, method="spline",sp.control=list(df=c(7,7,7,7,7)))
summary(i)



