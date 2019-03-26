library(pmml)


### Name: pmml
### Title: Generate PMML for R objects
### Aliases: pmml

### ** Examples


# Build a simple lm model
iris.lm <- lm(Sepal.Length ~ ., data=iris)

# Convert to pmml
pmml(iris.lm)

# Create a pmmlTransformations object
library(pmmlTransformations)
xo <- WrapData(iris)

# Transform the 'Sepal.Length' variable
xo <- MinMaxXform(xo,xformInfo="column1->d_sl")

# Output the tranformation in PMML format
pmml(NULL, transforms=xo)




