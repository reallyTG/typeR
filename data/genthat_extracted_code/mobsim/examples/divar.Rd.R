library(mobsim)


### Name: divar
### Title: Diversity-area relationships
### Aliases: divar

### ** Examples

sim1 <- sim_thomas_community(100, 1000)
divar1 <- divar(sim1, prop_area = seq(0.01, 1.0, length = 20))
plot(divar1)




