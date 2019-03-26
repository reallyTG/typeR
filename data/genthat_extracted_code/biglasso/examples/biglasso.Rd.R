library(biglasso)


### Name: biglasso
### Title: Fit lasso penalized regression path for big data
### Aliases: biglasso

### ** Examples


## Linear regression
data(colon)
X <- colon$X
y <- colon$y
X.bm <- as.big.matrix(X)
# lasso, default
par(mfrow=c(1,2))
fit.lasso <- biglasso(X.bm, y, family = 'gaussian')
plot(fit.lasso, log.l = TRUE, main = 'lasso')
# elastic net
fit.enet <- biglasso(X.bm, y, penalty = 'enet', alpha = 0.5, family = 'gaussian')
plot(fit.enet, log.l = TRUE, main = 'elastic net, alpha = 0.5')

## Logistic regression
data(colon)
X <- colon$X
y <- colon$y
X.bm <- as.big.matrix(X)
# lasso, default
par(mfrow = c(1, 2))
fit.bin.lasso <- biglasso(X.bm, y, penalty = 'lasso', family = "binomial")
plot(fit.bin.lasso, log.l = TRUE, main = 'lasso')
# elastic net
fit.bin.enet <- biglasso(X.bm, y, penalty = 'enet', alpha = 0.5, family = "binomial")
plot(fit.bin.enet, log.l = TRUE, main = 'elastic net, alpha = 0.5')




