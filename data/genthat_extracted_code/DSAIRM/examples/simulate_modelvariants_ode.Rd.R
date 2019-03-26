library(DSAIRM)


### Name: simulate_modelvariants_ode
### Title: Simulation of a viral infection model with immune response The
###   simulation illustrates different alternative models.
### Aliases: simulate_modelvariants_ode

### ** Examples

# To run the simulation with default parameters just call the function:
result <- simulate_modelvariants_ode()
# To choose parameter values other than the standard one, specify them, like such:
result <- simulate_modelvariants_ode(V = 100, k1 = 0 , k2 = 0, k3 = 1e-4)
# You should then use the simulation result returned from the function, like this:
plot(result$ts[,"time"],result$ts[,"V"],xlab='Time',ylab='Virus',type='l',log='y')



