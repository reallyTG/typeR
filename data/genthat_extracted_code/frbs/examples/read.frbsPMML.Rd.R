library(frbs)


### Name: read.frbsPMML
### Title: The frbsPMML reader
### Aliases: read.frbsPMML

### ** Examples

## This example shows how to construct and read frbsPMML file of frbs model
## Even though we are using MAMDANI model, other models have the same way
##
## 1. Produce frbs model, for example: we perform Wang & Mendel's technique (WM)
##
## Input data
data(frbsData)
data.train <- frbsData$GasFurnance.dt[1 : 204, ]
data.fit <- data.train[, 1 : 2]
data.tst <- frbsData$GasFurnance.dt[205 : 292, 1 : 2]
real.val <- matrix(frbsData$GasFurnance.dt[205 : 292, 3], ncol = 1)
range.data<-matrix(c(-2.716, 2.834, 45.6, 60.5, 45.6, 60.5), nrow = 2)

## Set the method and its parameters
method.type <- "WM"
control <- list(num.labels = 15, type.mf = "GAUSSIAN", type.defuz = "WAM",
                type.tnorm = "MIN", type.implication.func = "ZADEH",
                name="sim-0")

## Generate fuzzy model
## Not run: object <- frbs.learn(data.train, range.data, method.type, control)

## 2. Write frbsPMML file
## In this step, we provide two ways as follows.
## a. by calling frbsPMML() function directly.
## b. by calling write.frbsPMML() function.

## 2a. by calling frbsPMML(), the format will be displayed in R console
## Not run: frbsPMML(object)

## 2b. by calling write.frbsPMML(), the result will be saved as a file
##     in the working directory.
## Not run: write.frbsPMML(object, file = "MAMDANI.GasFur")

## 3. Read frbsPMML file
## Not run: object <- read.frbsPMML("MAMDANI.GasFur.frbsPMML")

## 4. Perform predicting step
## Not run: res.test <- predict(object, data.tst)



