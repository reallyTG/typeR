library(MXM)


### Name: Many Wald based tests for logistic and Poisson regressions with continuous predictors
### Title: Many Wald based tests for logistic and Poisson regressions with
###   continuous predictors
### Aliases: wald.logisticregs wald.poissonregs
### Keywords: Poisson regressions logistic regressions Wald test

### ** Examples

## 200 variables, hence 200 univariate regressions are to be fitted
x <- matrix( rnorm(100 * 1000), ncol = 1000 )
y <- rpois(100, 4)
a <- wald.poissonregs(y, x)
b <- univregs(y, x, test = testIndPois)
cor(exp(a[, 2]), exp(b$pvalue) )



