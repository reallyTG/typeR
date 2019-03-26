library(gren)


### Name: predict.gren
### Title: Predictions and coefficients from gren model.
### Aliases: predict.gren coef.gren

### ** Examples

## No test: 
## Create data
p <- 1000
n <- 100
set.seed(2018)
x <- matrix(rnorm(n*p), ncol=p, nrow=n)
beta <- c(rnorm(p/2, 0, 0.1), rnorm(p/2, 0, 1))
m <- rep(1, n)
y <- rbinom(n, m, as.numeric(1/(1 + exp(-x %*% as.matrix(beta)))))
partitions <- list(groups=rep(c(1, 2), each=p/2))

## estimate model
fit.gren <- gren(x, y, m, partitions=partitions)

## create new data
xnew <- matrix(rnorm(n*p), ncol=p, nrow=n)

## create predictions/coefficients
preds <- predict(fit.gren, xnew, type="groupreg")
coefs <- coef(fit.gren, type="groupreg")
## End(No test)



