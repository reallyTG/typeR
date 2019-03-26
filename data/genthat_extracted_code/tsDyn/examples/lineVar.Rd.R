library(tsDyn)


### Name: lineVar
### Title: Multivariate linear models: VAR and VECM
### Aliases: lineVar
### Keywords: ts

### ** Examples


data(zeroyld)

#Fit a VAR
VAR <- lineVar(zeroyld, lag=1)
VAR
summary(VAR)

#compare results with package vars:
if(require(vars)) {
a<-VAR(zeroyld, p=1)
coef_vars <- t(sapply(coef(a), function(x) x[c(3,1,2),1]))
all.equal(coef(VAR),coef_vars, check.attributes=FALSE)
}

###VECM
VECM.EG <- lineVar(zeroyld, lag=2, model="VECM")
VECM.EG
summary(VECM.EG)

VECM.ML <- lineVar(zeroyld, lag=2, model="VECM", estim="ML")
VECM.ML
summary(VECM.ML)


###Check Johansen MLE
myVECM <- lineVar(zeroyld, lag=1, include="const", model="VECM", estim="ML")
summary(myVECM, digits=7) 
#comparing with vars package
if(require(vars)){
a<-ca.jo(zeroyld, spec="trans")
summary(a)
#same answer also!
}

##export to Latex
toLatex(VECM.EG)
toLatex(summary(VECM.EG))
options("show.signif.stars"=FALSE)
toLatex(summary(VECM.EG), parenthese="Pvalue")
options("show.signif.stars"=TRUE)






