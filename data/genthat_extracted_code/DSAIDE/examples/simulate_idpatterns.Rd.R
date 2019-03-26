library(DSAIDE)


### Name: simulate_idpatterns
### Title: Simulation of a compartmental infectious disease transmission
###   model including seasonality
### Aliases: simulate_idpatterns

### ** Examples

  # To run the simulation with default parameters just call the function:
  result <- simulate_idpatterns()
  # To choose parameter values other than the standard one, specify them like such:
  result <- simulate_idpatterns(S0 = 2000, P0 = 10, tmax = 100, f = 0.1, d = 0.2, s = 0.1)
  # You should then use the simulation result returned from the function, like this:
  plot(result$ts[ , "Time"],result$ts[ , "S"],xlab='Time',ylab='Number Susceptible',type='l')



