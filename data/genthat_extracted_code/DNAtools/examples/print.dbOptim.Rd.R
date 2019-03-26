library(DNAtools)


### Name: print.dbOptim
### Title: Prints the results from optim.relatedness()
### Aliases: print.dbOptim

### ** Examples

  ## Not run: 
##D   ## Simulate some allele frequencies:
##D   freqs <-  replicate(10, { g = rgamma(n=10,scale=4,shape=3); g/sum(g)},
##D               simplify=FALSE)
##D   ## Load the sample database:
##D   data(dbExample)
##D   obs <- dbCompare(dbExample,trace=FALSE)$m
##D   C3 <- optim.relatedness(obs,theta0=0.0,theta1=0.03,probs=freqs,
##D           objFunction="C3",max.bisect=30,trace=TRUE)
##D   print(C3)
##D   
## End(Not run)



