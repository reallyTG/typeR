library(randomUniformForest)


### Name: fillNA2.randomUniformForest
### Title: Missing values imputation by randomUniformForest
### Aliases: fillNA2.randomUniformForest rufImpute

### ** Examples

## not run

## A - usual case
# get same example as rfImpute() function from randomForest package
# data(iris)
# iris.na <- iris
# set.seed(111)
## artificially drop some data values.
# for (i in 1:4) iris.na[sample(150, sample(20)), i] <- NA

## imputation 
# iris.imputed <- fillNA2.randomUniformForest(iris.na, threads = 1)

## model with imputation
# iris.NAfixed.ruf <- randomUniformForest(Species ~ ., iris.imputed, 
# BreimanBounds = FALSE, threads = 1)
# iris.NAfixed.ruf

## Compare with true data (OOB evaluation)
# iris.ruf <- randomUniformForest(Species ~ ., iris, BreimanBounds = FALSE, threads = 1)
# iris.ruf

## B - hard case : titanic dataset
## see http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic.html
## for more informations

# URL = "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/"
# dataset = "titanic3.csv"
# titanic3 = read.csv(paste(URL, dataset, sep =""))

## 1309 observations, 14 variables, 2 classes
# XY = titanic3
# Y = XY[,"survived"]
# X = XY[,-which(colnames(XY) == "survived")]

## remove name :
# XX = X = X[,-2]

## first imputation : not working good because missing values are "" and NA
# X.imputed.1 = rufImpute(X)

# head(X.imputed.1)
# head(X)

## 1 - one first has to replace all factors by characters in order to handle ""
# for (j in 1:ncol(X))
# {	if (is.factor(X[,j])) { XX[,j] = as.character(X[,j]) } }

## 2 - replace "" by "?"
# XX[which(XX == "", arr.ind  = TRUE)] = "?"

## 3 - impute by including "?" in missing values, 
## increasing 'maxClasses' to be sure to match all categorical variables
## setting categorical variables explicitly (they may be integers, factors or characters)
## Note : integers may also be viewed as numerical values

# str(XX) ##gives the type of all variables

# categoricalVariables = vector();  i = 1
# for (j in 1:ncol(X)) 
# { 
#	if (class(X[,j]) != "numeric") { categoricalVariables[i] = j; i = i + 1 }
# }

# X.imputed.1 = rufImpute(XX, NAgrep = "?", maxClasses = 1200, 
# categorical = categoricalVariables)

# Take a random sample and compare
# idx = sample(nrow(X), 20)
# X[idx,]
# X.imputed.1[idx,]

## modify eventually some numeric values like 'age' to match cases
## use more trees and less randomization to possibly increase accuracy 
## at the risk of less consistency.

# X.imputed.2 = rufImpute(XX, NAgrep = "?", maxClasses = 1200, mtry = 4, nodesize = 5,
# ntree = 200, categorical = categoricalVariables)

## 4- assess the imputed matrix : OOB evaluation
## - base model : omit missing values is not possible (too many ones). Roughly impute instead.
# titanic.baseModel.ruf = randomUniformForest(X, as.factor(Y), na.action = "fastImpute",
# categorical = categoricalVariables)

# titanic.baseModel.ruf

## - imputed model
# titanic.imputedModel.ruf = randomUniformForest(X.imputed.1, as.factor(Y), 
# categorical = categoricalVariables)

# titanic.imputedModel.ruf

## roughly (and internal) imputation works better in this case and one should investigate
## models and data to understand possible reasons (one influential feature, many categories, ...)



