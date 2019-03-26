library(mets)


### Name: prob.exceed.recurrent
### Title: Estimation of probability of more that k events for recurrent
###   events process
### Aliases: prob.exceed.recurrent prob.exceedRecurrent
###   prob.exceedBiRecurrent

### ** Examples


########################################
## getting some rates to mimick 
########################################

data(base1cumhaz)
data(base4cumhaz)
data(drcumhaz)
dr <- drcumhaz
base1 <- base1cumhaz
base4 <- base4cumhaz

cor.mat <- corM <- rbind(c(1.0, 0.6, 0.9), c(0.6, 1.0, 0.5), c(0.9, 0.5, 1.0))
rr <- simRecurrent(1000,base1,cumhaz2=base4,death.cumhaz=dr)
rr <-  count.history(rr)
dtable(rr,~death+status)

oo <- prob.exceedRecurrent(rr,1)
bplot(oo)

par(mfrow=c(1,2))
with(oo,plot(time,mu,col=2,type="l"))
###
with(oo,plot(time,varN,type="l"))


### Bivariate probability of exceeding 
oo <- prob.exceedBiRecurrent(rr,1,2,exceed1=c(1,5,10),exceed2=c(1,2,3))
with(oo, matplot(time,pe1e2,type="s"))
nc <- ncol(oo$pe1e2)
legend("topleft",legend=colnames(oo$pe1e2),lty=1:nc,col=1:nc)


## No test: 
### do not test to avoid dependence on prodlim 
### now estimation based on cumualative incidence, but do not test to avoid dependence on prodlim 
library(prodlim)
pp <- prob.exceed.recurrent(rr,1,status="status",death="death",start="entry",stop="time",id="id")
with(pp, matplot(times,prob,type="s"))
###
with(pp, matlines(times,se.lower,type="s"))
with(pp, matlines(times,se.upper,type="s"))
## End(No test)



