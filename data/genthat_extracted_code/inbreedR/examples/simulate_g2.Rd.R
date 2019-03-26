library(inbreedR)


### Name: simulate_g2
### Title: Simulate g2
### Aliases: simulate_g2

### ** Examples

data(mouse_msats)
genotypes <- convert_raw(mouse_msats)
sim_g2 <- simulate_g2(n_ind = 10, H_nonInb = 0.5, meanF = 0.2, varF = 0.03,
                      subsets = c(4,6,8,10), reps = 100, 
                      type = "msats")
plot(sim_g2)



