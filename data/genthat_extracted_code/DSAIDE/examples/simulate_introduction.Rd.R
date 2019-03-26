library(DSAIDE)


### Name: simulate_introduction
### Title: Simulation of a basic SIR model illustrating a single infectious
###   disease outbreak
### Aliases: simulate_introduction

### ** Examples

# To run the simulation with default parameters just call the function:
result <- simulate_introduction()
# To choose parameter values other than the standard one, specify them like such:
result <- simulate_introduction(S0 = 2000, I0 = 10, tmax = 100, g = 1, b = 1/100)
# You should then use the simulation result returned from the function, e.g. like this:
plot(result$ts[ , "Time"], result$ts[ , "S"],xlab='Time',ylab='Number Susceptible',type='l')
# Suppose we want to model the average duration of the infectious period as 4 days;
# the inverse of this is 0.25, which is the rate at which the person leaves
# the infectious stage.
result <- simulate_introduction(S0 = 2000, I0 = 10, tmax = 100, g = 0.25)
plot(result$ts[,"Time"],result$ts[,"S"], xlab = "Time", ylab = "Number Susceptible",type="l")
# We could also set the rate of infectiousness very low.
result <- simulate_introduction(S0 = 2000, I0 = 10, tmax = 100, b = 0.0001)
plot(result$ts[,"Time"],result$ts[,"S"], xlab = "Time", ylab = "Number Susceptible",type="l")



