library(DSAIRM)


### Name: simulate_virusandtx_ode
### Title: Simulation of a basic viral infection model with drug treatment
### Aliases: simulate_virusandtx_ode

### ** Examples

# To run the simulation with default parameters just call the function:
result <- simulate_virusandtx_ode()
# To choose parameter values other than the standard one, specify them, like such:
result <- simulate_virusandtx_ode(V = 100, tfinal = 100, n = 1e5, dU = 1e-2)
# You should then use the simulation result returned from the function, like this:
plot(result$ts[,"time"],result$ts[,"V"],xlab='Time',ylab='Virus',type='l',log='y')



