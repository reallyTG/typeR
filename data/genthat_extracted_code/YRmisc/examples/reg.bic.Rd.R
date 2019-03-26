library(YRmisc)


### Name: reg.bic
### Title: BIC for lm.fit
### Aliases: reg.bic

### ** Examples

X <- as.matrix(cbind(1,EuStockMarkets[,1:2])) # create the design matrix
Y <- as.data.frame(EuStockMarkets)$FTSE
fit <- lm.fit(x = X, y = Y)
w <- rep(1,length(Y))
reg.bic(fit,w)



