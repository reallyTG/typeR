library(ordinalForest)


### Name: perff
### Title: Performance functions based on Youden's J statistic
### Aliases: perff perff_equal perff_proportional perff_oneclass
###   perff_custom

### ** Examples

data(hearth)

set.seed(123)
trainind <- sort(sample(1:nrow(hearth), size=floor(nrow(hearth)*(1/2))))
testind <- sort(sample(setdiff(1:nrow(hearth), trainind), size=20))

datatrain <- hearth[trainind,]
datatest <- hearth[testind,]

ordforres <- ordfor(depvar="Class", data=datatrain, nsets=60, nbest=5)
# NOTE: nsets=60 is not enough, because the prediction performance of the resulting 
# ordinal forest will be suboptimal!! In practice, nsets=1000 (default value) or a larger
# number should be used.

preds <- predict(ordforres, newdata=datatest)

table('true'=datatest$Class, 'predicted'=preds$ypred)


perff_equal(ytest=datatest$Class, ytestpred=preds$ypred)
 
perff_proportional(ytest=datatest$Class, ytestpred=preds$ypred)
 
perff_oneclass(ytest=datatest$Class, ytestpred=preds$ypred, categ="1")
perff_oneclass(ytest=datatest$Class, ytestpred=preds$ypred, categ="2")
perff_oneclass(ytest=datatest$Class, ytestpred=preds$ypred, categ="3")
perff_oneclass(ytest=datatest$Class, ytestpred=preds$ypred, categ="4")
perff_oneclass(ytest=datatest$Class, ytestpred=preds$ypred, categ="5")


perff_custom(ytest=datatest$Class, ytestpred=preds$ypred, classweights=c(1,2,1,1,1))


# perff_equal, perff_proportional, and perff_oneclass are special cases of perff_custom:

perff_custom(ytest=datatest$Class, ytestpred=preds$ypred, classweights=c(1,1,1,1,1))
perff_equal(ytest=datatest$Class, ytestpred=preds$ypred)

perff_custom(ytest=datatest$Class, ytestpred=preds$ypred, classweights=table(datatest$Class))
perff_proportional(ytest=datatest$Class, ytestpred=preds$ypred)

perff_custom(ytest=datatest$Class, ytestpred=preds$ypred, classweights=c(0,0,0,1,0))
perff_oneclass(ytest=datatest$Class, ytestpred=preds$ypred, categ="4")




