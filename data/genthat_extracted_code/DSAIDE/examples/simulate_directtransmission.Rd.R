library(DSAIDE)


### Name: simulate_directtransmission
### Title: Simulation of a compartmental infectious disease transmission
###   model illustrating different types of direct transmission
### Aliases: simulate_directtransmission

### ** Examples

  # To run the simulation with default parameters just call this function:
  result <- simulate_directtransmission()
  # To choose parameter values other than the standard one, specify them like such:
  result <- simulate_directtransmission(S0 = 100, tmax = 100, A=10)
  # You should then use the simulation result returned from the function, like this:
  plot(result$ts[,"Time"],result$ts[,"S"],xlab='Time',ylab='Number Susceptible',type='l')



