library(OpenMx)


### Name: omxLocateParameters
### Title: Get the location (model, matrix, row, column) and other info for
###   a parameter
### Aliases: omxLocateParameters

### ** Examples


A <- mxMatrix('Full', 2, 2, labels = c("A11", "A12", NA, "A11"), values= 1:4,
   free = TRUE, byrow = TRUE, name = 'A')

model <- mxModel(A, name = 'model')

# Request all free parameters in model
omxLocateParameters(model)

# Request free parameters "A11" and all NAs
omxLocateParameters(model, c("A11", NA))

# Works with submodel
B = mxMatrix(name = 'B', 'Full', 1, 2, labels = c("B11", "notme"),
  free = c(TRUE, FALSE), values= pi)
model <- mxModel(model, mxModel(B, name = 'subB'))

# nb: only returns free parameters ('notme' not shown)
omxLocateParameters(model)




