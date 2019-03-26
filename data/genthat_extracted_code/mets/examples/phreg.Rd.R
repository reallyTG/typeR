library(mets)


### Name: phreg
### Title: Fast Cox PH regression
### Aliases: phreg phreg.par robust.phreg readPhreg

### ** Examples

data(TRACE)
dcut(TRACE) <- ~.
out1 <- phreg(Surv(time,status==9)~vf+chf+strata(wmicat.4),data=TRACE)
## tracesim <- timereg::sim.cox(out1,1000)
## sout1 <- phreg(Surv(time,status==1)~vf+chf+strata(wmicat.4),data=tracesim)
## robust standard errors default 
summary(out1)

par(mfrow=c(1,2))
bplot(out1)
## bplot(sout1,se=TRUE)

## computing robust variance for baseline
rob1 <- robust.phreg(out1)
bplot(rob1,se=TRUE,robust=TRUE)

## making iid decomposition of regression parameters
betaiiid <- iid(out1)




