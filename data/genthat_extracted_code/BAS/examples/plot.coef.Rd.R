library(BAS)


### Name: plot.coef.bas
### Title: Plots the posterior distributions of coefficients derived from
###   Bayesian model averaging
### Aliases: plot.coef.bas
### Keywords: regression

### ** Examples


## Not run: 
##D library(MASS)
##D data(UScrime)
##D UScrime[,-2] <- log(UScrime[,-2])
##D crime_bic <- bas.lm(y ~ ., data=UScrime, n.models=2^15, prior="BIC")
##D plot(coefficients(crime_bic), ask=TRUE)
## End(Not run)




