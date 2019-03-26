library(saeSim)


### Name: sample_fraction
### Title: Sampling functions
### Aliases: sample_fraction sample_number sample_numbers
###   sample_cluster_number sample_cluster_fraction

### ** Examples

sim_base_lm() %>% sim_sample(sample_number(5))
sim_base_lm() %>% sim_sample(sample_fraction(0.5))
sim_base_lm() %>% sim_sample(sample_cluster_number(5, groupVars = "idD"))
sim_base_lm() %>% sim_sample(sample_cluster_fraction(0.5, groupVars = "idD"))



