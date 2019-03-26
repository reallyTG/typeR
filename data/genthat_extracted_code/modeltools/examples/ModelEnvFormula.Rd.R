library(modeltools)


### Name: ModelEnvFormula
### Title: Generate a model environment from a classical formula based
###   interface.
### Aliases: ModelEnvFormula
### Keywords: misc

### ** Examples


### the `usual' interface
data(iris)
mf <- ModelEnvFormula(Species ~ ., data = iris)
mf

### extract data from the ModelEnv object
summary(mf@get("response"))
summary(mf@get("input"))
dim(mf@get("designMatrix"))

### contrasts
mf <- ModelEnvFormula(Petal.Width ~ Species, data = iris, 
                      contrasts.arg = list(Species = contr.treatment))
attr(mf@get("designMatrix"), "contrasts")
mf <- ModelEnvFormula(Petal.Width ~ Species, data = iris, 
                      contrasts.arg = list(Species = contr.sum))
attr(mf@get("designMatrix"), "contrasts")

### additional formulae
mf <- ModelEnvFormula(Petal.Width ~ Species, data = iris, 
                      other = list(pl = ~ Petal.Length))
ls(mf@env)
identical(mf@get("pl")[[1]], iris[["Petal.Length"]])




