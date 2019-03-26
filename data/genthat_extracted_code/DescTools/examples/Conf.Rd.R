library(DescTools)


### Name: Conf
### Title: Confusion Matrix And Associated Statistics
### Aliases: Conf Conf.table Conf.default Conf.matrix Conf.rpart
###   Conf.multinom Conf.glm Conf.randomForest Conf.svm Conf.regr plot.Conf
###   print.Conf Sens Spec
### Keywords: multivar

### ** Examples

# let tab be a confusion table
tab <- TextToTable("
   lo hi
lo 23 13
hi 10 18 ", dimnames=c("pred", "obs"))

Conf(tab, pos="hi")


pred <- Untable(tab)[,"pred"]
obs <- Untable(tab)[,"obs"]

Conf(x = pred, ref = obs)
Conf(x = pred, ref = obs, pos="hi")

Sens(tab)   # Sensitivity
Spec(tab)   # Specificity


tab <- TextToTable("
      terrible poor marginal clear
terrible       10    4        1     0
poor            5   10       12     2
marginal        2    4       12     5
clear           0    2        6    13
", dimnames=c("pred", "obs"))

Conf(tab)



