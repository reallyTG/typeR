library(pact)


### Name: pact
### Title: Predictive Analysis of Clinical Trials
### Aliases: pact pact-package

### ** Examples

### Survival response
set.seed(10)    
data(prostateCancer)     
Y <- prostateCancer[,3:4]
Xf <- prostateCancer[,7:8]  ## Prognostic covariates fixed to always be in the model
Xv <- prostateCancer[,c(5:6,9)]
Treatment <- as.factor(prostateCancer[,2])
p <- pact.fit(Y=Y,Xf=Xf,Xv=Xv,Treatment=Treatment,family="cox",varSelect="univar")
print(p)
overall.analysis(p)
cv <- pact.cv(p, nfold=5)
eval.pact.cv(cv, method="continuous", plot.score=TRUE, perm.test=FALSE, nperm=100)

### Binary response
set.seed(10)
data(EORTC10994)
Y <- as.factor(EORTC10994[,4])
## No prognostic covariates (Xf) specified
Xv <- EORTC10994[,c(2,5:7)]
Treatment <- as.factor(EORTC10994[,3])
p <- pact.fit(Y=Y,Xv=Xv,Treatment=Treatment,family="binomial",varSelect="none")
print(p)
overall.analysis(p)
cv <- pact.cv(p, nfold=5)
eval.pact.cv(cv, method="discrete", g=log(1), perm.test=FALSE, nperm=100)

### High dimensional data, survival response
## Not run: 
##D set.seed(10)    
##D data(GSE10846)     
##D Y <- GSE10846[,1:2]
##D Xv <- GSE10846[,-c(1:3)]
##D Treatment <- as.factor(GSE10846[,3])
##D p <- pact.fit(Y=Y,Xv=Xv,Treatment=Treatment,family="cox",varSelect="lasso",penalty.scaling=2)
##D print(p)
##D overall.analysis(p)
##D cv <- pact.cv(p, nfold=5)
##D eval.pact.cv(cv, method="continuous", plot.score=TRUE, perm.test=FALSE)
## End(Not run)




