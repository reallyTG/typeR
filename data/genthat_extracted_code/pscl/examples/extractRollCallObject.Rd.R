library(pscl)


### Name: extractRollCallObject
### Title: return the roll call object used in fitting an ideal model
### Aliases: extractRollCallObject
### Keywords: models

### ** Examples

data(s109)
f = system.file("extdata","id1.rda",package="pscl")
load(f)
tmp <- extractRollCallObject(id1)
summary(tmp)
v <- convertCodes(tmp)         ## roll call matrix per se  



