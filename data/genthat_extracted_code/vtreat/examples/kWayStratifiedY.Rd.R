library(vtreat)


### Name: kWayStratifiedY
### Title: k-fold cross validation stratified on y, a splitFunction in the
###   sense of vtreat::buildEvalSets
### Aliases: kWayStratifiedY

### ** Examples


set.seed(23255)
d <- data.frame(y=sin(1:100))
pStrat <- kWayStratifiedY(nrow(d),5,d,d$y)
problemAppPlan(nrow(d),5,pStrat,TRUE)
d$stratGroup <- vtreat::getSplitPlanAppLabels(nrow(d),pStrat)
pSimple <- kWayCrossValidation(nrow(d),5,d,d$y)
problemAppPlan(nrow(d),5,pSimple,TRUE)
d$simpleGroup <- vtreat::getSplitPlanAppLabels(nrow(d),pSimple)
summary(tapply(d$y,d$simpleGroup,mean))
# ggplot(data=d,aes(x=y,color=as.factor(simpleGroup))) + 
#   geom_density() + ggtitle('simple grouping')
summary(tapply(d$y,d$stratGroup,mean))
# ggplot(data=d,aes(x=y,color=as.factor(stratGroup))) + 
#   geom_density() + ggtitle('y-stratified grouping')


# # And you can (and should) use your own functions or libraries.
# splitFn <- function(nRows,nSplits,dframe,y) {
#      fullSeq <- seq_len(nRows)
#      part <- caret::createFolds(y=y,k=nSplits)
#      lapply(part,
#             function(appi) { 
#                 list(train=setdiff(fullSeq,appi),app=appi)
#             })
# }
# pCaret <- splitFn(nrow(d),5,d,d$y)
# problemAppPlan(nrow(d),5,pCaret,TRUE)
# d$caretGroup <- vtreat::getSplitPlanAppLabels(nrow(d),pCaret)
# ggplot(data=d,aes(x=y,color=as.factor(caretGroup))) +
#    geom_density() + ggtitle('caret::createFolds grouping')




