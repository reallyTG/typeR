library(raptr)


### Name: plot
### Title: Plot object
### Aliases: plot plot,RapSolved,numeric-method
###   plot,RapSolved,missing-method plot,RapSolved,RapSolved-method

### ** Examples

# load example data set with solutions
data(sim_rs)

# plot selection frequencies
plot(sim_rs)

# plot best solution
plot(sim_rs, 0)

# plot second solution
plot(sim_rs, 2)

# plot different between best and second solutions
plot(sim_rs, sim_rs, 0 ,2)



