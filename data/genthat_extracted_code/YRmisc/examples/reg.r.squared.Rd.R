library(YRmisc)


### Name: reg.r.squared
### Title: R-squared for lm.fit
### Aliases: reg.r.squared

### ** Examples

X <- as.matrix(cbind(1,EuStockMarkets[,1:2])) # create the design matrix
Y <- as.data.frame(EuStockMarkets)$FTSE
fit <- lm.fit(x = X, y = Y)
me <- mean(Y)
SSR <- sum((fit$fitted.values - me)^2)
SSTO <- sum((Y - me)^2)
reg.r.squared(SSR,SSTO)



