library(CUB)


### Name: GEM
### Title: Main function for GEM models
### Aliases: GEM
### Keywords: models

### ** Examples

## No test: 
library(CUB)
## CUB models with no covariates
model<-GEM(Formula(Walking~0|0|0),family="cub",data=relgoods)
coef(model,digits=5)     # Estimated parameter vector (pai,csi)
logLik(model)            # Log-likelihood function at ML estimates
vcov(model,digits=4)     # Estimated Variance-Covariance matrix
cormat(model)            # Parameter Correlation matrix
fitted(model)            # Fitted probability distribution
makeplot(model)
################
## CUB model with shelter effect
model<-GEM(Formula(officeho~0|0|0),family="cub",shelter=7,data=univer)
BICshe<-BIC(model,digits=4)
################
## CUB model with covariate for all components - GeCUB
data(univer)
dichoage<-ifelse(univer$age<=25,0,1)
modelgecub<-GEM(Formula(officeho~gender|dichoage|freqserv),family="cub",shelter=7,data=univer)
BICgecub<-BIC(modelgecub)
################
## CUB model with covariate for uncertainty
modelcovpai<-GEM(Formula(Parents~Smoking|0|0),family="cub",data=relgoods)
fitted(modelcovpai)
makeplot(modelcovpai)
################
## CUB model with covariate for feeling
# all methods are available for this variable specification
modelcovcsi<-GEM(Formula(RelFriends~0|WalkAlone|0),family="cub",data=relgoods,maxiter=10)
fitted(modelcovcsi)
makeplot(modelcovcsi)
##################
## CUB model with covariates for both uncertainty and feeling components
data(univer)
lage<-log(univer$age)-mean(log(univer$age))
model<-GEM(Formula(global~gender|lage|0),family="cub",data=univer,maxiter=150)
param<-coef(model)
bet<-param[1:2]      # ML estimates of coefficients for uncertainty covariate: gender
gama<-param[3:4]     # ML estimates of coefficients for feeling covariate: lage
##################
## CUBE models with no covariates
model<-GEM(Formula(MeetRelatives~0|0|0),family="cube",starting=c(0.5,0.5,0.1),
  data=relgoods,expinform=TRUE)
coef(model,digits=4)       # Final ML estimates
logLik(model)              # Maximum value of the log-likelihood function
vcov(model)
print(model)
BIC(model)
fitted(model)
makeplot(model)
summary(model)
##############
## CUBE with covariate 'WalkAlone' only for the feeling component
modelcovcsi<-GEM(Formula(MeetRelatives~0|WalkAlone|0),family="cube",data=relgoods)
summary(modelcovcsi)
##################
## CUBE with covariates for all components
modelcov<-GEM(Formula(MeetRelatives~WalkAlone|WalkAlone|WalkAlone),family="cube",
     maxiter=50,toler=1e-2,data=relgoods)
BIC(modelcovcsi)    
BIC(modelcov)       
####################
## IHG models without covariates
model<-GEM(willingn~0,family="ihg",data=univer)
coef(model)                ## ML estimate of preference parameter theta
fitted(model)              ## fitted probabilities
makeplot(model)
##################
## IHG with covariates
modelcov<-GEM(willingn~freqserv,family="ihg",data=univer)
omega<-coef(modelcov)      ## ML estimates 
maxlik<-logLik(modelcov)   ## 
makeplot(modelcov)
summary(modelcov)
###################
## CUSH models without covariate
model<-GEM(Dog~0,family="cush",shelter=1,data=relgoods)
delta<-coef(model)      # ML estimates of delta
maxlik<-logLik(model)   # Log-likelihood at ML estimates
summary(model)
makeplot(model)
#####################
## CUSH model with covariates
modelcov<-GEM(MusicInstr~Smoking,family="cush",shelter=1,data=relgoods)
omega<-coef(modelcov)
maxlik<-logLik(modelcov)
varmat<-vcov(modelcov)
summary(modelcov,digits=3)
fitted(modelcov,digits=3)
## End(No test)




