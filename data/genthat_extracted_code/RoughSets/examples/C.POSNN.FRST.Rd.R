library(RoughSets)


### Name: C.POSNN.FRST
### Title: The positive region based fuzzy-rough nearest neighbor algorithm
### Aliases: C.POSNN.FRST

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

colnames(iris.training) <- c("Sepal.Length", "Sepal.Width", "Petal.Length",
                       "Petal.Width", "Species")

## convert into the standard decision table
decision.table <- SF.asDecisionTable(dataset = iris.training, decision.attr = 5,
                                     indx.nominal = c(5))
tst.iris <- SF.asDecisionTable(dataset = iris.testing)

## FRNN algorithm using lower/upper approximation: Implicator/tnorm based approach
control <- list(type.LU = "implicator.tnorm", k = 20, t.tnorm = "lukasiewicz",
                type.relation = c("tolerance", "eq.1"), t.implicator = "lukasiewicz")

## Not run: 
##D res.test.POSNN <- C.POSNN.FRST(decision.table = decision.table,
##D                               newdata = tst.iris, control = control)
## End(Not run)



