library(gdata)


### Name: elem
### Title: Display Information about Elements in a Given Object
### Aliases: elem
### Keywords: attribute classes list print utilities

### ** Examples

## Not run: 
##D data(infert)
##D elem(infert)
##D model <- glm(case~spontaneous+induced, family=binomial, data=infert)
##D elem(model, dim=TRUE)
##D elem(model$family)
## End(Not run)



