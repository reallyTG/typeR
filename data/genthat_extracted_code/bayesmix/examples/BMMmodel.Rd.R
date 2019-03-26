library(bayesmix)


### Name: BMMmodel
### Title: Creates bugs model.
### Aliases: BMMmodel print.JAGSmodel
### Keywords: utilities

### ** Examples

data("fish", package = "bayesmix")
model <- BMMmodel(fish, k = 4, priors = list(kind = "independence",
                  parameter = "priorsFish", hierarchical = "tau"),
                  initialValues = list(S0 = 2))
model



