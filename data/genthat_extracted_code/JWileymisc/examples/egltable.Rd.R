library(JWileymisc)


### Name: egltable
### Title: Function makes nice tables
### Aliases: egltable
### Keywords: utils

### ** Examples

egltable(iris)
egltable(colnames(iris)[1:4], "Species", iris)
egltable(iris, parametric = FALSE)
egltable(colnames(iris)[1:4], "Species", iris,
  parametric = FALSE)
egltable(colnames(iris)[1:4], "Species", iris,
  parametric = c(TRUE, TRUE, FALSE, FALSE))
egltable(colnames(iris)[1:4], "Species", iris,
  parametric = c(TRUE, TRUE, FALSE, FALSE), simChisq=TRUE)

diris <- as.data.table(iris)
egltable("Sepal.Length", g = "Species", data = diris)



