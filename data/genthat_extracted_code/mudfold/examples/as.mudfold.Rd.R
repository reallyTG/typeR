library(mudfold)


### Name: as.mudfold
### Title: Function for calculating MUDFOLD statistics for a given
###   unfolding scale.
### Aliases: as.mudfold

### ** Examples

## Not run: 
##D ## pick a number for setting the seed
##D n.seed <- 11
##D 
##D ## Simulate an unfolding scale
##D simulation <- mudfoldsim(N=6, n=100, seed=n.seed)
##D 
##D ## get the data
##D dat <- simulation$dat
##D 
##D ## true order
##D true_order <- simulation$true_ord
##D 
##D ## check MUDFOLD statistics for the random simulated rank order
##D mud_stats1 <- as.mudfold(dat)
##D 
##D # get the summary 
##D summary(mud_stats1)
##D 
##D ## check MUDFOLD statistics for the true item rank order
##D mud_stats2 <- as.mudfold(dat[,true_order])
##D 
##D # get the summary for the true item rank order
##D summary(mud_stats2)
## End(Not run)



