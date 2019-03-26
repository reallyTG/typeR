library(mobsim)


### Name: community_to_sad
### Title: Get species abundance distribution from community object
### Aliases: community_to_sad

### ** Examples

sim1 <- sim_poisson_community(s_pool = 200, n_sim = 20000, sad_type = "lnorm",
                              sad_coef = list("cv_abund" = 2))
sad1 <- community_to_sad(sim1)
plot(sad1, method = "rank")
plot(sad1, method = "octave")




