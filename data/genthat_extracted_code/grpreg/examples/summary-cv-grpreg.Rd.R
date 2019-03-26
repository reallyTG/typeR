library(grpreg)


### Name: summary.cv.grpreg
### Title: Summarizing inferences based on cross-validation
### Aliases: summary.cv.grpreg print.summary.cv.grpreg

### ** Examples

# Birthweight data
data(Birthwt)
X <- Birthwt$X
group <- Birthwt$group

# Linear regression
y <- Birthwt$bwt
cvfit <- cv.grpreg(X, y, group)
summary(cvfit)

# Logistic regression
y <- Birthwt$low
cvfit <- cv.grpreg(X, y, group, family="binomial")
summary(cvfit)

# Cox regression
data(Lung)
cvfit <- with(Lung, cv.grpsurv(X, y, group))
summary(cvfit)



