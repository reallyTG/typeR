library(mets)


### Name: twin.clustertrunc
### Title: Estimation of twostage model with cluster truncation in
###   bivariate situation
### Aliases: twin.clustertrunc

### ** Examples

library("timereg")
data(diabetes)
v <- diabetes$time*runif(nrow(diabetes))*rbinom(nrow(diabetes),1,0.5)
diabetes$v <- v

aout <- twin.clustertrunc(Surv(v,time,status)~1+treat+adult,
		 data=diabetes,clusters="id")
aout$two        ## twostage output
par(mfrow=c(2,2))
plot(aout$marg) ## marginal model output

out <- twin.clustertrunc(Surv(v,time,status)~1+prop(treat)+prop(adult),
		 data=diabetes,clusters="id")
out$two        ## twostage output
plot(out$marg) ## marginal model output



