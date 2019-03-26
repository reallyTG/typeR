library(relaxnet)


### Name: relaxnet
### Title: Relaxation (as in Relaxed Lasso, Meinshausen 2007) applied to
###   glmnet Models
### Aliases: relaxnet

### ** Examples

## generate predictor matrix

nobs <- 100
nvars <- 200

set.seed(23)

x <- matrix(rnorm(nobs * nvars), nobs, nvars)

## make sure it has unique colnames

colnames(x) <- paste("x", 1:ncol(x), sep = "")

## let y depend on first 5 columns plus noise

y <- rowSums(x[, 1:5]) + rnorm(nrow(x))

## default is family = "gaussian"

result1 <- relaxnet(x, y)

summary(result1)

## now fit family = "binomial" model

y.bin <- rbinom(nrow(x), 1, prob = plogis(0.2 * rowSums(x[, 1:5])))

result2 <- relaxnet(x, y.bin, family = "binomial")

summary(result2)



