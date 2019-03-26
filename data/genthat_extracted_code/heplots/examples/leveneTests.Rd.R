library(heplots)


### Name: leveneTests
### Title: Levene Tests of Homogeneity of Variances
### Aliases: leveneTests
### Keywords: htest

### ** Examples

leveneTests(iris[,1:4], iris$Species)

# handle a 1-column response?
leveneTests(iris[,1, drop=FALSE], iris$Species)

data(Skulls, package="heplots")
leveneTests(Skulls[,-1], Skulls$epoch)




