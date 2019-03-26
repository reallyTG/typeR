library(onewaytests)


### Name: homog.test
### Title: Variance Homogeneity Tests
### Aliases: homog.test
### Keywords: functions

### ** Examples


library(onewaytests)

homog.test(Sepal.Length ~ Species, data = iris)
homog.test(Sepal.Length ~ Species, data = iris, method = "Bartlett")




