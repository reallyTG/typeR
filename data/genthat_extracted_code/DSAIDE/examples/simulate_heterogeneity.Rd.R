library(DSAIDE)


### Name: simulate_heterogeneity
### Title: Simulation of a compartmental infectious disease transmission
###   model with 2 types of hosts
### Aliases: simulate_heterogeneity

### ** Examples

  # To run the simulation with default parameters just call the function:
  result <- simulate_heterogeneity()
  # To choose parameter values other than the standard one, specify them like such:
  result <- simulate_heterogeneity(S10 = 100, S20 = 1e3,  tmax = 100)
  # You should then use the simulation result returned from the function, like this:
  plot(result$ts[,"Time"],result$ts[,"S1"],xlab='Time',ylab='Number Susceptible 1',type='l')
  # Consider also if we want to make the rate of transmission from infected type 1
  # host to susceptible type 1 host 0.7, and then plot the rate of infection for
  # type 1 hosts.
  result <- simulate_heterogeneity(S10 = 100, S20 = 1e3, b11 = 0.7, tmax = 100)
  plot(result$ts[,"Time"],result$ts[,"I1"],xlab="Time",ylab="Number Infected 1", type = "l")
  # We can do the same for the infection of susceptible type 2 hosts from infected
  # type 1 hosts, and plot the type 2 rate of infection.
  result <- simulate_heterogeneity(S10 = 100, S20 = 1e3, b12 = 0.7, tmax = 100)
  plot(result$ts[,"Time"],result$ts[,"I2"],xlab="Time",ylab="Number Infected 2", type = "l")



