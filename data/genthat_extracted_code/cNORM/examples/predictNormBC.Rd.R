library(cNORM)


### Name: predictNormBC
### Title: Calculate the norm value for a given raw value based on the
###   parametric box cox distribution
### Aliases: predictNormBC

### ** Examples

# model sample data set
model <- bestModel(prepareData())

# fitting scores of regression model box cox power function at specific age and retrieving
# the parameters for the box cox power function
bcParameters <- boxcox(model, 3)

# predict norm value for raw value 15 at age 3 based on the regression model and via box cox
predictNormBC(bcParameters, 15, scale="T")
predictNorm(15, 3, model, minNorm=25, maxNorm=75)



