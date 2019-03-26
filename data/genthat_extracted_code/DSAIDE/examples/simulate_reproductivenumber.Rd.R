library(DSAIDE)


### Name: simulate_reproductivenumber
### Title: Simulation of a compartmental infectious disease transmission
###   model to study the reproductive number
### Aliases: simulate_reproductivenumber

### ** Examples

  # To run the simulation with default parameters just call the function:
  result <- simulate_reproductivenumber()
  # To choose parameter values other than the standard one, specify them like such:
  result <- simulate_reproductivenumber(S0 = 2000, I0 = 10, tmax = 100, g = 0.5, n = 0.1)
  # You should then use the simulation result returned from the function, like this:
  plot(result$ts[ , "Time"],result$ts[ , "S"],xlab='Time',ylab='Number Susceptible',type='l')
  # We might also want to have infectiousness rate for hosts in the I compartment
  # of 0.4.
  result <- simulate_reproductivenumber(S0 = 2000, I0 = 10, tmax = 100, b = 0.4)
  plot(result$ts[,"Time"],result$ts[,"S"],xlab = "Time", ylab = "Number Susceptible",type="l")
  # We could also have infectiousness rate of 0.6 and recovery rate of 0.2.
  result <- simulate_reproductivenumber(S0 = 2000, I0 = 10, tmax = 100, b = 0.6, g = 0.2)
  plot(result$ts[,"Time"],result$ts[,"S"],xlab = "Time", ylab = "Number Susceptible",type="l")



