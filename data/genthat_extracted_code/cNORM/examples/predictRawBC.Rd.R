library(cNORM)


### Name: predictRawBC
### Title: Calculate the raw score for a given percentile based on the
###   parametric box cox distribution
### Aliases: predictRawBC

### ** Examples

## Not run: 
##D # model sample data set
##D model <- bestModel(prepareData())
##D 
##D # fitting scores of regression model box cox power function at specific age and retrieving
##D # the parameters for the box cox power function
##D bcParameters <- boxcox(model, 3)
##D 
##D # define percentile and according t value
##D percentile <- .4
##D tValue <- qnorm(percentile)*10 + 50
##D 
##D # predict raw value based on the regression model and via box cox
##D predictRawBC(bcParameters, percentile)
##D predictRaw(tValue, 3, model$coefficients)
## End(Not run)



