library(conting)


### Name: beta_mode
### Title: Posterior Mode
### Aliases: beta_mode

### ** Examples

data(AOH) ## loads the AOH data

X<-model.matrix(~alc+hyp+obe,data=AOH,
contrasts=list(alc="contr.sum",hyp="contr.sum",obe="contr.sum"))
## Sets up the design matrix for the independence model

IP<-(t(X)%*%X)/dim(X)[1]
## Set up inverse of prior scale matrix

beta_mode(X=X,prior="UIP",y=AOH$y,IP=IP)
## Finds the posterior mode of the log-linear parameters under the
## independence model with the unit information prior. Will get:
#X(Intercept)        Xalc1        Xalc2        Xalc3        Xhyp1        Xobe1 
# 2.894270420 -0.045859743 -0.071775824  0.089541068 -0.504141954  0.008163604 
#       Xobe2 
#-0.016327209

beta_mode(X=X,prior="SBH",y=AOH$y,IP=IP)
## Finds the posterior mode of the log-linear parameters under the
## independence model with the Sabanes-Bove & Held prior. Will get:
#X(Intercept)        Xalc1        Xalc2        Xalc3        Xhyp1        Xobe1 
# 2.908298763 -0.043704371 -0.068212247  0.085338704 -0.473628107  0.007762839 
#       Xobe2 
#-0.015525678





