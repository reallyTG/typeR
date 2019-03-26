library(frbs)


### Name: frbs-package
### Title: Getting started with the frbs package
### Aliases: frbs frbs-package

### ** Examples

##################################
## I. Regression Problem
## In this example, we are using the gas furnace dataset that
## contains two input and one output variables.
##################################

## Input data: Using the Gas Furnace dataset
## then split the data to be training and testing datasets
data(frbsData)
data.train <- frbsData$GasFurnance.dt[1 : 204, ]
data.tst <- frbsData$GasFurnance.dt[205 : 292, 1 : 2]
real.val <- matrix(frbsData$GasFurnance.dt[205 : 292, 3], ncol = 1)

## Define interval of data
range.data <-apply(data.train, 2, range)

## Set the method and its parameters,
## for example, we use Wang and Mendel's algorithm
method.type <- "WM"
control <- list(num.labels = 15, type.mf = "GAUSSIAN", type.defuz = "WAM",
           type.tnorm = "MIN", type.snorm = "MAX", type.implication.func = "ZADEH",
               name = "sim-0")

## Learning step: Generate an FRBS model
object.reg <- frbs.learn(data.train, range.data, method.type, control)

## Predicting step: Predict for newdata
res.test <- predict(object.reg, data.tst)

## Display the FRBS model
summary(object.reg)

## Plot the membership functions
plotMF(object.reg)

##################################
## II. Classification Problem
## In this example, we are using the iris dataset that
## contains four input and one output variables.
##################################

## Input data: Using the Iris dataset
data(iris)
set.seed(2)

## Shuffle the data
## then split the data to be training and testing datasets
irisShuffled <- iris[sample(nrow(iris)), ]
irisShuffled[, 5] <- unclass(irisShuffled[, 5])
tra.iris <- irisShuffled[1 : 105, ]
tst.iris <- irisShuffled[106 : nrow(irisShuffled), 1 : 4]
real.iris <- matrix(irisShuffled[106 : nrow(irisShuffled), 5], ncol = 1)

## Define range of input data. Note that it is only for the input variables.
range.data.input <- apply(iris[, -ncol(iris)], 2, range)

## Set the method and its parameters. In this case we use FRBCS.W algorithm
method.type <- "FRBCS.W"
control <- list(num.labels = 7, type.mf = "GAUSSIAN", type.tnorm = "MIN",
               type.snorm = "MAX", type.implication.func = "ZADEH")

## Learning step: Generate fuzzy model
object.cls <- frbs.learn(tra.iris, range.data.input, method.type, control)

## Predicting step: Predict newdata
res.test <- predict(object.cls, tst.iris)

## Display the FRBS model
summary(object.cls)

## Plot the membership functions
plotMF(object.cls)

#################################################
## III. Constructing an FRBS model from human expert.
## In this example, we only consider the Mamdani model for regression. However,
## other models can be done in the same way.
## Note:
## In the examples, let us consider four input and one output variables.
#################################################

## Define a matrix representing shape and parameters of membership functions of input variables.
## The matrix has 5 rows where the first row represent the type of the membership function whereas
## others are values of its parameters.
## Detailed explanation can be seen in the fuzzifier function to construct the matrix.
varinp.mf <- matrix(c(2, 0, 20, 40, NA, 4, 20, 40, 60, 80, 3, 60, 80, 100, NA,
                      2, 0, 35, 75, NA, 3, 35, 75, 100, NA,
                      2, 0, 20, 40, NA, 1, 20, 50, 80, NA, 3, 60, 80, 100, NA,
                      2, 0, 20, 40, NA, 4, 20, 40, 60, 80, 3, 60, 80, 100, NA),
                      nrow = 5, byrow = FALSE)

## Define number of linguistic terms of input variables.
## Suppose, we have 3, 2, 3, and 3 numbers of linguistic terms
## for the first, second, third and fourth variables, respectively.
num.fvalinput <- matrix(c(3, 2, 3, 3), nrow=1)

## Give the names of the linguistic terms of each input variables.
varinput.1 <- c("low", "medium", "high")
varinput.2 <- c("yes", "no")
varinput.3 <- c("bad", "neutral", "good")
varinput.4 <- c("low", "medium", "high")
names.varinput <- c(varinput.1, varinput.2, varinput.3, varinput.4)

## Set interval of data.
range.data <- matrix(c(0, 100, 0, 100, 0, 100, 0, 100, 0, 100), nrow = 2)

## Define inference parameters.
## Detailed information about values can be seen in the inference function.
type.defuz <- "WAM"
type.tnorm <- "MIN"
type.snorm <- "MAX"
type.implication.func <- "ZADEH"

## Give the name of simulation.
name <- "Sim-0"

## Provide new data for testing.
newdata<- matrix(c(25, 40, 35, 15, 45, 75, 78, 70), nrow = 2, byrow = TRUE)
## the names of variables
colnames.var <- c("input1", "input2", "input3", "input4", "output1")

## Define number of linguistic terms of output variable.
## In this case, we set the number of linguistic terms to 3.
num.fvaloutput <- matrix(c(3), nrow = 1)

## Give the names of the linguistic terms of the output variable.
varoutput.1 <- c("bad", "neutral", "good")
names.varoutput <- c(varoutput.1)

## Define the shapes and parameters of the membership functions of the output variables.
varout.mf <- matrix(c(2, 0, 20, 40, NA, 4, 20, 40, 60, 80, 3, 60, 80, 100, NA),
                      nrow = 5, byrow = FALSE)

## Set type of model which is "MAMDANI".
type.model <- "MAMDANI"

## Define the fuzzy IF-THEN rules;
## In this example we are using the Mamdani model
## Note: e.g.,
## "a1", "and", "b1, "->", "e1" means that
## "IF inputvar.1 is a1 and inputvar.2 is b1 THEN outputvar.1 is e1"
## Make sure that each rule has a "->" sign.
rule <- matrix(
  c("low", "and", "yes", "and", "bad", "and", "low", "->", "bad",
    "medium", "and", "no", "and", "neutral", "and", "medium", "->", "neutral",
    "high", "and", "no", "and", "neutral", "and", "low", "->", "good"),
    nrow = 3, byrow = TRUE)

## Generate a fuzzy model with frbs.gen.
object <- frbs.gen(range.data, num.fvalinput, names.varinput,
                 num.fvaloutput, varout.mf, names.varoutput, rule,
                 varinp.mf, type.model, type.defuz, type.tnorm,
                 type.snorm, func.tsk = NULL, colnames.var, type.implication.func, name)

## Plot the membership function.
plotMF(object)

## Predicting using new data.
res <- predict(object, newdata)$predicted.val

#################################################
## IV. Specifying an FRBS model in the frbsPMML format.
## other examples can be seen in the frbsPMML function.
#################################################
## Input data
data(frbsData)
data.train <- frbsData$GasFurnance.dt[1 : 204, ]
data.fit <- data.train[, 1 : 2]
data.tst <- frbsData$GasFurnance.dt[205 : 292, 1 : 2]
real.val <- matrix(frbsData$GasFurnance.dt[205 : 292, 3], ncol = 1)
range.data<-matrix(c(-2.716, 2.834, 45.6, 60.5, 45.6, 60.5), nrow = 2)

## Set the method and its parameters
method.type <- "WM"
control <- list(num.labels = 3, type.mf = "GAUSSIAN", type.defuz = "WAM",
                type.tnorm = "MIN", type.snorm = "MAX",
                type.implication.func = "ZADEH", name="sim-0")

## Generate fuzzy model
object <- frbs.learn(data.train, range.data, method.type, control)

## 2. Constructing the frbsPMML format
frbsPMML(object)



