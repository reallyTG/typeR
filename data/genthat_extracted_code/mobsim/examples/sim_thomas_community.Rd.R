library(mobsim)


### Name: sim_thomas_community
### Title: Simulate community with clumped spatial positions.
### Aliases: sim_thomas_community

### ** Examples

com1 <- sim_thomas_community(s_pool = 20, n_sim = 500, sad_type = "lnorm",
                             sad_coef = list("meanlog" = 2, "sdlog" = 1),
                             sigma = 0.01)
plot(com1)




