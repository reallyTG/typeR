library(rubias)


### Name: gprob_sim_gc
### Title: Simulate genotype log-likelihoods from a population by gene copy
### Aliases: gprob_sim_gc
### Keywords: internal

### ** Examples

example(tcf2param_list)
sim_colls <- sample(ale_par_list$C, 1070, replace = TRUE)
ale_sim_gprobs_gc <- gprob_sim_gc(ale_par_list, sim_colls)



