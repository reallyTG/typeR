library(grpreg)


### Name: cv.grpreg
### Title: Cross-validation for grpreg/grpsurv
### Aliases: cv.grpreg cv.grpsurv

### ** Examples

data(Birthwt)
X <- Birthwt$X
y <- Birthwt$bwt
group <- Birthwt$group

cvfit <- cv.grpreg(X, y, group)
plot(cvfit)
summary(cvfit)
coef(cvfit) ## Beta at minimum CVE

cvfit <- cv.grpreg(X, y, group, penalty="gel")
plot(cvfit)
summary(cvfit)



