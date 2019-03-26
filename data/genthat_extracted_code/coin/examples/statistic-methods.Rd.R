library(coin)


### Name: statistic-methods
### Title: Extraction of the Test Statistic and Linear Statistic
### Aliases: statistic statistic-methods
###   statistic,IndependenceLinearStatistic-method
###   statistic,IndependenceTest-method
###   statistic,IndependenceTestStatistic-method
### Keywords: methods

### ** Examples

## Example data
dta <- data.frame(
    y = gl(4, 5),
    x = gl(5, 4)
)

## Asymptotic Cochran-Mantel-Haenszel Test
ct <- cmh_test(y ~ x, data = dta)

## Test statistic
statistic(ct)

## The unstandardized linear statistic...
statistic(ct, type = "linear")

## ...is identical to the contingency table
xtabs(~ x + y, data = dta)

## Illustrating departures from the null hypothesis of independence using the
## standardized linear statistic
statistic(ct, type = "standardized")



