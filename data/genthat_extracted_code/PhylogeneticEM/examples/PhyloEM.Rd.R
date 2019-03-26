library(PhylogeneticEM)


### Name: PhyloEM
### Title: Model Estimation with Detection of Shifts
### Aliases: PhyloEM

### ** Examples

## Not run: 
##D ## Load Data
##D data(monkeys)
##D ## Run method
##D # Note: use more alpha values for better results.
##D res <- PhyloEM(Y_data = monkeys$dat,        ## data
##D                phylo = monkeys$phy,         ## phylogeny
##D                process = "scOU",            ## scalar OU
##D                random.root = TRUE,          ## root is stationary
##D                stationary.root = TRUE,
##D                K_max = 10,                  ## maximal number of shifts
##D                nbr_alpha = 4,               ## number of alpha values
##D                parallel_alpha = TRUE,       ## parallelize on alpha values
##D                Ncores = 2)
##D ## Plot selected solution (LINselect)
##D plot(res) # three shifts
##D ## Plot selected solution (DDSE)
##D plot(res, method.selection = "DDSE") # no shift
##D ## Extract and solution with 5 shifts
##D params_5 <- params_process(res, K = 5)
##D plot(res, params = params_5)
##D ## Show all equivalent solutions
##D eq_sol <- equivalent_shifts(monkeys$phy, params_5)
##D plot(eq_sol)
## End(Not run)




