library(pegas)


### Name: theta.k
### Title: Population Parameter THETA using Expected Number of Alleles
### Aliases: theta.k
### Keywords: manip univar

### ** Examples

data(jaguar)
## compute frequencies:
S <- summary(jaguar)
## compute THETA for all loci:
sapply(S, function(x) theta.k(x$allele))



