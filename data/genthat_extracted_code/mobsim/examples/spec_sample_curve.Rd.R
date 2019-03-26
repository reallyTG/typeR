library(mobsim)


### Name: spec_sample_curve
### Title: Non-spatial and spatially-explicit species sampling curves
### Aliases: spec_sample_curve

### ** Examples

sim_com1 <- sim_thomas_community(s_pool = 100, n_sim = 1000)
sac1 <- spec_sample_curve(sim_com1, method = c("rare","acc"))

head(sac1)
plot(sac1)




