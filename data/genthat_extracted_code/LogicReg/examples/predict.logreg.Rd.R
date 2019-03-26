library(LogicReg)


### Name: predict.logreg
### Title: Predicted values Logic Regression
### Aliases: predict.logreg
### Keywords: logic methods nonparametric tree

### ** Examples

data(logreg.savefit1,logreg.savefit2,logreg.savefit6,logreg.testdat)
#
# myanneal <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 1000)
# logreg.savefit1 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21], type = 2,
#                select = 1, ntrees = 2, anneal.control = myanneal)
z1 <- predict(logreg.savefit1)
plot(z1, logreg.testdat[,1]-z1, xlab="fitted values", ylab="residuals")
# myanneal2 <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 0)
# logreg.savefit2 <- logreg(select = 2, nleaves =c(1,7), oldfit = logreg.savefit1,
#                anneal.control = myanneal2)
z2  <- predict(logreg.savefit2)
# logreg.savefit6 <- logreg(select = 6, ntrees = 2, nleaves =c(1,12), oldfit = logreg.savefit1)
z6 <- predict(logreg.savefit6, msz = 3:5)




