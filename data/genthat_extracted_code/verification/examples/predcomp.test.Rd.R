library(verification)


### Name: predcomp.test
### Title: Time Series Prediction Comparison Test
### Aliases: predcomp.test losserr exponentialACV summary.predcomp.test
### Keywords: htest

### ** Examples

z0 <- arima.sim(list(order=c(2,0,0), ar=c(0.8,-0.2)), n=1000)
z1 <- c(z0[10:1000], z0[1:9]) + rnorm(1000, sd=0.5)
z2 <- arima.sim(list(order=c(3,0,1), ar=c(0.7,0,-0.1), ma=0.1), n=1000) + 
    abs(rnorm(1000, mean=1.25))

test <- predcomp.test(z0, z1, z2)
summary(test)

test2 <- predcomp.test(z0, z1, z2, test = "HG" )
summary(test2)

## Not run: 
##D test2 <- predcomp.test(z0, z1, z2, test = "HG" )
##D summary(test2)
##D 
##D test2.2 <- predcomp.test(z0, z1, z2, alternative="less")
##D summary(test2.2)
##D 
##D test3 <- predcomp.test(z0, z1, z2, lossfun.args=list(method="dtw") )
##D summary(test3)
##D 
##D test3.2 <- predcomp.test(z0, z1, z2, alternative="less",
##D     lossfun.args=list(method="dtw"), test = "HG" )
##D summary(test3.2)
##D 
##D test4 <- predcomp.test(z0, z1, z2, lossfun.args = list(method="corrskill"), test = "HG" )
##D summary(test4)
##D 
##D test5 <- predcomp.test(z0, z1, z2, lossfun.args = list(method="dtw", dtw.interr="sqerr"),
##D     test = "HG" )
##D summary(test5)
##D 
##D test5.2 <- predcomp.test(z0, z1, z2, alternative="less",
##D     lossfun.args=list(method="dtw", dtw.interr="sqerr"), test = "HG" )
##D summary(test5.2) 
## End(Not run)




