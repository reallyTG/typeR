library(pegas)


### Name: theta.h
### Title: Population Parameter THETA using Homozygosity
### Aliases: theta.h
### Keywords: manip univar

### ** Examples

data(jaguar)
## compute frequencies:
S <- summary(jaguar)
## compute THETA for all loci:
sapply(S, function(x) theta.h(x$allele))



