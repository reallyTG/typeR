library(cap)


### Name: cap_beta
### Title: Inference of model coefficients
### Aliases: cap_beta
### Keywords: models

### ** Examples


#############################################
data(env.example)
X<-get("X",env.example)
Y<-get("Y",env.example)
Phi<-get("Phi",env.example)

# asymptotic variance
re1<-cap_beta(Y,X,gamma=Phi[,2],method=c("asmp"),boot=FALSE)

# likelihood ratio test
re2<-cap_beta(Y,X,gamma=Phi[,2],method=c("LLR"),boot=FALSE)

# bootstrap confidence interval
## No test: 
re3<-cap_beta(Y,X,gamma=Phi[,2],boot=TRUE,sims=500,verbose=FALSE)
## End(No test)
#############################################



