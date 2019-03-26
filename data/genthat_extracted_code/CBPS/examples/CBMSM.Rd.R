library(CBPS)


### Name: CBMSM
### Title: Covariate Balancing Propensity Score (CBPS) for Marginal
###   Structural Models
### Aliases: CBMSM

### ** Examples



##Load Blackwell data

data(Blackwell)

## Quickly fit a short model to test
form0 <- "d.gone.neg ~ d.gone.neg.l1 + camp.length"
fit0<-CBMSM(formula = form0, time=Blackwell$time,id=Blackwell$demName,
			data=Blackwell, type="MSM",  iterations = NULL, twostep = TRUE, 
			msm.variance = "approx", time.vary = FALSE)

## Not run: 
##D ##Fitting the models in Imai and Ratkovic  (2014)		
##D ##Warning: may take a few mintues; setting time.vary to FALSE
##D ##Results in a quicker fit but with poorer balance
##D ##Usually, it is best to use time.vary TRUE
##D form1<-"d.gone.neg ~ d.gone.neg.l1 + d.gone.neg.l2 + d.neg.frac.l3 + 
##D 		camp.length + camp.length + deminc + base.poll + year.2002 + 
##D 		year.2004 + year.2006 + base.und + office"
##D 		
##D fit1<-CBMSM(formula = form1, time=Blackwell$time,id=Blackwell$demName,
##D 			data=Blackwell, type="MSM",  iterations = NULL, twostep = TRUE, 
##D 			msm.variance = "full", time.vary = TRUE, init="glm")
##D 
##D fit2<-CBMSM(formula = form1, time=Blackwell$time,id=Blackwell$demName,
##D 			data=Blackwell, type="MSM",  iterations = NULL, twostep = TRUE, 
##D 			msm.variance = "approx", time.vary = TRUE, init="glm")
##D 
##D ##Assessing balance
##D 
##D bal1<-balance.CBMSM(fit1)
##D bal2<-balance.CBMSM(fit2)
##D 
##D ##Effect estimation: Replicating Effect Estimates in 
##D ##Table 3 of Imai and Ratkovic (2014)
##D 
##D lm1<-lm(demprcnt[time==1]~fit1$treat.hist,data=Blackwell,
##D weights=fit1$glm.weights)
##D lm2<-lm(demprcnt[time==1]~fit1$treat.hist,data=Blackwell,
##D weights=fit1$weights)
##D lm3<-lm(demprcnt[time==1]~fit1$treat.hist,data=Blackwell,
##D weights=fit2$weights)
##D 
##D lm4<-lm(demprcnt[time==1]~fit1$treat.cum,data=Blackwell,
##D weights=fit1$glm.weights)
##D lm5<-lm(demprcnt[time==1]~fit1$treat.cum,data=Blackwell,
##D weights=fit1$weights)
##D lm6<-lm(demprcnt[time==1]~fit1$treat.cum,data=Blackwell,
##D weights=fit2$weights)
##D 
##D 
##D 
##D ### Example: Multiple Binary Treatments Administered at the Same Time
##D n<-200
##D k<-4
##D set.seed(1040)
##D X1<-cbind(1,matrix(rnorm(n*k),ncol=k))
##D 
##D betas.1<-betas.2<-betas.3<-c(2,4,4,-4,3)/5
##D probs.1<-probs.2<-probs.3<-(1+exp(-X1 %*% betas.1))^-1
##D 
##D treat.1<-rbinom(n=length(probs.1),size=1,probs.1)
##D treat.2<-rbinom(n=length(probs.2),size=1,probs.2)
##D treat.3<-rbinom(n=length(probs.3),size=1,probs.3)
##D treat<-c(treat.1,treat.2,treat.3)
##D X<-rbind(X1,X1,X1)
##D time<-c(rep(1,nrow(X1)),rep(2,nrow(X1)),rep(3,nrow(X1)))
##D id<-c(rep(1:nrow(X1),3))
##D y<-cbind(treat.1,treat.2,treat.3) %*% c(2,2,2) + 
##D X1 %*% c(-2,8,7,6,2) + rnorm(n,sd=5)
##D 
##D multibin1<-CBMSM(treat~X,id=id,time=time,type="MultiBin",twostep=TRUE)
##D summary(lm(y~-1+treat.1+treat.2+treat.3+X1, weights=multibin1$w))
## End(Not run)




