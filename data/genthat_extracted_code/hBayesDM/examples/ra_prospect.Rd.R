library(hBayesDM)


### Name: ra_prospect
### Title: Risk Aversion Task
### Aliases: ra_prospect

### ** Examples

## Not run: 
##D # Run the model and store results in "output"
##D output <- ra_prospect("example", niter = 2000, nwarmup = 1000, nchain = 4, ncore = 4)
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

## Not run: 
##D # Paths to data published in Sokol-Hessner et al. (2009)
##D path_to_attend_data <- system.file("extdata", "ra_data_attend.txt", package = "hBayesDM")
##D path_to_regulate_data <- system.file("extdata", "ra_data_reappraisal.txt", package = "hBayesDM")
## End(Not run)



