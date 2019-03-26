library(MixtureRegLTIC)


### Name: plotMmixture
### Title: Plot Survival/Event Curve(s) from the Fitted Regression Model
### Aliases: plotMixture

### ** Examples

data(simLTICdataE)

##### fit the logistic-AFT location-scale model for LTIC data
fit=MixtureLogitAFT(formula=Surv(time1,time2,status)~1,
    eventprobreg=~X1,locationreg=~X1+X2,scalereg=~X1+X2,
    var.entry="entry",var.mixturetype="mtype",data=simLTICdataE)

##### print regression results of the fitted model
printMixture(fit)

##### plot estimated event curves of the fitted model
#win.graph(width=18,height=10)
#par(mfrow=c(1,2))
plot.fit=plotMixture(fit,curve="event",col=c("red","blue","deeppink"))
legend(55,0.95,legend=plot.fit$legend,col=plot.fit$col,lty=plot.fit$lty,
       title=" Strata (Case / Total)",cex=0.85)

plotD.fit=plotMixture(fit,dist="cond",curve="event",col=c("red","blue","deeppink"))
legend(3,0.95,legend=plotD.fit$legend,col=plotD.fit$col,lty=plotD.fit$lty,
       title=" Strata (Case / Total)",cex=0.85)




