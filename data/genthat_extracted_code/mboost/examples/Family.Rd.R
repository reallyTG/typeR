library(mboost)


### Name: Family
### Title: Gradient Boosting Families
### Aliases: Family AdaExp Binomial GaussClass GaussReg Gaussian Huber
###   Laplace Poisson GammaReg CoxPH QuantReg ExpectReg NBinomial PropOdds
###   Weibull Loglog Lognormal AUC Gehan Hurdle Multinomial Cindex RCG
### Keywords: models

### ** Examples

### Define a new family
MyGaussian <- function(){
       Family(ngradient = function(y, f, w = 1) y - f,
       loss = function(y, f) (y - f)^2,
       name = "My Gauss Variant")
}
# Now use the new family
data(bodyfat, package = "TH.data")
mod <- mboost(DEXfat ~ ., data = bodyfat, family = MyGaussian())
# N.B. that the family needs to be called with empty brackets


## No test: 
############################################################
## Do not run and check these examples automatically as
## they take some time

### Proportional odds model
data(iris)
iris$Species <- factor(iris$Species, ordered = TRUE)
if (require("MASS")) {
    (mod.polr <- polr(Species  ~ Sepal.Length, data = iris))
}
mod.PropOdds <- glmboost(Species  ~ Sepal.Length, data = iris,
                         family = PropOdds(nuirange = c(-0.5, 3)))
mstop(mod.PropOdds) <- 1000
## thresholds are treated as nuisance parameters, to extract these use
nuisance(mod.PropOdds)
## effect estimate
coef(mod.PropOdds)["Sepal.Length"]
## make thresholds comparable to a model without intercept
nuisance(mod.PropOdds) - coef(mod.PropOdds)["(Intercept)"] -
    attr(coef(mod.PropOdds), "offset")

## End(Not run and test)
## End(No test)

### Multinomial logit model via a linear array model
## One needs to convert the data to a list
myiris <- as.list(iris)
## ... and define a dummy vector with one factor level less
## than the outcome, which is used as reference category.
myiris$class <- factor(levels(iris$Species)[-nlevels(iris$Species)])
## Now fit the linear array model
mlm <- mboost(Species ~ bols(Sepal.Length, df = 2) %O%
                        bols(class, df = 2, contrasts.arg = "contr.dummy"),
              data = myiris,
              family = Multinomial())
coef(mlm) ## one should use more boosting iterations.
head(round(pred <- predict(mlm, type = "response"), 2))

## Prediction with new data:
newdata <- as.list(iris[1,])
## One always needs to keep the dummy vector class as above!
newdata$class <- factor(levels(iris$Species)[-nlevels(iris$Species)])
pred2 <- predict(mlm, type = "response", newdata = newdata)
## check results
pred[1, ]
pred2

## No test: 
############################################################
## Do not run and check these examples automatically as
## they take some time

## Compare results with nnet::multinom
if (require("nnet")) {
    mlmn <- multinom(Species ~ Sepal.Length, data = iris)
    max(abs(fitted(mlm[1000], type = "response") -
            fitted(mlmn, type = "prob")))
}

## End(Not run and test)
## End(No test)


## No test: 
############################################################
## Do not run and check these examples automatically as
## they take some time

### Example for RCG model
## generate covariate values
set.seed(12345)
x1 <- rnorm(500)
x2 <- rnorm(500)
## generate linear predictors
zetaM <- 0.1 + 0.3 * x1 - 0.5 * x2 
zetaU <- 0.1 - 0.1 * x1 + 0.2 * x2
## generate beta values
M <- rgamma(500, shape = 2, rate = exp(zetaM))
U <- rgamma(500, shape = 2, rate = exp(zetaU))
y <- M / (M + U)

## fit RCG model
data <- data.frame(y, x1, x2)
RCGmodel <- glmboost(y ~ x1 + x2, data = data, family = RCG(),
                     control = boost_control(mstop = 2000,
                     trace = TRUE, nu = 0.01))
## true coefficients: gamma = (0.0, 0.4, -0.7),
##                    alpha (= shape) = 2,
##                    rho = 0
## compare to coefficient estimates
coef(RCGmodel)
nuisance(RCGmodel)

## compute downstream tests 
## (only suitable without early stopping, i.e., if likelihood based model converged)
downstream.test(RCGmodel)

## compute conditional expectations
predictions <- predict(RCGmodel, type = "response")
plot(predictions, y)
abline(0,1)

## End(Not run and test)
## End(No test)






