library(DSAIRM)


### Name: simulate_usanalysis
### Title: Simulation to illustrate uncertainty and sensitivity analysis
### Aliases: simulate_usanalysis

### ** Examples

# To run the simulation with default parameters just call the function:
## Not run: result <- simulate_usanalysis()
# To choose parameter values other than the standard one, specify them, like such:
result <- simulate_usanalysis(dImin = 0.1, dImax = 10, samples = 5, tfinal = 50)
# You should then use the simulation result returned from the function, like this:
plot(result$dat[,"dI"],result$dat[,"Bpeak"],xlab='values for d',ylab='Peak Bacteria',type='l')



