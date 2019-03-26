library(mobsim)


### Name: sim_poisson_community
### Title: Simulate community with random spatial positions.
### Aliases: sim_poisson_community

### ** Examples

com1 <- sim_poisson_community(s_pool = 20, n_sim = 500, sad_type = "lnorm",
sad_coef = list("meanlog" = 2, "sdlog" = 1))
plot(com1)




