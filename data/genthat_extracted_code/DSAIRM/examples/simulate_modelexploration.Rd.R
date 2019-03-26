library(DSAIRM)


### Name: simulate_modelexploration
### Title: Simulation to illustrate parameter scan of the basic bacteria
###   model #'
### Aliases: simulate_modelexploration

### ** Examples

# To run the simulation with default parameters just call the function:
## Not run: res <- simulate_modelexploration()
# To choose parameter values other than the standard one, specify them, like such:
res <- simulate_modelexploration(tfinal=100, samples=5, samplepar='Bmax', parmin=1e1, parmax=1e5)
# You should then use the simulation result returned from the function, like this:
plot(res$dat[,"xvals"],res$data[,"Bpeak"],xlab='Parameter values',ylab='Peak Bacteria',type='l')



