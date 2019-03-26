library(RelValAnalysis)


### Name: RelativeEntropy
### Title: Relative Entropy
### Aliases: RelativeEntropy

### ** Examples

p <- c(0.3, 0.3, 0.4)
q <- c(0.5, 0.3, 0.2)

RelativeEntropy(p, q)
RelativeEntropy(q, p)  # relative entropy is not symmetric



