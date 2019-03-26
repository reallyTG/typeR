library(DSAIDE)


### Name: simulate_idcontrol
### Title: Simulation of a compartmental infectious disease transmission
###   model including different control mechanisms
### Aliases: simulate_idcontrol

### ** Examples

  # To run the simulation with default parameters just call the function:
  result <- simulate_idcontrol()
  # To choose parameter values other than the standard one, specify them like such:
  result <- simulate_idcontrol(S0 = 2000, I0 = 10, tmax = 100, f = 0.1, d = 0.2)
  # You should then use the simulation result returned from the function, like this:
  plot(result$ts[ , "Time"], result$ts[ , "S"],xlab='Time',ylab='Number Susceptible',type='l')
  # Consider also a case where recoverd persons become susceptible again at a 
  # rate of 1.5.
  result <- simulate_idcontrol(S0 = 2000, I0 = 10, tmax = 100, w = 1.5)
  plot(result$ts[,"Time"], result$ts[,"S"],xlab = "Time",ylab = "Number Susceptible",type="l")
  # Make death rate of natural hosts 0.5 and rate of pathogen decay 0.1.
  result <- simulate_idcontrol(S0 = 2000, I0 = 10, tmax = 100, nh = 0.5, c = 0.1)
  plot(result$ts[,"Time"], result$ts[,"S"],xlab = "Time",ylab = "Number Susceptible",type="l")



