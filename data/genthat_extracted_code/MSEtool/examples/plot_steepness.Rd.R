library(MSEtool)


### Name: plot_steepness
### Title: Plots probability distribution function of stock-recruit
###   steepness
### Aliases: plot_steepness

### ** Examples

mu <- DLMtool::Simulation_1@steep
stddev <- DLMtool::Simulation_1@steep * DLMtool::Simulation_1@CV_steep
plot_steepness(mu, stddev)



