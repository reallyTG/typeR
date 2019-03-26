library(RSurvey)


### Name: EvalFunction
### Title: Parse and Evaluate an RSurvey Expression
### Aliases: EvalFunction
### Keywords: utilities

### ** Examples

d <- list(x = 1:10, y = 10:1)
Data("data.raw", d)
cols <- list()
cols[[1]] <- list(id = "X", index = 1, fun = "\"X\"")
cols[[2]] <- list(id = "Y", index = 2, fun = "\"Y\"")
EvalFunction("\"Y\"", cols)
EvalFunction("\"X\" + \"Y\"", cols)
EvalFunction("rnorm(12)", cols)




