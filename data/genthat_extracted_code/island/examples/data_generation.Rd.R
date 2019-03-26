library(island)


### Name: data_generation
### Title: Data simulation of colonization-extinction dynamics
### Aliases: data_generation PA_simulation

### ** Examples

data_generation(as.data.frame(rep(0, 100)), 1,
matrix(c(0.5, 0.5), ncol = 2), 5, 25)
data_generation(alonso15[[1]], 3, matrix(c(0.5, 0.5), ncol = 2), 5, 25)
PA_simulation(as.data.frame(c(rep(0, 163), rep(1, 57))), 1, c(0.13, 0.19),
20)




