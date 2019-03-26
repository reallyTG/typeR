library(rubias)


### Name: gprob_sim_ind
### Title: Simulate genotype log-likelihoods from a population by
###   individual
### Aliases: gprob_sim_ind
### Keywords: internal

### ** Examples

example(tcf2param_list)
sim_colls <- sample(ale_par_list$C, 1070, replace = TRUE)
ale_sim_gprobs_ind <- gprob_sim_ind(ale_par_list, sim_colls)



