library(hBayesDM)


### Name: bandit4arm_4par
### Title: 4-Armed Bandit Task
### Aliases: bandit4arm_4par

### ** Examples

## Not run: 
##D # Run the model and store results in "output"
##D output <- bandit4arm_4par("example", niter = 2000, nwarmup = 1000, nchain = 4, ncore = 4)
##D 
##D # Visually check convergence of the sampling chains (should look like 'hairy caterpillars')
##D plot(output, type = "trace")
##D 
##D # Check Rhat values (all Rhat values should be less than or equal to 1.1)
##D rhat(output)
##D 
##D # Plot the posterior distributions of the hyper-parameters (distributions should be unimodal)
##D plot(output)
##D 
##D # Show the WAIC and LOOIC model fit estimates
##D printFit(output)
## End(Not run)



