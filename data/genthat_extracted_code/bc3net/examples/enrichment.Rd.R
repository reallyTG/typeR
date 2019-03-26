library(bc3net)


### Name: enrichment
### Title: Function that performs a functional enrichment analysis based on
###   a one-sided Fisher's exact teset (hypergeometric test).
### Aliases: enrichment

### ** Examples


# In the following candidate genes are defined from a
# giant connected component of an example igraph network 
# where we use the remaining genes of a given network 
# as a reference list.

data(exanet)
data(exgensets)

candidate=V(getgcc(exanet))$name
reference=V(exanet)$name

# hypergeometric test is performed for 
# each defined set of genes in the 
# list object exgensets
tab.hypg=enrichment(candidate, reference, exgensets, verbose=TRUE) 




