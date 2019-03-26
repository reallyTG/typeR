library(rubias)


### Name: gprob_sim_gc_missing
### Title: Simulate genotypes by gene copy, with missing data from chosen
###   individuals
### Aliases: gprob_sim_gc_missing
### Keywords: internal

### ** Examples


# If one wanted to simulate the missing data patterns
# of a troublesome mixture dataset, one would run tcf2param_list,
# selecting samp_type = "mixture", then draw sim_miss from
# the mixture individual genotype list

# make a fake mixture data set to demonstrate...
drawn <- mixture_draw(alewife, rhos = c(1/3, 1/3, 1/3),N = 100)
ref <- drawn$reference
mix <- drawn$mix

# then run it...
params <- tcf2param_list(rbind(ref,mix), 17, samp_type = "mixture")
sim_colls <- sample(params$C, 1070, replace = TRUE)
sim_miss <- sample(length(params$coll), 1070, replace = TRUE)
ale_sim_gprobs_miss <- gprob_sim_gc_missing(params, sim_colls, sim_miss)



