library(mobsim)


### Name: plot.spec_sample_curve
### Title: Plot species sampling curves
### Aliases: plot.spec_sample_curve

### ** Examples

sim_com1 <- sim_thomas_community(s_pool = 100, n_sim = 1000)
sac1 <- spec_sample_curve(sim_com1, method = c("rare","acc"))
plot(sac1)




