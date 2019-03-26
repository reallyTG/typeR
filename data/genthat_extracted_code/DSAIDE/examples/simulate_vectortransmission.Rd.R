library(DSAIDE)


### Name: simulate_vectortransmission
### Title: Simulation of a compartmental infectious disease transmission
###   model illustrating vector-borne transmission
### Aliases: simulate_vectortransmission

### ** Examples

  # To run the simulation with default parameters just call the function:
  result <- simulate_vectortransmission()
  # To choose parameter values other than the standard one, specify them like such:
  result <- simulate_vectortransmission(Sh0 = 100, Sv0 = 1e5,  tmax = 100)
  # You should then use the simulation result returned from the function, like this:
  plot(result$ts[ , "Time"],result$ts[ , "Sh"],xlab='Time',ylab='Number Susceptible',type='l')



