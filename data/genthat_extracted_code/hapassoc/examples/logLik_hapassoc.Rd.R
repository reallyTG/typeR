library(hapassoc)


### Name: logLik.hapassoc
### Title: Return log-likelihood
### Aliases: logLik.hapassoc
### Keywords: methods

### ** Examples

data(hypoDatGeno)
example2.pre.hapassoc<-pre.hapassoc(hypoDatGeno, numSNPs=3, allelic=FALSE)
example.regr <- hapassoc(affected ~ attr + hAAA+ hACA + hACC + hCAA + 
pooled, example2.pre.hapassoc, family=binomial())
logLik(example.regr)

# Returns:
# Log Lik: -322.1558 (df=14)



