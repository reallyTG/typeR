library(bgmm)


### Name: crossval
### Title: k-fold cross-validation for the specified model
### Aliases: crossval

### ** Examples
                
 set.seed(1313)
 simulated = simulateData(d=2, k=3, n=300, m=60, cov="0", within="E", n.labels=2)
 amodel = belief(X=simulated$X, knowns=simulated$knowns, B=simulated$B, k=4)
 str(crossval(model=amodel, folds=6))

 amodel = supervised(knowns=rbind(simulated$X, simulated$knowns), class=simulated$Ytrue)
 str(crossval(model=amodel, folds=6, fun=supervised))



