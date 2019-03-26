library(relsurv)


### Name: rs.surv.rsadd
### Title: Compute a Relative Survival Curve from an additive relative
###   survival model
### Aliases: rs.surv.rsadd
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
#fit a relative survival model
fit <- rsadd(Surv(time,cens)~sex+age+year,rmap=list(age=age*365.241),
	ratetable=slopop,data=rdata,int=c(0:10,15))

#calculate the predicted curve for a male individual, aged 65, diagnosed in 1982
d <- rs.surv.rsadd(fit,newdata=data.frame(sex=1,age=65,year=as.date("1Jul1982")))
#plot the curve (will result in a step function since the baseline is assumed piecewise constant)
plot(d,xscale=365.241)

#calculate the predicted survival curves for each individual in the data set
d <- rs.surv.rsadd(fit,newdata=rdata)
#calculate the average over all predicted survival curves
p.surv <- apply(d$surv,1,mean)
#plot the relative survival curve
plot(d$time/365.241,p.surv,type="b",ylim=c(0,1),xlab="Time",ylab="Relative survival")



