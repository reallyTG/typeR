library(CPMCGLM)


### Name: CPMCGLM
### Title: Correction of the significance level after multiple coding of an
###   explanatory variable in generalized linear model.
### Aliases: CPMCGLM

### ** Examples

## Not run: 
##D 
##D # load data
##D data(data_sim)
##D #
##D #Example of quantile matrix definition
##D 	
##D #Linear Gaussian Model
##D 
##D fit1 <- CPMCGLM(formula= Weight~Age+as.factor(Sport)+Desease+Height,
##D family="gaussian",link="identity",data=data_sim,varcod="Age",N=1000,
##D boxcox=c(0,1,2,3),nb.dicho=3,nb.categ=4)
##D ### print fit1
##D fit1
##D ### summary fit1
##D summary(fit1)
##D 
##D #Loglinear Poisson Model
##D fit2 <- CPMCGLM(formula= Stroke~Age+as.factor(Sport)+Height+Weight,
##D family="poisson",link="log",data=data_sim,varcod="Age",N=1000,
##D boxcox=c(0,1,2,3))
##D 
##D ### print fit2
##D fit2 
##D ### summary fit2
##D summary(fit2)
##D 
##D #Logit Model
##D FP1 <-  matrix(NA,ncol=4,nrow=3)
##D FP1[1,1] <- -2
##D FP1[2,] <- c(0.5,1,-0.5,2)
##D FP1[3,1:2] <- c(-0.5,1)
##D 
##D fit3 <- CPMCGLM(formula= Parameter~Age+as.factor(Sport)+Height+Weight,
##D family="binomial",link="logit",data=data_sim,varcod="Age",N=1000,
##D boxcox=c(0,1,2,3),nb.dicho=3,FP=FP1)
##D ### print fit3
##D fit3 
##D ### summary fit3
##D summary(fit3)
##D 
##D #Probit Model
##D 
##D fit4 <- CPMCGLM(formula= Parameter~Age+as.factor(Sport)+Height+Weight,
##D family="binomial",link="probit",data=data_sim,varcod="Age",N=1000,
##D nboxcox=2,nb.categ=4)
##D ### print fit4
##D fit4 
##D ### summary fit4
##D summary(fit4)
## End(Not run)



