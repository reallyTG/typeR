library(EBglmnet)


### Name: EBglmnet
### Title: Main Function for the EBglmnet Algorithms
### Aliases: EBglmnet

### ** Examples


rm(list = ls())
library(EBglmnet)
#Use R built-in data set state.x77
y= state.x77[,"Life Exp"]
xNames = c("Population","Income","Illiteracy", "Murder","HS Grad","Frost","Area")
x = state.x77[,xNames]
#
#Gaussian Model
#lassoNEG prior as default
out = EBglmnet(x,y,hyperparameters=c(0.5,0.5))
out$fit
#lasso prior
out = EBglmnet(x,y,prior= "lasso",hyperparameters=0.5)
out$fit
#elastic net prior
out = EBglmnet(x,y,prior= "elastic net",hyperparameters=c(0.5,0.5))
out$fit
#residual variance
out$res
#intercept
out$Intercept
#
#Binomial Model
#create a binary response variable
yy = y>mean(y);
out = EBglmnet(x,yy,family="binomial",hyperparameters=c(0.5,0.5))
out$fit
#with epistatic effects
out = EBglmnet(x,yy,family="binomial",hyperparameters=c(0.5,0.5),Epis =TRUE)
out$fit



