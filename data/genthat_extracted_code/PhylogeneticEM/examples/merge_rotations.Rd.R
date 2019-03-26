library(PhylogeneticEM)


### Name: merge_rotations
### Title: Merge fits from independent runs of PhyloEM.
### Aliases: merge_rotations

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
##D ## Rotate dataset
##D rot <- matrix(c(cos(pi/4), -sin(pi/4), sin(pi/4), cos(pi/4)), nrow= 2, ncol = 2)
##D Yrot <- t(rot) %*% monkeys$dat
##D rownames(Yrot) <- rownames(monkeys$dat)
##D ## Fit rotated dataset
##D # Note: use more alpha values for better results.
##D res_rot <- PhyloEM(Y_data = Yrot,               ## rotated data
##D                    phylo = monkeys$phy,         
##D                    process = "scOU",            
##D                    random.root = TRUE,          
##D                    stationary.root = TRUE,
##D                    K_max = 10,                  
##D                    nbr_alpha = 4,               
##D                    parallel_alpha = TRUE,       
##D                    Ncores = 2)
##D ## Merge the two
##D res_merge <- merge_rotations(res, res_rot)
##D ## Plot the selected result
##D plot(res_merge)
##D ## Plot the model selection criterion
##D plot_criterion(res_merge)
## End(Not run)




