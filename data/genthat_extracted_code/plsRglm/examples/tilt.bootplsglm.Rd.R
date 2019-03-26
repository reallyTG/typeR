library(plsRglm)


### Name: tilt.bootplsglm
### Title: Tilted bootstrap for PLS models
### Aliases: tilt.bootplsglm
### Keywords: models

### ** Examples

## No test: 
data(aze_compl)
Xaze_compl<-aze_compl[,2:34]
yaze_compl<-aze_compl$y

dataset <- cbind(y=yaze_compl,Xaze_compl)

# Lazraq-Cleroux PLS bootstrap Classic

aze_compl.tilt.boot <- tilt.bootplsglm(plsRglm(yaze_compl,Xaze_compl,3, 
modele="pls-glm-logistic", family=NULL), statistic=coefs.plsRglm, R=c(499, 100, 100), 
alpha=c(0.025, 0.975), sim="ordinary", stype="i", index=1)
aze_compl.tilt.boot <- tilt.bootplsglm(plsRglm(yaze_compl,Xaze_compl,3, 
modele="pls-glm-logistic"), statistic=coefs.plsRglm, R=c(499, 100, 100), 
alpha=c(0.025, 0.975), sim="ordinary", stype="i", index=1)
aze_compl.tilt.boot <- tilt.bootplsglm(plsRglm(yaze_compl,Xaze_compl,3, 
modele="pls-glm-family", family=binomial), statistic=coefs.plsRglm, R=c(499, 100, 100), 
alpha=c(0.025, 0.975), sim="ordinary", stype="i", index=1)

boxplots.bootpls(aze_compl.tilt.boot,1:2)


# PLS bootstrap balanced

aze_compl.tilt.boot <- tilt.bootplsglm(plsRglm(yaze_compl,Xaze_compl,3, 
modele="pls-glm-logistic"), statistic=coefs.plsRglm, R=c(499, 100, 100), 
alpha=c(0.025, 0.975), sim="balanced", stype="i", index=1)
## End(No test)



