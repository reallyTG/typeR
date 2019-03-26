## Problem in 1 parameter to ensure methods work in trivial case
require(nlsr)
cat("1 parameter problem\n")
nobs<-8
tt <- seq(1,nobs)
dd <- 1.23*tt + 4*runif(nobs)

df <- data.frame(tt, dd)
print(df)
a1par<-nlxb(dd ~ a*tt, start=c(a=1), data=df)
a1par

