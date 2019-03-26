library(radiant.model)


### Name: sim_cor
### Title: Simulate correlated normally distributed data
### Aliases: sim_cor

### ** Examples

sim <- sim_cor(100, .74, c(0, 10), c(1, 5), exact = TRUE)
cor(sim)
sim_summary(sim)




