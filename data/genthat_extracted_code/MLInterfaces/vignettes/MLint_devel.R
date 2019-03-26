### R code from vignette source 'MLint_devel.Rnw'

###################################################
### code chunk number 1: lks
###################################################
library(MLInterfaces)
getClass("learnerSchema")


###################################################
### code chunk number 2: lkrf
###################################################
randomForestI@converter


###################################################
### code chunk number 3: lknn
###################################################
nnetI@converter


###################################################
### code chunk number 4: lkknn
###################################################
knnI(k=3, l=2)@converter


###################################################
### code chunk number 5: show
###################################################
library(MASS)
data(crabs)
kp = sample(1:200, size=120)
rf1 = MLearn(sp~CL+RW, data=crabs, randomForestI, kp, ntree=100)
rf1
RObject(rf1)
knn1 = MLearn(sp~CL+RW, data=crabs, knnI(k=3,l=2), kp)
knn1


###################################################
### code chunk number 6: mkadaI
###################################################
adaI = makeLearnerSchema("ada", "ada", standardMLIConverter )
arun = MLearn(sp~CL+RW, data=crabs, adaI, kp )
confuMat(arun)
RObject(arun)


###################################################
### code chunk number 7: lks
###################################################
standardMLIConverter


###################################################
### code chunk number 8: lkggg
###################################################
gbm2


###################################################
### code chunk number 9: tryg
###################################################
BgbmI
set.seed(1234)
gbrun = MLearn(sp~CL+RW+FL+CW+BD, data=crabs, BgbmI(n.trees.pred=25000,thresh=.5), 
   kp, n.trees=25000, 
   distribution="bernoulli", verbose=FALSE )
gbrun
confuMat(gbrun)
summary(testScores(gbrun))


###################################################
### code chunk number 10: dowrap
###################################################
rdaCV = function( formula, data, ... ) {
 passed = list(...)
 if ("genelist" %in% names(passed)) stop("please don't supply genelist parameter.")
 # data input to rda needs to be GxN
 x = model.matrix(formula, data)
 if ("(Intercept)" %in% colnames(x))
   x = x[, -which(colnames(x) %in% "(Intercept)")]
 x = t(x)
 mf = model.frame(formula, data)
 resp = as.numeric(factor(model.response(mf)))
 run1 = rda( x, resp, ... )
 rda.cv( run1, x, resp )
}


###################################################
### code chunk number 11: dow2
###################################################
rdaFixed = function( formula, data, alpha, delta, ... ) {
 passed = list(...)
 if ("genelist" %in% names(passed)) stop("please don't supply genelist parameter.")
 # data input to rda needs to be GxN
 x = model.matrix(formula, data)
 if ("(Intercept)" %in% colnames(x))
   x = x[, -which(colnames(x) %in% "(Intercept)")]
 x = t(x)
 featureNames = rownames(x)
 mf = model.frame(formula, data)
 resp = as.numeric(resp.fac <- factor(model.response(mf)))
 finalFit=rda( x, resp, genelist=TRUE, alpha=alpha, delta=delta, ... )
 list(finalFit=finalFit, x=x, resp.num=resp, resp.fac=resp.fac, featureNames=featureNames,
    keptFeatures=featureNames[ which(apply(finalFit$gene.list,3,function(x)x)==1) ])
}


###################################################
### code chunk number 12: doreal
###################################################
rdacvML = function(formula, data, ...) {
 run1 = rdaCV( formula, data, ... )
 perf.1se = cverrs(run1)$one.se.pos
 del2keep = which.max(perf.1se[,2])
 parms2keep = perf.1se[del2keep,]
 alp = run1$alpha[parms2keep[1]]
 del = run1$delta[parms2keep[2]]
 fit = rdaFixed( formula, data, alpha=alp, delta=del, ... )
 class(fit) = "rdacvML"
 attr(fit, "xvalAns") = run1
 fit
}

predict.rdacvML = function(object, newdata, ...) {
 newd = data.matrix(newdata)
 fnames = rownames(object$x)
 newd = newd[, fnames]
 inds = predict(object$finalFit, object$x, object$resp.num, xnew=t(newd))
 factor(levels(object$resp.fac)[inds])
}

print.rdacvML = function(x, ...) {
 cat("rdacvML S3 instance. components:\n")
 print(names(x))
 cat("---\n")
 cat("elements of finalFit:\n")
 print(names(x$finalFit))
 cat("---\n") 
 cat("the rda.cv result is in the xvalAns attribute of the main object.\n")
}


