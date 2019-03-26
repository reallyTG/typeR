library(DSAIDE)


### Name: simulate_environmentaltransmission
### Title: Simulation of a compartmental infectious disease transmission
###   model illustrating environmental transmission
### Aliases: simulate_environmentaltransmission

### ** Examples

  # To run the simulation with default parameters just call the function:
  result <- simulate_environmentaltransmission()
  # To choose parameter values other than the standard one, specify them like such:
  result <- simulate_environmentaltransmission(S0 = 100, E0 = 1e5, tmax = 100)
  # You should then use the simulation result returned from the function, like this:
  plot(result$ts[,"Time"],result$ts[ , "S"],xlab='Time',ylab='Number Susceptible',type='l')
  # Consider also a case in which we set the birth rate of hosts at 0.2, and
  # the rate at which infected hosts recover or die at 0.8.
  result <- simulate_environmentaltransmission(S0 = 1000, E0 = 1e5, m = 0.2, g = 0.8)
  plot(result$ts[,"Time"],result$ts[,"S"], xlab="Time", ylab = "Number Susceptible",type="l")
  # Additionally, consider a case in which we assume that no new hosts are born.
  result <- simulate_environmentaltransmission(S0 = 1000, E0 = 1e5, m = 0)
  plot(result$ts[,"Time"], result$ts[,"S"], xlab = "Time", ylab = "Number Susceptible")



