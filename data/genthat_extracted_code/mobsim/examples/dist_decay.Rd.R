library(mobsim)


### Name: dist_decay
### Title: Distance decay of similarity
### Aliases: dist_decay

### ** Examples

sim_com1 <- sim_thomas_community(100, 10000, sigma = 0.1, mother_points = 2)
dd1 <- dist_decay(sim_com1, prop_area = 0.005, n_samples = 20)
plot(dd1)




