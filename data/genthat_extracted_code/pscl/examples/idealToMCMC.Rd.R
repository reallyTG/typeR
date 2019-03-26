library(pscl)


### Name: idealToMCMC
### Title: convert an object of class ideal to a coda MCMC object
### Aliases: idealToMCMC
### Keywords: classes

### ** Examples

data(s109)
f = system.file("extdata",package="pscl","id1.rda")
load(f)
id1coda <- idealToMCMC(id1)
summary(id1coda)  



