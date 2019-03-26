library(LEGIT)


### Name: genetic_var_select
### Title: Parallel genetic algorithm variable selection (for IMLEGIT)
### Aliases: genetic_var_select

### ** Examples

## Not run: 
##D ## Example
##D train = example_3way_3latent(250, 2, seed=777)
##D # Genetic algorithm based on BIC
##D # Normally you should use a lot more than 2 populations with 10 generations
##D ga = genetic_var_select(train$data, latent_var=train$latent_var,
##D formula=y ~ E*G*Z, search_criterion="AIC", parallel_iter=2, maxgen = 10)
## End(Not run)



