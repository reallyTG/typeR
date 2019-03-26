library(MADPop)


### Name: UM.suff
### Title: Sufficient statistics for the Unconstrained-Multinomial model
### Aliases: UM.suff

### ** Examples

# sufficient statistics in 3 lakes

X <- fish215[fish215$Lake %in% c("Hogan", "Manitou", "Simcoe"),]
suff <- UM.suff(X)

suff$A # allele names
suff$G # unique genotypes
suff$tab # contingency table



