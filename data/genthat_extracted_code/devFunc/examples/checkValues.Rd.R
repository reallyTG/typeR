library(devFunc)


### Name: checkValues
### Title: Checking if the value of vectors (of length 1) is authorized.
### Aliases: checkValues

### ** Examples

lossType <- 'absolute'
checkValues(list(lossType), list(c('absolute', 'quadratic')))
## No test: 
checkValues(list(lossType), list(c('absolute', 'quadratic'), c('test', 'test2')))
## End(No test)

#The next error message is weird, since it does not return the real name of the listObject
#that found to be wrong.
lossType <- 'absolute55'
listObjects <- list(lossType)
listValues <- list(c('absolute', 'quadratic'))
## No test: 
checkValues(listObjects, listValues)

#Now it is ok...
checkValues(list(lossType), list(c('absolute', 'quadratic')))
## End(No test)



