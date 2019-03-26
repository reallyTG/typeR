library(lqr)


### Name: lqr
### Title: Robust Linear Quantile Regression
### Aliases: lqr
### Keywords: package quantile regression skew

### ** Examples

## Not run: 
##D #Example 1
##D ##Load the data
##D data(ais)
##D attach(ais)
##D 
##D ##Setting
##D y<-BMI
##D x<-cbind(1,LBM,Sex)
##D 
##D ## Fitting a median regression with Normal errors (by default)
##D 
##D modelF = lqr(y[Sex==1], x[Sex==1,1:2])
##D modelM = lqr(y[Sex==0], x[Sex==0,1:2])
##D plot(LBM,BMI,col=Sex+1,xlab="Lean Body Mass",ylab="Body4 Mass Index",main="Quantile Regression")
##D abline(a = modelF$beta[1],b = modelF$beta[2],lwd=2,col=2)
##D abline(a = modelM$beta[1],b = modelM$beta[2],lwd=2,col=4)
##D 
##D #COMPARING SOME MODELS for median regression
##D x<-cbind(1,LBM)
##D 
##D modelN  = lqr(y,x,dist = "normal")
##D modelT  = lqr(y,x,dist = "t")
##D modelL  = lqr(y,x,dist = "laplace")
##D 
##D #Comparing AIC criterias
##D modelN$AIC;modelT$AIC;modelL$AIC
##D 
##D #This could be automatically done using best.lqr()
##D best.model = best.lqr(y, x, p = 0.75, criterion = "AIC")
##D 
##D #Let's use a grid of quantiles
##D modelfull = lqr(y,x,p = seq(from = 0.10,to = 0.90,by = 0.05),dist = "normal")
##D 
##D #Plotting quantiles 0.10,0.25,0.50,0.75 and 0.90
##D 
##D plot(LBM,BMI,xlab = "Lean Body Mass"
##D      ,ylab = "Body Mass Index", main = "Quantile Regression",pch=16)
##D abline(a = modelfull[[1]]$beta[1],b = modelfull[[1]]$beta[2],lwd=2,lty=1,col=2)
##D abline(a = modelfull[[17]]$beta[1],b = modelfull[[17]]$beta[2],lwd=2,lty=1,col=2)
##D abline(a = modelfull[[4]]$beta[1],b = modelfull[[4]]$beta[2],lwd=2,lty=1,col=3)
##D abline(a = modelfull[[14]]$beta[1],b = modelfull[[14]]$beta[2],lwd=2,lty=1,col=3)
##D abline(a = modelfull[[9]]$beta[1],b = modelfull[[9]]$beta[2],lwd=2,lty=1,col=4)
##D 
##D 
##D #Example 2
##D ##Load the data
##D 
##D data(crabs,package = "MASS")
##D 
##D crabs$sex <- as.character(crabs$sex)
##D crabs$sex[crabs$sex=="M"]=0
##D crabs$sex[crabs$sex=="F"]=1
##D crabs$sex = as.numeric(crabs$sex)
##D 
##D attach(crabs)
##D head(crabs)
##D 
##D ##Setting
##D y  <- BD
##D x  <- cbind(1,FL,sex)
##D plot(crabs)
##D 
##D ## Fitting a median regression with Normal errors (by default)
##D modelF = lqr(y[sex==1], x[sex==1,1:2])
##D modelM = lqr(y[sex==0], x[sex==0,1:2])
##D plot(FL,BD,col=sex+1,xlab="Frontal lobe size",ylab="Body depth",main="Quantile Regression")
##D abline(a = modelF$beta[1],b = modelF$beta[2],lwd=2,col=2)
##D abline(a = modelM$beta[1],b = modelM$beta[2],lwd=2,col=4)
##D 
##D #COMPARING SOME MODELS for median regression
##D x<-cbind(1,FL)
##D 
##D modelN  = lqr(y,x,dist = "normal")
##D modelT  = lqr(y,x,dist = "t")
##D modelL  = lqr(y,x,dist = "laplace")
##D modelS  = lqr(y,x,dist = "slash")
##D modelC  = lqr(y,x,dist = "cont" )
##D 
##D #Comparing AIC criterias
##D modelN$AIC;modelT$AIC;modelL$AIC;modelS$AIC;modelC$AIC
##D 
##D #Let's use a grid of quantiles
##D modelfull = lqr(y,x,p = seq(from = 0.10,to = 0.90,by = 0.05),dist = "t")
##D 
##D #Plotting quantiles 0.10,0.25,0.50,0.75 and 0.90
##D 
##D plot(FL,BD,xlab = "Frontal lobe size"
##D      ,ylab = "Body depth", main = "Quantile Regression",pch=16)
##D abline(a = modelfull[[1]]$beta[1],b = modelfull[[1]]$beta[2],lwd=2,lty=1,col=2)
##D abline(a = modelfull[[17]]$beta[1],b = modelfull[[17]]$beta[2],lwd=2,lty=1,col=2)
##D abline(a = modelfull[[4]]$beta[1],b = modelfull[[4]]$beta[2],lwd=2,lty=1,col=3)
##D abline(a = modelfull[[14]]$beta[1],b = modelfull[[14]]$beta[2],lwd=2,lty=1,col=3)
##D abline(a = modelfull[[9]]$beta[1],b = modelfull[[9]]$beta[2],lwd=2,lty=1,col=4)
## End(Not run)



