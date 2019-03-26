library(DSAIRM)


### Name: simulate_pkpdmodel_ode
### Title: PkPd Virus model
### Aliases: simulate_pkpdmodel_ode

### ** Examples

# To run the simulation with default parameters just call the function:
result <- simulate_pkpdmodel_ode()
# To choose parameter values other than the standard one, specify them, like such:
result <- simulate_pkpdmodel_ode(V = 100, txstart = 10, n = 1e5, dU = 1e-2)
# You should then use the simulation result returned from the function, like this:
plot(result$ts[,"time"],result$ts[,"V"],xlab='Time',ylab='Virus',type='l',log='y')



