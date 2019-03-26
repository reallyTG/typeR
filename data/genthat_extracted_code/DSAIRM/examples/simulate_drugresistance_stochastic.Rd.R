library(DSAIRM)


### Name: simulate_drugresistance_stochastic
### Title: Stochastic simulation of a compartmental acute virus infection
###   model with treatment and drug resistant strain
### Aliases: simulate_drugresistance_stochastic

### ** Examples

# To run the simulation with default parameters just call the function:
result <- simulate_drugresistance_stochastic()
# To choose parameter values other than the standard one, specify them, like such:
result <- simulate_drugresistance_stochastic(tfinal = 200, e = 0.5)
# You should then use the simulation result returned from the function, like this:
plot(result$ts[,"time"],result$ts[,"Vs"],xlab='Time',ylab='Uninfected cells',type='l')



