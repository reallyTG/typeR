library(DSAIDE)


### Name: simulate_multipathogen
### Title: Simulation of a compartmental infectious disease transmission
###   model with 2 types of pathogens
### Aliases: simulate_multipathogen

### ** Examples

  # To run the simulation with default parameters just call the function:
  result <- simulate_multipathogen()
  # To choose parameter values other than the standard one, specify them like such:
  result <- simulate_multipathogen(S0 = 100, I20 = 10,  tmax = 100, a = 0.5)
  # You should then use the simulation result returned from the function, like this:
  plot(result$ts[,"Time"], result$ts[ , "S"], xlab='Time', ylab='Number Susceptible', type='l')
  # We could set the infected type 1 host recovery rate at a high level, e.g., 1.2, and
  # examine the infected 1 curve.
  result <- simulate_multipathogen(S0 = 100, I20 = 10, tmax = 100, g1 = 1.2)
  plot(result$ts[,"Time"],result$ts[,"I1"], xlab="Time",ylab="Number Infected Type 1",type="l")
  # Additionally, consider making type 1 hosts transmit at a high rate.
  result <- simulate_multipathogen(S0 = 100, I20 = 10, tmax = 100, b1 = 2.5)
  plot(result$ts[,"Time"],result$ts[,"I1"], xlab="Time",ylab="Number Infected Type 1",type="l")



