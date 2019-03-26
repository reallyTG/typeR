### R code from vignette source 'Definition.Rnw'

###################################################
### code chunk number 1: curve
###################################################
y <- c(-1, -1, 1, 1, 1)
w <- c(1, 1, 1, 4, 5)
y.hat <- c(1, 2, 3, 1, 1)
library(WeightedROC)
tp.fp <- WeightedROC(y.hat, y, w)
library(ggplot2)
ggplot()+
  geom_path(aes(FPR, TPR), data=tp.fp)+
  coord_equal()


###################################################
### code chunk number 2: auc
###################################################
WeightedAUC(tp.fp)


