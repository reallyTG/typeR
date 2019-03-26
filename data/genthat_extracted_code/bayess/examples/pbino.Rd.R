library(bayess)


### Name: pbino
### Title: Posterior expectation for the binomial capture-recapture model
### Aliases: pbino
### Keywords: capture-recapture models binomial probability posterior
###   expectation

### ** Examples

data(eurodip)
year81=eurodip[,1]
nplus=sum(year81>0)
sum((1:400)*pbino(nplus))



