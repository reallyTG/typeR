library(frbs)


### Name: frbsPMML
### Title: The frbsPMML generator
### Aliases: frbsPMML

### ** Examples

## This example shows how to construct a frbsPMML file of the frbs model
## Even though we are using MAMDANI model, other models have the same way
##
## 1. Produce frbs model, for example: we perform Wang & Mendel's technique (WM)
## Input data
## Not run: 
##D data(frbsData)
##D data.train <- frbsData$GasFurnance.dt[1 : 204, ]
##D data.fit <- data.train[, 1 : 2]
##D data.tst <- frbsData$GasFurnance.dt[205 : 292, 1 : 2]
##D real.val <- matrix(frbsData$GasFurnance.dt[205 : 292, 3], ncol = 1)
##D range.data <- matrix(c(-2.716, 2.834, 45.6, 60.5, 45.6, 60.5), nrow = 2)
##D 
##D ## Set the method and its parameters
##D method.type <- "WM"
##D control <- list(num.labels = 3, type.mf = "GAUSSIAN", type.defuz = "WAM",
##D                 type.tnorm = "MIN", type.implication.func = "ZADEH",
##D                 name = "sim-0")
##D 
##D ## Generate fuzzy model
##D object <- frbs.learn(data.train, range.data, method.type, control)
##D 
##D ## 2. Write frbsPMML file
##D ## by calling frbsPMML(), the frbsPMML format will be displayed in R console
##D frbsPMML(object)
## End(Not run)



