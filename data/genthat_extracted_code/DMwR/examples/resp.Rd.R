library(DMwR)


### Name: resp
### Title: Obtain the target variable values of a prediction problem
### Aliases: resp
### Keywords: models

### ** Examples

data(algae)
tgt <- resp(a1 ~ ., algae)
summary(tgt)
## Not run: 
##D hist(tgt,main='Alga a1')
## End(Not run)



