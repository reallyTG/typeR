library(heplots)


### Name: bartlettTests
### Title: Bartlett Tests of Homogeneity of Variances
### Aliases: bartlettTests
### Keywords: htest

### ** Examples

bartlettTests(iris[,1:4], iris$Species)

data(Skulls, package="heplots")
bartlettTests(Skulls[,-1], Skulls$epoch)




