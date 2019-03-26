## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=6)

## ---- message = FALSE----------------------------------------------------
# As example we use the dataset 'cats' from the library 'MASS'.  
require(lmvar); require(MASS)

# A plot of the heart weight versus the body weight in the data set
plot(cats$Bwt, cats$Hwt, xlab = "Body weight", ylab = "Heart weight")

## ------------------------------------------------------------------------
# Create the model matrix. It only contains the body weight. An intercept term will be added by 'lmvar'. 
X = model.matrix(~ Bwt - 1, cats)

# Carry out the fit with the same model matrix for mu (the expected heart weight) and for log sigma (the standard deviation)
fit = lmvar(cats$Hwt, X_mu = X, X_sigma = X)

## ------------------------------------------------------------------------
summary(fit)

## ------------------------------------------------------------------------
nobs(fit)
logLik(fit)

## ------------------------------------------------------------------------
dfree(fit, sigma = FALSE)

## ------------------------------------------------------------------------
fit = lmvar(cats$Hwt, X_mu = X, X_sigma = X, intercept_mu = FALSE, intercept_sigma = FALSE)

## ------------------------------------------------------------------------
dfree(fit, sigma = FALSE)

## ------------------------------------------------------------------------
summary(fit)

## ------------------------------------------------------------------------
sigma = fitted(fit, mu = FALSE)
plot(cats$Bwt, residuals(fit) / sigma, xlab = "Body weight", ylab = "z-score")
abline(0, 0, col = "red")

## ------------------------------------------------------------------------
mu = fitted(fit, sigma = FALSE)

plot(cats$Bwt, mu, xlab = "Body weight", ylab = "Average heart weight", ylim = c(7, 16))

intervals = fitted(fit, interval = "confidence", level = 0.95)
lwr = intervals[, "mu_lwr"]
upr = intervals[, "mu_upr"]

segments(cats$Bwt, lwr, cats$Bwt, upr)

## ------------------------------------------------------------------------
fit_lm = lm(cats$Hwt ~ Bwt - 1, cats)

## ------------------------------------------------------------------------
AIC(fit); AIC(fit_lm)
BIC(fit); BIC(fit_lm)

## ------------------------------------------------------------------------
plot(cats$Bwt, mu, xlab = "Body weight", ylab = "Average heart weight", ylim = c(7, 16))
segments(cats$Bwt, lwr, cats$Bwt, upr)
points(cats$Bwt, fitted(fit_lm), col = "red")

## ------------------------------------------------------------------------
plot(cats$Bwt, sigma, xlab = "Body weight", ylab = "St dev of heart weight", ylim = c(1, 2))

lwr = intervals[, "sigma_lwr"]
upr = intervals[, "sigma_upr"]
segments(cats$Bwt, lwr, cats$Bwt, upr)

sigma_lm = summary(fit_lm)$sigma
abline(sigma_lm, 0, col = "red")

## ------------------------------------------------------------------------
coef(fit)

## ------------------------------------------------------------------------
coef(fit, mu = FALSE)

## ------------------------------------------------------------------------
vcov(fit)

## ---- eval=FALSE---------------------------------------------------------
#  require(statmod)
#  
#  # Run the regression including intercept terms
#  intercept = rep(1, nrow(cats))
#  
#  fit = remlscore( cats$Hwt, cbind(intercept, X), cbind(intercept, X))

## ---- eval=FALSE---------------------------------------------------------
#  require(crch)
#  
#  # Run the regression including intercept terms
#  fit = crch(Hwt ~ Bwt | Bwt , data = cats)

## ---- eval=FALSE---------------------------------------------------------
#  require(mgcv)
#  
#  # Run the regression including intercept terms
#  fit = gam(list(Hwt ~ Bwt, ~ Bwt) , data = cats, family = gaulss())

## ---- eval=FALSE---------------------------------------------------------
#  require(gamlss)
#  
#  # Run the regression including intercept terms
#  fit = gamlss(Hwt ~ Bwt, ~ Bwt, data = cats)

