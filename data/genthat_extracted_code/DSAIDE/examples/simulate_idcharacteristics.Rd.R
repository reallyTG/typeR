library(DSAIDE)


### Name: simulate_idcharacteristics
### Title: Simulation of an infectious disease transmission model with
###   multiple compartments
### Aliases: simulate_idcharacteristics

### ** Examples

# To run the simulation with default parameters just call the function:
result <- simulate_idcharacteristics()
# To choose parameter values other than the standard one, specify them like such:
result <- simulate_idcharacteristics(S0 = 2000, P0 = 10, tmax = 100, f = 0.1, d = 0.2)
# You should then use the simulation result returned from the function, like this:
plot(result$ts[,"Time"],result$ts[,"S"],xlab='Time',ylab='Number Susceptible',type='l')



