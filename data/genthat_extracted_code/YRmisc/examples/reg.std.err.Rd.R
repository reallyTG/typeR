library(YRmisc)


### Name: reg.std.err
### Title: Standard error for lim.fit
### Aliases: reg.std.err

### ** Examples

X <- as.matrix(cbind(1,EuStockMarkets[,1:2])) # create the design matrix
Y <- as.data.frame(EuStockMarkets)$FTSE
fit <- lm.fit(x = X, y = Y)
SSE <- sum((Y - fit$fitted.values)^2)
dof <- reg.dof(fit)
reg.std.err(SSE,dof)



