library(OpenMx)


### Name: omxSetParameters
### Title: Assign Model Parameters
### Aliases: omxSetParameters

### ** Examples


A <- mxMatrix('Full', 3, 3, labels = c('a','b', NA), free = TRUE, name = 'A')
model <- mxModel(model="testModel", A, name = 'model')

# set value of cells labelled "a" and "b" to 1 and 2 respectively
model <- omxSetParameters(model, c('a', 'b'), values = c(1, 2))

# set label of cell labelled "a" to "b" and vice versa
model <- omxSetParameters(model, c('a', 'b'), newlabels = c('b', 'a'))

# set label of cells labelled "a" to "b"
model <- omxSetParameters(model, c('a'), newlabels = 'b')

# ensure initial values are the same for each instance of a labeled parameter
model <- omxAssignFirstParameters(model)



