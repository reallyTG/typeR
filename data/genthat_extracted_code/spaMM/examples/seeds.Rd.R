library(spaMM)


### Name: seeds
### Title: Seed germination data
### Aliases: seeds
### Keywords: datasets

### ** Examples

data("seeds") 
## An extended quasi-likelihood (EQL) fit as considered by Lee and Nelder (1996):
HLfit(cbind(r,n-r)~seed*extract+(1|plate),family=binomial(),
  rand.family=Beta(),
  HLmethod="HL(0,0)",
  data=seeds)



