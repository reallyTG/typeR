library(ClassComparison)


### Name: MultiLinearModel-class
### Title: Class "MultiLinearModel"
### Aliases: MultiLinearModel multiTukey MultiLinearModel-class
###   anova,MultiLinearModel-method hist,MultiLinearModel-method
###   plot,MultiLinearModel,missing-method plot,MultiLinearModel,ANY-method
###   summary,MultiLinearModel-method
### Keywords: classes multivariate htest

### ** Examples

showClass("MultiLinearModel")
ng <- 10000
ns <- 50
dat <- matrix(rnorm(ng*ns), ncol=ns)
cla <- factor(rep(c('A', 'B'), 25))
cla2 <- factor(rep(c('X', 'Y', 'Z'), times=c(15, 20, 15)))
covars <- data.frame(Grade=cla, Stage=cla2)
res <- MultiLinearModel(Y ~ Grade + Stage, covars, dat)
summary(res)
hist(res, breaks=101)
plot(res)
plot(res, res@p.values)

graded <- MultiLinearModel(Y ~ Grade, covars, dat)
summary(graded)

hist(graded@p.values, breaks=101)
hist(res@p.values, breaks=101)

oop <- anova(res, graded)
hist(oop$p.values, breaks=101)



