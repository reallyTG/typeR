library(grpreg)


### Name: predict.grpsurv
### Title: Model predictions based on a fitted "grpsurv" object.
### Aliases: predict.grpsurv coef.grpsurv

### ** Examples

data(Lung)
X <- Lung$X
y <- Lung$y
group <- Lung$group

fit <- grpsurv(X, y, group)
coef(fit, lambda=0.05)
head(predict(fit, X, type="link", lambda=0.05))
head(predict(fit, X, type="response", lambda=0.05))

# Survival function
S <- predict(fit, X[1,], type="survival", lambda=0.05)
S(100)
S <- predict(fit, X, type="survival", lambda=0.05)
plot(S, xlim=c(0,200))

# Medians
predict(fit, X[1,], type="median", lambda=0.05)
M <- predict(fit, X, type="median")
M[1:10, 1:10]

# Nonzero coefficients
predict(fit, type="vars", lambda=c(0.1, 0.01))
predict(fit, type="nvars", lambda=c(0.1, 0.01))



