library(triversity)


### Name: get_conditional_diversity_from_transition
### Title: Compute the conditional diversity of a transition matrix.
### Aliases: get_conditional_diversity_from_transition

### ** Examples

transition <- matrix (c (1/3, 1/3, 1/3, 0.9, 0.1, 0), nrow=2, ncol=3, byrow=TRUE)
get_conditional_diversity_from_transition (transition, order=c(0,Inf), measure='entropy')
get_conditional_diversity_from_transition (transition, distribution=c(0.75,0.25))




