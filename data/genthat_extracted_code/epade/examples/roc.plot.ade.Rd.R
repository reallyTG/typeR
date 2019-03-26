library(epade)


### Name: roc.plot.ade
### Title: ROC-curves plot
### Aliases: roc.plot.ade
### Keywords: ROC AUC

### ** Examples

# simple curve
event<-rbinom(1000, size=1, prob=0.3)
pred <- event+rnorm(1000)
roc.plot.ade(pred, event)
# grouped
group=rbinom(1000, 1 ,0.5)
roc.plot.ade(pred, event, group, wall=2)
# comparison of two predictors
pred2 <- event+rnorm(1000, 0, 2)
roc.plot.ade(list(pred, pred2), event, test=TRUE, wall=3)



