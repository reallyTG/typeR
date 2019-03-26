library(survPen)


### Name: survPen
### Title: (Excess) hazard model with (multidimensional) penalized splines
###   and integrated smoothness estimation
### Aliases: survPen

### ** Examples


## No test: 

library(survPen)
data(datCancer) # simulated dataset with 2000 individuals diagnosed with cervical cancer

#-------------------------------------------------------- example 0
# Comparison between restricted cubic splines and penalized restricted cubic splines

library(splines)

# unpenalized
f <- ~ns(fu,knots=c(0.25, 0.5, 1, 2, 4),Boundary.knots=c(0,5))

mod <- survPen(f,data=datCancer,t1=fu,event=dead)

# penalized
f.pen <- ~ smf(fu,knots=c(0,0.25, 0.5, 1, 2, 4,5)) # careful here: the boundary knots are included

mod.pen <- survPen(f.pen,data=datCancer,t1=fu,event=dead)

# predictions

new.time <- seq(0,5,length=50)
pred <- predict(mod,data.frame(fu=new.time))
pred.pen <- predict(mod.pen,data.frame(fu=new.time))

par(mfrow=c(1,1))
plot(new.time,pred$haz,type="l",ylim=c(0,0.2),main="hazard vs time",
xlab="time since diagnosis (years)",ylab="hazard",col="red")
lines(new.time,pred.pen$haz,col="blue3")
legend("topright",legend=c("unpenalized","penalized"),
col=c("red","blue3"),lty=rep(1,2))



#-------------------------------------------------------- example 1
# hazard models with unpenalized formulas compared to a penalized tensor product smooth

library(survPen)
data(datCancer) # simulated dataset with 2000 individuals diagnosed with cervical cancer

# constant hazard model
f.cst <- ~1
mod.cst <- survPen(f.cst,data=datCancer,t1=fu,event=dead)

# piecewise constant hazard model
f.pwcst <- ~cut(fu,breaks=seq(0,5,by=0.5),include.lowest=TRUE)
mod.pwcst <- survPen(f.pwcst,data=datCancer,t1=fu,event=dead,n.legendre=200)
# we increase the number of points for Gauss-Legendre quadrature to make sure that the cumulative
# hazard is properly approximated

# linear effect of time
f.lin <- ~fu
mod.lin <- survPen(f.lin,data=datCancer,t1=fu,event=dead)

# linear effect of time and age with proportional effect of age
f.lin.age <- ~fu+age
mod.lin.age <- survPen(f.lin.age,data=datCancer,t1=fu,event=dead)

# linear effect of time and age with time-dependent effect of age (linear)
f.lin.inter.age <- ~fu*age
mod.lin.inter.age <- survPen(f.lin.inter.age,data=datCancer,t1=fu,event=dead)

# cubic B-spline of time with a knot at 1 year, linear effect of age and time-dependent effect
# of age with a quadratic B-spline of time with a knot at 1 year
library(splines)
f.spline.inter.age <- ~bs(fu,knots=c(1),Boundary.knots=c(0,5))+age+
age:bs(fu,knots=c(1),Boundary.knots=c(0,5),degree=2)
# here, bs indicates an unpenalized cubic spline

mod.spline.inter.age <- survPen(f.spline.inter.age,data=datCancer,t1=fu,event=dead)


# tensor of time and age
f.tensor <- ~tensor(fu,age)
mod.tensor <- survPen(f.tensor,data=datCancer,t1=fu,event=dead)


# predictions of the models at age 60

new.time <- seq(0,5,length=50)
pred.cst <- predict(mod.cst,data.frame(fu=new.time))
pred.pwcst <- predict(mod.pwcst,data.frame(fu=new.time))
pred.lin <- predict(mod.lin,data.frame(fu=new.time))
pred.lin.age <- predict(mod.lin.age,data.frame(fu=new.time,age=60))
pred.lin.inter.age <- predict(mod.lin.inter.age,data.frame(fu=new.time,age=60))
pred.spline.inter.age <- predict(mod.spline.inter.age,data.frame(fu=new.time,age=60))
pred.tensor <- predict(mod.tensor,data.frame(fu=new.time,age=60))

lwd1 <- 2

par(mfrow=c(1,1))
plot(new.time,pred.cst$haz,type="l",ylim=c(0,0.2),main="hazard vs time",
xlab="years since diagnosis",ylab="hazard",col="blue3",lwd=lwd1)
segments(x0=new.time[1:49],x1=new.time[2:50],y0=pred.pwcst$haz[1:49],col="lightblue2",lwd=lwd1)
lines(new.time,pred.lin$haz,col="green3",lwd=lwd1)
lines(new.time,pred.lin.age$haz,col="yellow",lwd=lwd1)
lines(new.time,pred.lin.inter.age$haz,col="orange",lwd=lwd1)
lines(new.time,pred.spline.inter.age$haz,col="red",lwd=lwd1)
lines(new.time,pred.tensor$haz,col="black",lwd=lwd1)
legend("topright",
legend=c("cst","pwcst","lin","lin.age","lin.inter.age","spline.inter.age","tensor"),
col=c("blue3","lightblue2","green3","yellow","orange","red","black"),
lty=rep(1,7),lwd=rep(lwd1,7))


# you can also calculate the hazard yourself with the lpmatrix option.
# For example, compare the following predictions:
haz.tensor <- pred.tensor$haz

X.tensor <- predict(mod.tensor,data.frame(fu=new.time,age=60),type="lpmatrix")
haz.tensor.lpmatrix <- exp(X.tensor%*%mod.tensor$coefficients)

summary(haz.tensor.lpmatrix - haz.tensor)

#---------------- The 95% confidence intervals can be calculated like this:

# standard errors from the Bayesian covariance matrix Vp
std <- sqrt(rowSums((X.tensor%*%mod.tensor$Vp)*X.tensor))

qt.norm <- stats::qnorm(1-(1-0.95)/2)
haz.inf <- as.vector(exp(X.tensor%*%mod.tensor$coefficients-qt.norm*std))
haz.sup <- as.vector(exp(X.tensor%*%mod.tensor$coefficients+qt.norm*std))

# checking that they are similar to the ones given by the predict function
summary(haz.inf - pred.tensor$haz.inf)
summary(haz.sup - pred.tensor$haz.sup)


#-------------------------------------------------------- example 2

library(survPen)
data(datCancer) # simulated dataset with 2000 individuals diagnosed with cervical cancer

# model : unidimensional penalized spline for time since diagnosis with 5 knots
f1 <- ~smf(fu,df=5)
# when knots are not specified, quantiles are used. For example, for the term "smf(x,df=df1)",
# the vector of knots will be: quantile(unique(x),seq(0,1,length=df1)) 

# you can specify your own knots if you want
# f1 <- ~smf(fu,knots=c(0,1,3,6,8))

# hazard model
mod1 <- survPen(f1,data=datCancer,t1=fu,event=dead,expected=NULL,method="LAML")
summary(mod1)

# to see where the knots were placed
mod1$list.smf

# with LCV instead of LAML
mod1bis <- survPen(f1,data=datCancer,t1=fu,event=dead,expected=NULL,method="LCV")
summary(mod1bis)

# hazard model taking into account left truncation (not representative of cancer data, 
# the begin variable was simulated for illustration purposes only)
mod2 <- survPen(f1,data=datCancer,t0=begin,t1=fu,event=dead,expected=NULL,method="LAML")
summary(mod2)

# excess hazard model
mod3 <- survPen(f1,data=datCancer,t1=fu,event=dead,expected=rate,method="LAML")
summary(mod3)

# compare the predictions of the models
new.time <- seq(0,5,length=50)
pred1 <- predict(mod1,data.frame(fu=new.time))
pred1bis <- predict(mod1bis,data.frame(fu=new.time))
pred2 <- predict(mod2,data.frame(fu=new.time))
pred3 <- predict(mod3,data.frame(fu=new.time))

# LAML vs LCV
par(mfrow=c(1,2))
plot(new.time,pred1$haz,type="l",ylim=c(0,0.2),main="LCV vs LAML",
xlab="years since diagnosis",ylab="hazard")
lines(new.time,pred1bis$haz,col="blue3")
legend("topright",legend=c("LAML","LCV"),col=c("black","blue3"),lty=c(1,1))

plot(new.time,pred1$surv,type="l",ylim=c(0,1),main="LCV vs LAML",
xlab="years since diagnosis",ylab="survival")
lines(new.time,pred1bis$surv,col="blue3")


# no truncation vs truncation
par(mfrow=c(1,2))
plot(new.time,pred1$haz,type="l",ylim=c(0,0.2),main="no truncation vs truncation",
xlab="years since diagnosis",ylab="hazard")
lines(new.time,pred2$haz,col="red")
legend("topright",legend=c("no trunc","trunc"),col=c("black","red"),lty=c(1,1))

plot(new.time,pred1$surv,type="l",ylim=c(0,1),main="no truncation vs truncation",
xlab="years since diagnosis",ylab="survival")
lines(new.time,pred2$surv,col="red")


# hazard vs excess hazard
par(mfrow=c(1,2))
plot(new.time,pred1$haz,type="l",ylim=c(0,0.2),main="hazard vs excess hazard",
xlab="years since diagnosis",ylab="hazard")
lines(new.time,pred3$haz,col="green3")
legend("topright",legend=c("overall","excess"),col=c("black","green3"),lty=c(1,1))

plot(new.time,pred1$surv,type="l",ylim=c(0,1),main="survival vs net survival",
xlab="time",ylab="survival")
lines(new.time,pred3$surv,col="green3")
legend("topright",legend=c("overall survival","net survival"), col=c("black","green3"), lty=c(1,1)) 

# hazard vs excess hazard with 95% Bayesian confidence intervals (based on Vp matrix, 
# see predict.survPen)
par(mfrow=c(1,1))
plot(new.time,pred1$haz,type="l",ylim=c(0,0.2),main="hazard vs excess hazard",
xlab="years since diagnosis",ylab="hazard")
lines(new.time,pred3$haz,col="green3")
legend("topright",legend=c("overall","excess"),col=c("black","green3"),lty=c(1,1))

lines(new.time,pred1$haz.inf,lty=2)
lines(new.time,pred1$haz.sup,lty=2)

lines(new.time,pred3$haz.inf,lty=2,col="green3")
lines(new.time,pred3$haz.sup,lty=2,col="green3")



#-------------------------------------------------------- example 3

library(survPen)
data(datCancer) # simulated dataset with 2000 individuals diagnosed with cervical cancer

# models: tensor product smooth vs tensor product interaction of time since diagnosis and 
# age at diagnosis. Smoothing parameters are estimated via LAML maximization
f2 <- ~tensor(fu,age,df=c(5,5))

f3 <- ~tint(fu,df=5)+tint(age,df=5)+tint(fu,age,df=c(5,5))

# hazard model
mod4 <- survPen(f2,data=datCancer,t1=fu,event=dead)
summary(mod4)

mod5 <- survPen(f3,data=datCancer,t1=fu,event=dead)
summary(mod5)

# predictions
new.age <- seq(50,90,length=50)
new.time <- seq(0,7,length=50)

Z4 <- outer(new.time,new.age,function(t,a) predict(mod4,data.frame(fu=t,age=a))$haz)
Z5 <- outer(new.time,new.age,function(t,a) predict(mod5,data.frame(fu=t,age=a))$haz)

# color settings
col.pal <- colorRampPalette(c("white", "red"))
colors <- col.pal(100)

facet <- function(z){

	facet.center <- (z[-1, -1] + z[-1, -ncol(z)] + z[-nrow(z), -1] + z[-nrow(z), -ncol(z)])/4
	cut(facet.center, 100)
	
}

# plot the hazard surfaces for both models
par(mfrow=c(1,2))
persp(new.time,new.age,Z4,col=colors[facet(Z4)],main="tensor",theta=30,
xlab="years since diagnosis",ylab="age at diagnosis",zlab="excess hazard",ticktype="detailed")
persp(new.time,new.age,Z5,col=colors[facet(Z5)],main="tint",theta=30,
xlab="years since diagnosis",ylab="age at diagnosis",zlab="excess hazard",ticktype="detailed")

#-------------------------------------------------------- example 4

library(survPen)
data(datCancer) # simulated dataset with 2000 individuals diagnosed with cervical cancer

# model : tensor product spline for time, age and yod (year of diagnosis)
# yod is not centered here since it does not create unstability but be careful in practice
# and consider centering your covariates if you encounter convergence issues
f4 <- ~tensor(fu,age,yod,df=c(5,5,5))

# excess hazard model
mod6 <- survPen(f4,data=datCancer,t1=fu,event=dead,expected=rate)
summary(mod6)


# predictions of the surfaces for ages 50, 60, 70 and 80
new.year <- seq(1990,2010,length=30)
new.time <- seq(0,5,length=50)

Z_50 <- outer(new.time,new.year,function(t,y) predict(mod6,data.frame(fu=t,yod=y,age=50))$haz)
Z_60 <- outer(new.time,new.year,function(t,y) predict(mod6,data.frame(fu=t,yod=y,age=60))$haz)
Z_70 <- outer(new.time,new.year,function(t,y) predict(mod6,data.frame(fu=t,yod=y,age=70))$haz)
Z_80 <- outer(new.time,new.year,function(t,y) predict(mod6,data.frame(fu=t,yod=y,age=80))$haz)


# plot the hazard surfaces for a given age
par(mfrow=c(2,2))
persp(new.time,new.year,Z_50,col=colors[facet(Z_50)],main="age 50",theta=20,
xlab="years since diagnosis",ylab="yod",zlab="excess hazard",ticktype="detailed")
persp(new.time,new.year,Z_60,col=colors[facet(Z_60)],main="age 60",theta=20,
xlab="years since diagnosis",ylab="yod",zlab="excess hazard",ticktype="detailed")
persp(new.time,new.year,Z_70,col=colors[facet(Z_70)],main="age 70",theta=20,
xlab="years since diagnosis",ylab="yod",zlab="excess hazard",ticktype="detailed")
persp(new.time,new.year,Z_80,col=colors[facet(Z_80)],main="age 80",theta=20,
xlab="years since diagnosis",ylab="yod",zlab="excess hazard",ticktype="detailed")

#-------------------------------------------------------- example 5

library(survPen)
data(datCancer) # simulated dataset with 2000 individuals diagnosed with cervical cancer

# excess hazard model with tensor product spline of time and age with a factor by variable

#-------------- setting up stage variable. For example purposes only, of course here this
# fake stage variable has no epidemiological value whatsoever
don <- datCancer
don$stage <- "medium"

set.seed(1)
don$random <- runif(nrow(don))

don[don$random < 0.33,]$stage <- "low"
don[don$random > 0.66,]$stage <- "high"

don$stage <- as.factor(don$stage)


#-------------- separate data
don.low <- don[don$stage=="low",]
don.medium <- don[don$stage=="medium",]
don.high <- don[don$stage=="high",]

#-------------- formula for separated models
f5 <- ~tensor(fu,age)

#-------------- fitting separated models
mod.low <- survPen(f5,data=don.low,t1=fu,event=dead,expected=rate)
mod.medium <- survPen(f5,data=don.medium,t1=fu,event=dead,expected=rate)
mod.high <- survPen(f5,data=don.high,t1=fu,event=dead,expected=rate)

#-------------- predictions with separated models
newt <- seq(0,5,length=50)
age1 <- 60

data.pred0 <- data.frame(fu=newt,age=age1)
pred.low <- predict(mod.low,data.pred0)
pred.medium <- predict(mod.medium,data.pred0)
pred.high <- predict(mod.high,data.pred0)

par(mfrow=c(1,2))

plot(newt,pred.low$haz,type="l",col="blue3",ylim=c(0,0.15),
ylab="excess hazard",xlab="time",main="separated models")
lines(newt,pred.medium$haz,col="green")
lines(newt,pred.high$haz,col="red")
legend(0.5,0.04,c("low","medium","high"),lty=rep(1,3),col=c("blue3","green","red"))

#-------------- formula for unique model with by variable. The centering constraint is applied 
# so we need to add the variable stage as a main effect too. The same smoothing parameters will
# be used for each level of the variable (same.rho=TRUE).
f6 <- ~ stage + tensor(fu,age,by=stage,same.rho=TRUE)

f6.bis <- ~ stage + tensor(fu,age,by=stage,same.rho=FALSE)

#-------------- fitting unique model
mod7 <- survPen(f6,data=don,t1=fu,event=dead,expected=rate)

mod7.bis <- survPen(f6.bis,data=don,t1=fu,event=dead,expected=rate)

#-------------- predictions with unique model
data.pred <- data.frame(fu=rep(newt,3),age=age1,stage=rep(c("low","medium","high"),each=50))

pred <- predict(mod7,data.pred)
data.pred$haz <- pred$haz

plot(newt,data.pred[data.pred$stage=="low",]$haz,type="l",col="blue3",ylim=c(0,0.15),
ylab="excess hazard",xlab="time",main="unique model")
lines(newt,data.pred[data.pred$stage=="medium",]$haz,col="green")
lines(newt,data.pred[data.pred$stage=="high",]$haz,col="red")

# If you plot the results from mod7.bis you will see that they are similar to those obtained 
# with the separated models (but not identical) 

#--------------- we could also have used an ordered factor and add a reference level smooth

don$stage <- factor(don$stage,levels=c("low","medium","high"),ordered=TRUE)

f.ordered <- ~ stage + tensor(fu,age) + tensor(age,fu,by=stage)

# Here we must add the reference term "tensor(fu,age)" because stage is an ordered factor and
# so the term "tensor(age,fu,by=stage)" does not create a smooth for the first level of stage.

mod.ordered <- survPen(f.ordered,data=don,t1=fu,event=dead,expected=rate)

# Using ordered factors is very useful to specify models where the same smooths are
# concerned by several factor by variables. For example:

# we construct a new factor variable
don$fac2 <- "level1"

set.seed(30)
don$random2 <- runif(nrow(don))

don[don$random2 > 0.5,]$fac2 <- "level2"

don$fac2 <- factor(don$fac2,levels=c("level1","level2"),ordered=TRUE)

# So now we can specify a smooth of time for each level of stage (except the first one) and
# for each level of fac2 (except the first one). The smooth associated with the first level
# of stage and the first level of fac2 is the reference smooth smf(fu)
f.ordered2 <- ~ stage + fac2 + smf(fu) + smf(fu,by=stage) + smf(fu,by=fac2)

mod.ordered2 <- survPen(f.ordered2,data=don,t1=fu,event=dead,expected=rate)

#--------------------------------------------------------------------------------------------
# hazard model with a continuous by variable

# do not refrain to center continuous covariates to avoid convergence issues (especially when
# said continuous covariates are used as by variables)

don$agec <- don$age - 50

# penalized cubic spline of time with linear interaction with age: 
# log(h(fu,age))=f(fu) + age + g(fu)*age

m <- survPen(~smf(fu) + smf(fu,by=agec),data=don,t1=fu,event=dead)
m$ll

# Another option to fit the same model
m.bis <- survPen(~smf(fu) + agec + tint(fu,by=agec,df=10),data=don,t1=fu,event=dead)
m.bis$ll # same penalized likelihood as m


# Be careful here. In m, the effect of age is included in the term smf(fu,by=agec) but in m.bis, the
# term tint(fu,by=agec,df=10) is subjected to centering constraints and the effect of age
# itself is not included and therefore must be added as a parametric term. tint 
# is particularly useful when several smooths contain the same continuous by variable.
# Be also careful when using tint instead of smf since the default df is not the same (5 vs 10).

# penalized cubic spline of time, penlized cubic spline of age and penalized cubic spline 
# of time with linear interaction with age : log(h(fu,age)) = f(fu) + g(age) + k(fu)*age

m2 <- survPen(~tint(fu,df=10) + tint(agec,df=10) + tint(fu,by=agec,df=10),data=don,t1=fu,event=dead)
m2$ll 


#-------------------------------------------------------- example 6

library(survPen)
data(datCancer) # simulated dataset with 2000 individuals diagnosed with cervical cancer

# hazard model with tensor product spline of time and age with a random effect of cluster

#-------------- setting up cluster variable (for example purposes only)

list.clust <- seq(1,10) # there are 10 observed cluster levels

set.seed(185)
datCancer$clust <- sample(list.clust,dim(datCancer)[1],replace=TRUE)

datCancer$clust <- factor(datCancer$clust,levels=list.clust)

summary(datCancer$clust)

#-------------- fitting model
# the model is : log(h(fu,age)) = tensor(fu,age) + w_j
# where w_j denotes a gaussian random effect at the cluster level j. u_j = exp(w_j) is called 
# the shared frailty
form.frailty <- ~tensor(fu,age) + rd(clust)
mod.frailty <- survPen(form.frailty,data=datCancer,t1=fu,event=dead)

summary(mod.frailty)
# here, we have sd(w_j) = exp(-2.256382) = 0.1047287
# you can retrieve it from the model like this
exp(summary(mod.frailty)$random.effects)[1]
# or like this
exp(-0.5*log(mod.frailty$lambda)-0.5*log(mod.frailty$S.scale))[3]

# 5-year survival for a 50 years patient in cluster 6
predict(mod.frailty,data.frame(fu=5,age=50,clust=6))$surv

# 5-year survival for a 50 years patient in cluster 10
predict(mod.frailty,data.frame(fu=5,age=50,clust=10))$surv

# 5-year survival for a 50 years patient when random effect is set to zero
predict(mod.frailty,data.frame(fu=5,age=50,clust=10),exclude.random=TRUE)$surv


########################################

## End(No test)




