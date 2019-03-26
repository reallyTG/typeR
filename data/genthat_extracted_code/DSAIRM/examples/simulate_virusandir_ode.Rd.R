library(DSAIRM)


### Name: simulate_virusandir_ode
### Title: Simulation of a viral infection model with an immune response
### Aliases: simulate_virusandir_ode

### ** Examples

# To run the simulation with default parameters just call the function:
result <- simulate_virusandir_ode()
# To choose parameter values other than the standard one, specify them, like such:
result <- simulate_virusandir_ode(V = 100, tfinal = 50, n = 1e5, dU = 1e-2, kT=1e-7)
# You should then use the simulation result returned from the function, like this:
plot(result$ts[,"time"],result$ts[,"V"],xlab='Time',ylab='Virus',type='l',log='y')



