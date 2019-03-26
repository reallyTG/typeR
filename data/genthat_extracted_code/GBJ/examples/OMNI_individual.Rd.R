library(GBJ)


### Name: OMNI_individual
### Title: omni_individual.R
### Aliases: OMNI_individual

### ** Examples

factor_matrix <- matrix(data=rbinom(n=1000, size=2, prob=0.3), ncol=5)
Y <- rnorm(n=200)
null_mod <- glm(Y ~ 1)
OMNI_individual(null_model=null_mod, factor_matrix=factor_matrix,
link_function='linear', num_boots=5)



