library(Dowd)


### Name: PCAES
### Title: Estimates ES by principal components analysis
### Aliases: PCAES

### ** Examples

# Computes PCA ES
   Ra <- matrix(rnorm(4*6),4,6)
   position.data <- rnorm(6)
   PCAES(Ra, position.data, 2, .95)



