library(PMmisc)


### Name: reg.aic
### Title: AIC for lm.fit
### Aliases: reg.aic

### ** Examples

X <- as.matrix(cbind(1,EuStockMarkets[,1:2])) # create the design matrix
Y <- as.data.frame(EuStockMarkets)$FTSE
fit <- lm.fit(x = X, y = Y)
w <- rep(1,length(Y))
reg.aic(fit,w)



