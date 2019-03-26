library(inbreedR)


### Name: simulate_r2_hf
### Title: Calculates the expected squared correlation between
###   heteorzygosity and inbreeding for simulated marker sets
### Aliases: simulate_r2_hf

### ** Examples

data(mouse_msats)
genotypes <- convert_raw(mouse_msats)
sim_r2 <- simulate_r2_hf(n_ind = 10, H_nonInb = 0.5, meanF = 0.2, varF = 0.03,
                      subsets = c(4,6,8,10), reps = 100, 
                      type = "msats")
plot(sim_r2)



