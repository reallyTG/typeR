library(MixtureRegLTIC)


### Name: MixtureLogitAFT
### Title: Fit Logistic-AFT Location-Scale Mixture Regression Models
### Aliases: MixtureLogitAFT

### ** Examples

data(simLTICdataA)

##### fit the logistic-AFT location-scale model for LTIC data
fit=MixtureLogitAFT(formula=Surv(time1,time2,status)~1,
    eventprobreg=~X1,locationreg=~X1,scalereg=~X1,
    var.entry="entry",data=simLTICdataA)

##### print regression results of the fitted regression model
printMixture(fit)

##### plot estimated survival curves
#win.graph(width=18,height=10)
#par(mfrow=c(1,2))
plot.fit=plotMixture(fit)
legend(20,0.4,legend=plot.fit$legend,col=plot.fit$col,lty=plot.fit$lty,
       title=" Strata (Case / Total)")

plotD.fit=plotMixture(fit,dist="cond")
legend(3,0.4,legend=plotD.fit$legend,col=plotD.fit$col,lty=plotD.fit$lty,
       title=" Strata (Case / Total)")

##### estimate the NPMLE
est=NPMLEsurv(formula=Surv(time1,time2,status)~X1,var.entry="entry",data=simLTICdataA)

##### plot estimated event curves with both the regression model and NPMLE
#win.graph(width=18,height=10)
#par(mfrow=c(1,2))
plot.fit=plotMixture(fit,curve="event",col=c("red","blue"))
legend(20,1,legend=plot.fit$legend,col=plot.fit$col,lty=plot.fit$lty,
       title=" Strata (Case / Total)")
par(new=TRUE)
plot.NPMLE=plotNPMLEsurv(est,curve="event",lty=c(2,2),col=c("red","blue"))

plotD.fit=plotMixture(fit,curve="event",dist="cond",col=c("red","blue"))
legend(3,1,legend=plotD.fit$legend,col=plotD.fit$col,lty=plotD.fit$lty,
       title=" Strata (Case / Total)")
par(new=TRUE)
plotD.NPMLE=plotNPMLEsurv(est,dist="cond",curve="event",lty=c(2,2),col=c("red","blue"))




