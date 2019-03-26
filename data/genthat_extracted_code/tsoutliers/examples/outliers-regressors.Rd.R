library(tsoutliers)


### Name: outliers.regressors
### Title: Regressor Variables for the Detection of Outliers
### Aliases: outliers.regressors
### Keywords: ts

### ** Examples

# regression of the residuals from the ARIMA model 
# on the corresponding regressors for three additive outliers
# at the 5% level, the first AO is not significant, the others are significant
data("hicp")
y <- log(hicp[["011600"]])
fit <- arima(y, order = c(1, 1, 0), seasonal = list(order = c(2, 0, 2)))
resid <- residuals(fit)
pars <- coefs2poly(fit)
mo <- outliers(rep("AO", 3), c(10, 79, 224))
xreg <- outliers.regressors(pars, mo, length(y))
summary(lm(residuals(fit) ~ 0 + xreg)) 



