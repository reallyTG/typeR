library(birdring)


### Name: overlap
### Title: Overlap between the prior and posterior distribution
### Aliases: overlap
### Keywords: Bayesian data analysis distributions

### ** Examples

prior <- rbeta(2000, 1,1)
posterior <- rbeta(2000, 14, 35)
overlap(posterior, prior)



