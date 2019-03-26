library(onewaytests)


### Name: welch.test
### Title: Welch's Heteroscedastic F Test and Welch's Heteroscedastic F
###   Test with Trimmed Means and Winsorized Variances
### Aliases: welch.test
### Keywords: functions

### ** Examples


library(onewaytests)

welch.test(Sepal.Length ~ Species, data = iris)
welch.test(Sepal.Length ~ Species, data = iris, rate = 0.1)




