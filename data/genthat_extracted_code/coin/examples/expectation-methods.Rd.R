library(coin)


### Name: expectation-methods
### Title: Extraction of the Expectation, Variance and Covariance of the
###   Linear Statistic
### Aliases: expectation expectation-methods
###   expectation,IndependenceLinearStatistic-method
###   expectation,IndependenceTest-method variance variance-methods
###   variance,CovarianceMatrix-method
###   variance,IndependenceLinearStatistic-method
###   variance,IndependenceTest-method variance,Variance-method covariance
###   covariance-methods covariance,CovarianceMatrix-method
###   covariance,IndependenceLinearStatistic-method
###   covariance,IndependenceTest-method
### Keywords: methods

### ** Examples

## Example data
dta <- data.frame(
    y = gl(3, 2),
    x = sample(gl(3, 2))
)

## Asymptotic Cochran-Mantel-Haenszel Test
ct <- cmh_test(y ~ x, data = dta)

## The linear statistic, i.e., the contingency table...
(l <- statistic(ct, type = "linear"))

## ...and its expectation...
(El <- expectation(ct))

## ...and covariance
(Vl <- covariance(ct))

## The standardized contingency table...
(l - El) / sqrt(variance(ct))

## ...is identical to the standardized linear statistic
statistic(ct, type = "standardized")



