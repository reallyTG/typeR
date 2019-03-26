library(intubate)


### Name: modeltools
### Title: Interfaces for modeltools package for data science pipelines.
### Aliases: ntbt_ModelEnvFormula ntbt_ParseFormula
### Keywords: intubate magrittr modeltools ModelEnvFormula ParseFormula

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(modeltools)
##D 
##D data("iris")
##D 
##D ## Original function to interface
##D ModelEnvFormula(Species + Petal.Width ~ . -1, data = iris,
##D                 subset = sample(1:150, 10))
##D ParseFormula(Species + Petal.Width ~ . -1, data = iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ModelEnvFormula(iris, Species + Petal.Width ~ . -1, subset = sample(1:150, 10))
##D ntbt_ParseFormula(iris, Species + Petal.Width ~ . -1)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_ModelEnvFormula(Species + Petal.Width ~ . -1, subset = sample(1:150, 10))
##D 
##D iris %>%
##D   ntbt_ParseFormula(Species + Petal.Width ~ . -1)
## End(Not run)



