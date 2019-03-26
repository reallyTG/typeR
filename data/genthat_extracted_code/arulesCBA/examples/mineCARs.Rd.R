library(arulesCBA)


### Name: mineCARs
### Title: Mine Class Association Rules
### Aliases: mineCARs

### ** Examples

data("iris")

iris.disc <- discretizeDF.supervised(Species ~ ., iris)
iris.trans <- as(iris.disc, "transactions")

# mine CARs with items for "Species" in the RHS
cars <- mineCARs(Species ~ ., iris.trans, parameter = list(support = 0.3))
inspect(cars)

# restrict the predictors to items starting with "Sepal"
cars <- mineCARs(Species ~ Sepal, iris.trans, parameter = list(support = 0.1))
inspect(cars)



