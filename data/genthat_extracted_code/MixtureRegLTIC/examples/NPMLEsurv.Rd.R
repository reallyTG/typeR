library(MixtureRegLTIC)


### Name: NPMLEsurv
### Title: Estimate Overall and Conditional Survival/Event Curve(s) Based
###   on the NPMLE for LTIC Data
### Aliases: NPMLEsurv

### ** Examples

data(simLTICdataA)

##### estimate the NPMLE
est=NPMLEsurv(formula=Surv(time1,time2,status)~X1,var.entry="entry",data=simLTICdataA)

### plot estimated survival curves with NPMLE
#win.graph(width=18,height=10)
#par(mfrow=c(1,2))
plot.NPMLE=plotNPMLEsurv(est,lty=c(2,2),col=c("red","blue"))
legend(20,0.4,legend=plot.NPMLE$legend,col=plot.NPMLE$col,lty=plot.NPMLE$lty,
       title=" Strata (Case / Total)")

plotD.NPMLE=plotNPMLEsurv(est,dist="cond",lty=c(2,2),col=c("red","blue"))
legend(3,0.4,legend=plotD.NPMLE$legend,col=plotD.NPMLE$col,lty=plotD.NPMLE$lty,
       title=" Strata (Case / Total)")




