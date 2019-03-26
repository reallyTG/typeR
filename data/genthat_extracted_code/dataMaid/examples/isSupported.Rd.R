library(dataMaid)


### Name: isSupported
### Title: Check if a variable has a class supported by dataMaid
### Aliases: isSupported

### ** Examples

integerVar <- 1:10 #supported
rawVar <- as.raw(1:10) #not supported

isSupported(integerVar)
isSupported(rawVar)




