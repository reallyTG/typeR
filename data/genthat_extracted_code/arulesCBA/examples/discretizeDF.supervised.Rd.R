library(arulesCBA)


### Name: discretizeDF.supervised
### Title: Supervised Methods to Convert Continuous Variables into
###   Categorical Variables
### Aliases: discretizeDF.supervised discretizeDF discretize
### Keywords: manip

### ** Examples

data("iris")
summary(iris)

# supervised discretization using Species
iris.disc <- discretizeDF.supervised(Species ~ ., iris)
summary(iris.disc)

attributes(iris.disc$Sepal.Length)

# discretize the first few instances of iris using the same breaks as iris.disc
discretizeDF(head(iris), methods = iris.disc)

# only discretize predictors Sepal.Length and Petal.Length
iris.disc2 <- discretizeDF.supervised(Species ~ Sepal.Length + Petal.Length, iris)
head(iris.disc2)



