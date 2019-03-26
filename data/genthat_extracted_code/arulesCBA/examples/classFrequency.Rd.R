library(arulesCBA)


### Name: classFrequency
### Title: Class Frequency in Transactions or CAR Sets
### Aliases: classFrequency

### ** Examples

data("iris")

iris.disc <- discretizeDF.supervised(Species ~ ., iris)
iris.trans <- as(iris.disc, "transactions")

# Class distribution. The iris dataset is perfectly balanced.
classFrequency(Species ~ ., iris.trans)

# Number of rules for each class
cars <- mineCARs(Species ~ ., iris.trans, parameter = list(support = 0.3))
classFrequency(Species ~ ., cars, type = "absolute")



