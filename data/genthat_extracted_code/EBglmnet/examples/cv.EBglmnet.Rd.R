library(EBglmnet)


### Name: cv.EBglmnet
### Title: Cross Validation (CV) Function to Determine Hyperparameters of
###   the EBglmnet Algorithms
### Aliases: cv.EBglmnet

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
out = cv.EBglmnet(x,y)
out$fit
#lasso prior
out = cv.EBglmnet(x,y,prior= "lasso")
out$fit
#elastic net prior
out = cv.EBglmnet(x,y,prior= "elastic net")
out$fit
#
#Binomial Model
#create a binary response variable
yy = y>mean(y);
out = cv.EBglmnet(x,yy,family="binomial")
out$fit
#with epistatic effects
out = cv.EBglmnet(x,yy,family="binomial",prior= "elastic net",Epis =TRUE)
out$fit



