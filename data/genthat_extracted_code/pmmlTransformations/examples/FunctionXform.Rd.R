library(pmmlTransformations)


### Name: FunctionXform
### Title: Add a function transformation to a WrapData object.
### Aliases: FunctionXform

### ** Examples

# Load the standard iris dataset
data(iris)

# Wrap the data
irisBox <- WrapData(iris)

# Perform a transform on the Sepal.Length field: 
# the value is squared and then divided by 100
irisBox <- FunctionXform(irisBox,origFieldName="Sepal.Length",
                         newFieldName="Sepal.Length.Transformed",
                         formulaText="(Sepal.Length^2)/100")

# Combine two fields to create another new feature:                      
irisBox <- FunctionXform(irisBox,
                         origFieldName="Sepal.Width, Petal.Width",
                         newFieldName="Width.Sum",
                         formulaText="Sepal.Width + Sepal.Length")
                         
# Create linear model using the derived features
fit <- lm(Petal.Length ~ 
         Sepal.Length.Transformed + Width.Sum, data=irisBox$data)

# Create pmml from the fit
library(pmml)
fit_pmml <- pmml(fit, transform=irisBox)



