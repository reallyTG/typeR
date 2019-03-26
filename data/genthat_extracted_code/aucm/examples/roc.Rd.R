library(aucm)


### Name: roc
### Title: ROC and AUC
### Aliases: computeRoc fast.auc plotRoc addRoc classification.error

### ** Examples


n=1e2
score=c(rnorm(n/2,1), rnorm(n/2,0))
outcome=rep(1:0, each=n/2)
plotRoc(computeRoc(score, outcome))

# commented out b/c slower on pc and cause note when r cmd check
## test, fast.auc2 is a version without all the checking
#score=rnorm(1e5)
#outcome=rbinom(1e5,1,.5)
#system.time(for (i in 1:1e2) fast.auc(score,outcome)) # 4.9 sec
#system.time(for (i in 1:1e2) fast.auc2(score,outcome)) # 3.8 sec





