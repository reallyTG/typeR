library(onewaytests)


### Name: nor.test
### Title: Normality Tests
### Aliases: nor.test
### Keywords: functions

### ** Examples


library(onewaytests)

nor.test(Sepal.Length ~ Species, data = iris, method = "SW", plot = "qqplot-histogram")
nor.test(Sepal.Length ~ Species, data = iris, method = "SF", plot = "qqplot", mfrow = c(1,3))




