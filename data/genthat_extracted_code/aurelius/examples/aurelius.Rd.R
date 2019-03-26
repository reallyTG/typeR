library(aurelius)


### Name: aurelius
### Title: 'aurelius' package
### Aliases: aurelius aurelius-package

### ** Examples

## Not run: 
##D library("aurelius")
##D 
##D # build a model
##D lm_model <- lm(mpg ~ hp, data = mtcars)
##D   
##D # convert the lm object to a list of lists PFA representation
##D lm_model_as_pfa <- pfa(lm_model)
##D   
##D # save as plain-text JSON
##D write_pfa(lm_model_as_pfa, file = "my-model.pfa")
##D 
##D # read the model back in
##D read_pfa(file("my-model.pfa"))
## End(Not run)



