library(grpreg)


### Name: plot.cv.grpreg
### Title: Plots the cross-validation curve from a 'cv.grpreg' object
### Aliases: plot.cv.grpreg

### ** Examples

# Birthweight data
data(Birthwt)
X <- Birthwt$X
group <- Birthwt$group

# Linear regression
y <- Birthwt$bwt
cvfit <- cv.grpreg(X, y, group)
plot(cvfit)
par(mfrow=c(2,2))
plot(cvfit, type="all")

## Logistic regression
y <- Birthwt$low
cvfit <- cv.grpreg(X, y, group, family="binomial")
plot(cvfit)
par(mfrow=c(2,2))
plot(cvfit, type="all")



