library(ncvreg)


### Name: summary.cv.ncvreg
### Title: Summarizing cross-validation-based inference
### Aliases: summary.cv.ncvreg print.summary.cv.ncvreg

### ** Examples

# Linear regression --------------------------------------------------
data(Prostate)
cvfit <- cv.ncvreg(Prostate$X, Prostate$y)
summary(cvfit)

# Logistic regression ------------------------------------------------
data(Heart)
cvfit <- cv.ncvreg(Heart$X, Heart$y, family="binomial")
summary(cvfit)

# Cox regression -----------------------------------------------------
data(Lung)
cvfit <- cv.ncvsurv(Lung$X, Lung$y)
summary(cvfit)



