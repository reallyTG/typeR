library(mobsim)


### Name: sample_quadrats
### Title: Plot-based samples from a spatially-explicit census
### Aliases: sample_quadrats

### ** Examples

library(vegan)
sim_com1 <- sim_poisson_community(100, 10000)
comm_mat1 <- sample_quadrats(sim_com1, n_quadrats = 100,
quadrat_area = 0.002, method = "grid")
specnumber(comm_mat1$spec_dat)
diversity(comm_mat1$spec_dat, index = "shannon")





