library(NLMR)


### Name: nlm_randomcluster
### Title: nlm_randomcluster
### Aliases: nlm_randomcluster

### ** Examples

# simulate random clustering
random_cluster <- nlm_randomcluster(ncol = 30, nrow = 30,
                                     p = 0.4,
                                     ai = c(0.25, 0.25, 0.5))
## Not run: 
##D # visualize the NLM
##D landscapetools::show_landscape(random_cluster)
## End(Not run)




