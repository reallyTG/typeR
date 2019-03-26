library(cNORM)


### Name: boxcox
### Title: Generate box cox power function for regression model at specific
###   age
### Aliases: boxcox

### ** Examples

# model sample data set
model <- bestModel(prepareData())

# fitting scores of regression model box cox power function at specific age and retrieving
# the parameters for the box cox power function
bcParameters <- boxcox(model, 3)



