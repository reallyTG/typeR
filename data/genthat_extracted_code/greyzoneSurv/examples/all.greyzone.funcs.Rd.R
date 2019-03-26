library(greyzoneSurv)


### Name: greyzone.funcs
### Title: Fit a Grey-Zone Model with Survival Data
### Aliases: em.func cov.func greyzone.func

### ** Examples

#use the package data "mydata" to fit the grey-zone model in 3 steps
data(mydata)
dim(mydata)
head(mydata)

#~step 1: extract information needed for fitting the model and 
#make some initial guesses of some parameter values 
n=nrow(mydata)
y=mydata$time/365.25
delta=mydata$event
score=mydata$x
x=cbind(rep(1, n), score)

#~step 2: get EM estimates and variance-covariance matrix
results.em=em.func(initial.values=NULL, y=y, delta=delta, x=x)
is.na(results.em$em.error)
#only if above is true, you should proceed; otherwise try a different set 
#of intial values and try calling em.func again
names(results.em)
#after you successfully get an EM solution proceed to get the variance-covariance matrix
results.cov=cov.func(results.em, y=y, delta=delta, x=x)
names(results.cov)

#~step 3: when there are no errors above proceed to calculate the grey zone
results=greyzone.func(results.cov, y, delta, x, plot.logistic=FALSE)
names(results)
!is.na(results$greyzone.ll) & !is.na(results$greyzone.ul)
#only when above is true, you have a grey-zone solution and you can proceed
#sometimes there is not a grey-zone solution even if the EM fitting is successful.
#In that case, it means the grey-zone model is not a good fit for the data.
score3=rep(0, n)
score3[score>=results$greyzone.ll & score<results$greyzone.ul]=1
score3[score>=results$greyzone.ul]=2
#if you get through steps 1-3, you are done fitting the grey-zone model!

#now you may want to compare with a 2-group model, so fit a 2-group model 
res=bestcut2(data=mydata, stime='time', sind='event', var='x')
score2=res[,'bestcut2']

#then compare the 2-group and grey-zone models, but note here we compare on the training data
#ideally we want to compare them on a test data set
cox.2group=cox.summary(stime=mydata$time, sind=mydata$event, var=score2)
cox.3group=cox.summary(stime=mydata$time, sind=mydata$event, var=score3)
cox.2group
cox.3group
fit.2group = survfit(Surv(mydata$time, mydata$event)~score2)
fit.3group = survfit(Surv(mydata$time, mydata$event)~score3)
par(mfrow=c(1,2))
plot(fit.2group, lty=1:2, main='2-group model', las=1, 
    ylab='Probability of Survival', xlab='Days from Time 0')
plot(fit.3group, lty=1:3, main='grey-zone model', las=1, 
    ylab='Probability of Survival', xlab='Days from Time 0')




