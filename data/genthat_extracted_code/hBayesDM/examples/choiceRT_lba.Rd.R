library(hBayesDM)


### Name: choiceRT_lba
### Title: Choice Reaction Time task, linear ballistic accumulator modeling
### Aliases: choiceRT_lba

### ** Examples

## Not run: 
##D # Run the model and store results in "output"
##D output <- choiceRT_lba(data = "example", niter = 2000, nwarmup = 1000, nchain = 3, ncore = 3)
##D 
##D # Visually check convergence of the sampling chains (should like like 'hairy caterpillars')
##D plot(output, type = 'trace')
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



