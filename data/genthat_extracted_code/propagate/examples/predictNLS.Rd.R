library(propagate)


### Name: predictNLS
### Title: Confidence/prediction intervals for (weighted) nonlinear models
###   based on uncertainty propagation
### Aliases: predictNLS
### Keywords: array algebra multivariate

### ** Examples

## In these examples, 'nsim = 100000' to save
## Rcmd check time (CRAN). It is advocated
## to use at least 'nsim = 1000000' though...

## Example from ?nls.
DNase1 <- subset(DNase, Run == 1)
fm3DNase1 <- nls(density ~ Asym/(1 + exp((xmid - log(conc))/scal)),
                 data = DNase1, start = list(Asym = 3, xmid = 0, scal = 1))

## Using a single predictor value without error.
PROP1 <- predictNLS(fm3DNase1, newdata = data.frame(conc = 2), nsim = 100000)
PRED1 <- predict(fm3DNase1, newdata = data.frame(conc = 2), nsim = 100000)
PROP1$summary
PRED1
## => Prop.Mean.1 equal to PRED1

## Using a single predictor value with error.
PROP2 <- predictNLS(fm3DNase1, newdata = data.frame(conc = 2), 
                    newerror = data.frame(conc = 0.5), nsim = 100000)
PROP2$summary

## Not run: 
##D ## Using a sequence of predictor values without error.
##D CONC <- seq(1, 12, by = 1)
##D PROP3 <- predictNLS(fm3DNase1, newdata = data.frame(conc = CONC))
##D PRED3 <- predict(fm3DNase1, newdata = data.frame(conc = CONC))
##D PROP3$summary
##D PRED3
##D ## => Prop.Mean.1 equal to PRED3
##D 
##D ## Plot mean and confidence values from first-/second-order 
##D ## Taylor expansion and Monte Carlo simulation.
##D plot(DNase1$conc, DNase1$density)
##D lines(DNase1$conc, fitted(fm3DNase1), lwd = 2, col = 1)
##D points(CONC, PROP3$summary[, 1], col = 2, pch = 16)
##D lines(CONC, PROP3$summary[, 5], col = 2)
##D lines(CONC, PROP3$summary[, 6], col = 2)
##D lines(CONC, PROP3$summary[, 11], col = 4)
##D lines(CONC, PROP3$summary[, 12], col = 4)
##D 
##D ## Using a sequence of predictor values with error.
##D PROP4 <- predictNLS(fm3DNase1, newdata = data.frame(conc = 1:5), 
##D                     newerror = data.frame(conc = (1:5)/10))
##D PROP4$summary
##D 
##D ## Using multiple predictor values.
##D ## 1: Setup of response values with gaussian error of 10%.
##D x <- seq(1, 10, by = 0.01)
##D y <- seq(10, 1, by = -0.01)
##D a <- 2
##D b <- 5
##D c <- 10
##D z <- a * exp(b * x)^sin(y/c)
##D z <- z + sapply(z, function(x) rnorm(1, x, 0.10 * x))
##D 
##D ## 2: Fit 'nls' model.
##D MOD <- nls(z ~ a * exp(b * x)^sin(y/c), 
##D            start = list(a = 2, b = 5, c = 10))
##D 
##D ## 3: Single newdata without errors.
##D DAT1 <- data.frame(x = 4, y = 3)
##D PROP5 <- predictNLS(MOD, newdata = DAT1)
##D PROP5$summary
##D 
##D ## 4: Single newdata with errors.
##D DAT2 <- data.frame(x = 4, y = 3)
##D ERR2 <- data.frame(x = 0.2, y = 0.1)
##D PROP6 <- predictNLS(MOD, newdata = DAT2, newerror = ERR2)
##D PROP6$summary
##D 
##D ## 5: Multiple newdata with errors.
##D DAT3 <- data.frame(x = 1:4, y = 3)
##D ERR3 <- data.frame(x = rep(0.2, 4), y = seq(1:4)/10)
##D PROP7 <- predictNLS(MOD, newdata = DAT3, newerror = ERR3)
##D PROP7$summary
##D 
##D ## 6: Linear model to compare conf/pred intervals.
##D set.seed(123)
##D X <- 1:20
##D Y <- 3 + 2 * X + rnorm(20, 0, 2)
##D plot(X, Y)
##D LM <- lm(Y ~ X)
##D NLS <- nlsLM(Y ~ a + b * X, start = list(a = 3, b = 2)) 
##D predict(LM, newdata = data.frame(X = 14.5), interval = "conf") 
##D predictNLS(NLS, newdata = data.frame(X = 14.5), interval = "conf")$summary
##D predict(LM, newdata = data.frame(X = 14.5), interval = "pred")
##D predictNLS(NLS, newdata = data.frame(X = 14.5), interval = "pred")$summary
##D 
##D ## 7: compare to 'predFit' function of 'investr' package.
##D ## Same results when using only first-order Taylor expansion.
##D require(investr)
##D data(Puromycin, package = "datasets")
##D Puromycin2 <- Puromycin[Puromycin$state == "treated", ][, 1:2]
##D Puro.nls <- nls(rate ~ Vm * conc/(K + conc), data = Puromycin2,
##D                 start = c(Vm = 200, K = 0.05))
##D PRED1 <- predFit(Puro.nls, interval = "prediction")
##D PRED2 <- predictNLS(Puro.nls, interval = "prediction", second.order = FALSE, do.sim = FALSE)
##D all.equal(PRED1[, "lwr"], PRED2$summary[, 5]) # => TRUE
## End(Not run) 



