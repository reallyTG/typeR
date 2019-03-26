library(HIest)


### Name: HIC
### Title: Closed form maximum-likelihood estimates of ancestry and
###   heterozygosity for diagnostic markers
### Aliases: HIC
### Keywords: ~kwd1 ~kwd2

### ** Examples

## A random set of allele counts for 10 loci and 10 individuals
G <- matrix(rbinom(100,2,.5),nrow=10)
HIC(G)




