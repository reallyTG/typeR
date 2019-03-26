## ---- message = FALSE, warnings = FALSE----------------------------------
library(preproviz)
result <- preproviz(iris)

## ----fig.width=8, fig.height=8, message = FALSE, warnings = FALSE--------
plotDENSITY(result)
plotHEATMAP(result)

## ---- message = FALSE, warnings = FALSE----------------------------------
iris2 <- iris
iris2[sample(1:150,30), 1] <- NA # adding missing values
iris2[sample(1:150,30), 5] <- levels(iris2$Species)[2] # adding inconsistency 

## ----fig.width=8, fig.height=8, message = FALSE, warnings = FALSE--------
result <- preproviz(list(iris, iris2))

## ----fig.width=8, fig.height=8, message = FALSE, warnings = FALSE--------
plotVARCLUST(result)

## ----fig.width=8, fig.height=8, message = FALSE, warnings = FALSE--------
plotCMDS(result)

## ---- message = FALSE, warnings = FALSE, eval=FALSE----------------------
#  customparameters <- initializeparameterclassobject(list("LOFScore", "ScatterCounter"))
#  setup1 <- initializesetupclassobject("setup1", customparameters, initializedataobject(iris))
#  setup2 <- initializesetupclassobject("setup2", customparameters, initializedataobject(otherdataframehere))
#  control <- initializecontrolclassobject(list("setup1", "setup2"))
#  result <- preproviz(control)

## ---- message = FALSE, warnings = FALSE, eval=FALSE----------------------
#  constructfeature("MissingValueShare", "apply(data, 1, function(x) sum(is.na(x))/ncol(data))", impute=TRUE)

