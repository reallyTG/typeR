library(PMmisc)


### Name: reg.dof
### Title: Degree of freedom for lim.fit
### Aliases: reg.dof

### ** Examples

X <- as.matrix(cbind(1,EuStockMarkets[,1:2])) # create the design matrix
Y <- as.data.frame(EuStockMarkets)$FTSE
fit <- lm.fit(x = X, y = Y)
reg.dof(fit)



