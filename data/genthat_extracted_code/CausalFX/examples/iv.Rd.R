library(CausalFX)


### Name: iv
### Title: Bayesian Analysis of Binary Instrumental Variables
### Aliases: iv

### ** Examples

## Generate synthetic problems until a (conditional) instrumental variable can be found

while (TRUE) {
  problem <- simulateWitnessModel(p = 4, q = 4, par_max = 3, M = 1000)
  s <- covsearch(problem, pop_solve = TRUE)
  if (length(s$witness) > 0) {
    w <- s$witness[1]
    Z <- s$Z[[1]]
    break
  }
}

## Calculate true effect for evaluation purposes
sol_pop <- covsearch(problem, pop_solve = TRUE)
effect_pop <- synthetizeCausalEffect(problem)
cat(sprintf("ACE (true) = %1.2f\n", effect_pop$effect_real))

## Binary IV bounds
sol_iv <- iv(problem, w, Z, prior_table = 10, M = 1000)
summary(sol_iv)



