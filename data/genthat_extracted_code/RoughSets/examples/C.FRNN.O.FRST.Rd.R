library(RoughSets)


### Name: C.FRNN.O.FRST
### Title: The fuzzy-rough ownership nearest neighbor algorithm
### Aliases: C.FRNN.O.FRST

### ** Examples

#############################################################
## In this example, we are using Iris dataset.
## It should be noted that since the values of the decision attribute are strings,
## they should be transformed into numeric values using unclass()
#############################################################
data(iris)
## shuffle the data
set.seed(2)
irisShuffled <- iris[sample(nrow(iris)),]

## transform values of the decision attribute into numerics
irisShuffled[,5] <- unclass(irisShuffled[,5])

## split the data into training and testing data
iris.training <- irisShuffled[1:105,]
iris.testing <- irisShuffled[106:nrow(irisShuffled),1:4]

## convert into the standard decision table
colnames(iris.training) <- c("Sepal.Length", "Sepal.Width", "Petal.Length",
                             "Petal.Width", "Species")
decision.table <- SF.asDecisionTable(dataset = iris.training, decision.attr = 5,
                                    indx.nominal = c(5))
tst.iris <- SF.asDecisionTable(dataset = iris.testing)

## in this case, we are using "gradual" for type of membership
control <- list(m = 2)

## Not run: 
##D res.test.FRNN.O <- C.FRNN.O.FRST(decision.table = decision.table, newdata = tst.iris,
##D                                  control = control)
## End(Not run)



