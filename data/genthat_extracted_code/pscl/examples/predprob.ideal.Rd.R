library(pscl)


### Name: predprob.ideal
### Title: predicted probabilities from fitting ideal to rollcall data
### Aliases: predprob.ideal
### Keywords: methods models

### ** Examples

f <- system.file("extdata","id1.rda",package="pscl")
load(f)
phat <- predprob(id1)
dim(phat)



