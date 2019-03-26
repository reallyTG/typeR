library(MPLikelihoodWB)


### Name: mplik.wb.bi
### Title: Modified profile likelihood function of Weibull regression
###   parameters
### Aliases: mplik.wb.bi
### Keywords: Weibull regression model

### ** Examples

dat <- data.weibull(n = 40, shape=2, regco=c(2,1.5,3,2.5))

mplik.wb.bi(par=c(1,1,1,1,1,1),Y=dat$ftime,X=model.matrix(ftime~x1+x2+x3+x4,data=dat),
delta=dat$delta,whc=2)



