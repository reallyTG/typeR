library(secr)


### Name: model.average
### Title: Averaging of SECR Models Using Akaike's Information Criterion
### Aliases: model.average collate
### Keywords: models

### ** Examples

## Compare two models fitted previously
## secrdemo.0 is a null model
## secrdemo.b has a learned trap response

model.average(secrdemo.0, secrdemo.b)
model.average(secrdemo.0, secrdemo.b, betanames = c("D","g0","sigma"))

## In this case we find the difference was actually trivial...
## (subscripting of output is equivalent to setting fields = 1)

collate (secrdemo.0, secrdemo.b, perm = c(4,2,3,1))[,,1,]




