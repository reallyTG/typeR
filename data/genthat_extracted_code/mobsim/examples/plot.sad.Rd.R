library(mobsim)


### Name: plot.sad
### Title: Plot species abundance distributions
### Aliases: plot.sad

### ** Examples

abund1 <- sim_sad(s_pool = 100, n_sim = 10000, sad_type = "lnorm",
                  sad_coef = list("cv_abund" = 1))
plot(abund1, method = "octave")
plot(abund1, method = "rank")




