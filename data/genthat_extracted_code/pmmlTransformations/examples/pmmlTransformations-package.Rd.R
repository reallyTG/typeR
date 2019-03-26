library(pmmlTransformations)


### Name: pmmlTransformations-package
### Title: Data Transformations for PMML output
### Aliases: pmmlTransformations-package pmmlTransformations
### Keywords: pmml

### ** Examples

# Load the standard iris dataset, already available in the base R package
   data(iris)

# First create the wrapper object
   irisBox <- WrapData(iris)

# Perform a simple z-transformation on the first variable of the dataset: 
# Sepal.Length. By default, the name of the transformed variable is 
# "derived_Sepal.Length". The information of the transformation is added 
# back to the wrapped data object.
   irisBox <- ZScoreXform(irisBox,"1")

# Build a simple lm model 
   fit <- lm(Sepal.Width ~ derived_Sepal.Length + Petal.Length, 
            data=irisBox$data)

# One may now output the model in PMML format using the command below.
# The PMML file will now include the data transformations as well as 
# the model. 
   library(pmml)
   fit_pmml <- pmml(fit, transform=irisBox)



