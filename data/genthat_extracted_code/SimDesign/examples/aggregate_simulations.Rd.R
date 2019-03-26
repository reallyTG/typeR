library(SimDesign)


### Name: aggregate_simulations
### Title: Collapse separate simulation files into a single result
### Aliases: aggregate_simulations

### ** Examples

## Not run: 
##D 
##D setwd('my_working_directory')
##D 
##D ## run simulations to save the .rds files (or move them to the working directory)
##D # runSimulation(..., filename='file1')
##D # runSimulation(..., filename='file2')
##D 
##D final <- aggregate_simulations()
##D saveRDS(final, 'my_final_simulation.rds')
##D 
##D # aggregate saved results
##D # runSimulation(..., save_results = TRUE, save_details = list(save_results_dirname = 'dir1'))
##D # runSimulation(..., save_results = TRUE, save_details = list(save_results_dirname = 'dir2'))
##D 
##D # place new saved results in 'SimDesign_results/' directory by default
##D aggregate_simulations(dirs = c('dir1', 'dir2'))
##D 
##D 
## End(Not run)



