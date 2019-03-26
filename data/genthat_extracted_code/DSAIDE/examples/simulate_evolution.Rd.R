library(DSAIDE)


### Name: simulate_evolution
### Title: Stochastic simulation of a compartmental SIR-type model with
###   wild-type and mutant strains and treatment
### Aliases: simulate_evolution

### ** Examples

# To run the simulation with default parameters just call the function:
result <- simulate_evolution()
# To choose parameter values other than the standard one, specify them like such:
result <- simulate_evolution(S0 = 2000,  tmax = 200, bt = 1/100)
# You should then use the simulation result returned from the function, like this:
plot(result$ts[ , "Time"],result$ts[ , "S"],xlab='Time',ylab='Number Susceptible',type='l')
# Consider also a case in which the fraction of resistant mutant infections that an
# untreated host produces is high, at 0.9.
result <- simulate_evolution(S0 = 2000, tmax = 200, bt = 1/100, cu = 0.9)
plot(result$ts[,"Time"], result$ts[,"S"], xlab ="Time", ylab = "Number Susceptible",type ="l")



