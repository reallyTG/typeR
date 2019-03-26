library(plsRglm)


### Name: plsR
### Title: Partial least squares Regression models with leave one out cross
###   validation
### Aliases: plsR plsRmodel.default plsRmodel.formula PLS_lm PLS_lm_formula
### Keywords: models regression

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]

#maximum 6 components could be extracted from this dataset
#trying 10 to trigger automatic stopping criterion
modpls10<-plsR(yCornell,XCornell,10)
modpls10

#With iterative leave one out CV PRESS
modpls6cv<-plsR(yCornell,XCornell,6,typeVC="standard")
modpls6cv
cv.modpls<-cv.plsR(yCornell,XCornell,6,NK=100)
res.cv.modpls<-cvtable(summary(cv.modpls))
plot(res.cv.modpls)

rm(list=c("XCornell","yCornell","modpls10","modpls6cv"))

## No test: 
#A binary response example
data(aze_compl)
Xaze_compl<-aze_compl[,2:34]
yaze_compl<-aze_compl$y
modpls.aze <- plsR(yaze_compl,Xaze_compl,10,MClassed=TRUE,typeVC="standard")
modpls.aze

#Direct access to not cross validated values
modpls.aze$AIC
modpls.aze$AIC.std
modpls.aze$MissClassed

#Raw predicted values (not really probabily since not constrained in [0,1]
modpls.aze$Probs
#Truncated to [0;1] predicted values (true probabilities)
modpls.aze$Probs.trc
modpls.aze$Probs-modpls.aze$Probs.trc

#Repeated cross validation of the model (NK=100 times)
cv.modpls.aze<-cv.plsR(yaze_compl,Xaze_compl,10,NK=100)
res.cv.modpls.aze<-cvtable(summary(cv.modpls.aze,MClassed=TRUE))
#High discrepancy in the number of component choice using repeated cross validation
#and missclassed criterion
plot(res.cv.modpls.aze)

rm(list=c("Xaze_compl","yaze_compl","modpls.aze","cv.modpls.aze","res.cv.modpls.aze"))

#24 predictors
dimX <- 24
#2 components
Astar <- 2
simul_data_UniYX(dimX,Astar)
dataAstar2 <- t(replicate(250,simul_data_UniYX(dimX,Astar)))
ydataAstar2 <- dataAstar2[,1]
XdataAstar2 <- dataAstar2[,2:(dimX+1)]
modpls.A2<- plsR(ydataAstar2,XdataAstar2,10,typeVC="standard")
modpls.A2
cv.modpls.A2<-cv.plsR(ydataAstar2,XdataAstar2,10,NK=100)
res.cv.modpls.A2<-cvtable(summary(cv.modpls.A2))
#Perfect choice for the Q2 criterion in PLSR
plot(res.cv.modpls.A2)

#Binarized response
ysimbin1 <- dicho(ydataAstar2)
#Binarized predictors
Xsimbin1 <- dicho(XdataAstar2)
modpls.B2 <- plsR(ysimbin1,Xsimbin1,10,typeVC="standard",MClassed=TRUE)
modpls.B2
modpls.B2$Probs
modpls.B2$Probs.trc
modpls.B2$MissClassed
plsR(ysimbin1,XdataAstar2,10,typeVC="standard",MClassed=TRUE)$InfCrit
cv.modpls.B2<-cv.plsR(ysimbin1,Xsimbin1,2,NK=100)
res.cv.modpls.B2<-cvtable(summary(cv.modpls.B2,MClassed=TRUE))
#Only one component found by repeated CV missclassed criterion
plot(res.cv.modpls.B2)

rm(list=c("dimX","Astar","dataAstar2","XdataAstar2","ydataAstar2","modpls.A2","cv.modpls.A2",
"res.cv.modpls.A2","Xsimbin1","ysimbin1","modpls.B2","cv.modpls.B2","res.cv.modpls.B2"))
## End(No test)



