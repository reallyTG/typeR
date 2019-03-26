library(DSAIRM)


### Name: simulate_basicvirus_stochastic
### Title: Stochastic simulation of a compartmental acute virus infection
###   model
### Aliases: simulate_basicvirus_stochastic

### ** Examples

# To run the simulation with default parameters just call the function:
result <- simulate_basicvirus_stochastic()
# To choose parameter values other than the standard one, specify them, like such:
result <- simulate_basicvirus_stochastic(U = 1e3, dI = 0.1)
# You should then use the simulation result returned from the function, like this:
plot(result$ts[,"time"],result$ts[,"V"],xlab='Time',ylab='Virus',type='l')



