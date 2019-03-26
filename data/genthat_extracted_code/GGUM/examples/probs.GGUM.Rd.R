library(GGUM)


### Name: probs.GGUM
### Title: Compute model probabilities for the GGUM
### Aliases: probs.GGUM

### ** Examples

C <- c(3, 3, 3, 5, 5)
gen <- GenData.GGUM(10, 5, C, seed = 456)
gen.alpha <- gen$alpha.gen
gen.delta <- gen$delta.gen
gen.taus  <- gen$taus.gen
gen.theta <- gen$theta.gen
 
# Compute model probabilities for the parameters above:
Ps <- probs.GGUM(gen.alpha, gen.delta, gen.taus, gen.theta, C)
Ps
# In particular, the sum of the probabilities across all response options 
# (i.e., the third dimension) should be 1 for all (person, item) combinations:
apply(Ps, 1:2, sum)



