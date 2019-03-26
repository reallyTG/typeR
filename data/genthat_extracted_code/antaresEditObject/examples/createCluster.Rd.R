library(antaresEditObject)


### Name: createCluster
### Title: Create a thermal cluster
### Aliases: createCluster

### ** Examples

## Not run: 
##D 
##D library(antaresRead)
##D library(antaresEditObject)
##D 
##D # Create a cluster :
##D createCluster(
##D   area = "fr", 
##D   cluster_name = "my_cluster",
##D   group = "other", 
##D   unitcount = 1L, # or as.integer(1)
##D   `marginal-cost` = 50
##D )
##D # by default, cluster name is prefixed 
##D # by the area name
##D levels(readClusterDesc()$cluster)
##D # > "fr_my_cluster"
##D 
##D # To prevent this, use `add_prefix`
##D createCluster(
##D   area = "fr", 
##D   cluster_name = "my_cluster",
##D   add_prefix = FALSE,
##D   group = "other", 
##D   `marginal-cost` = 50
##D )
##D levels(readClusterDesc()$cluster)
##D # > "my_cluster"
##D 
##D 
##D # Pre-process data : 
##D 
##D #Æ this is the default data :
##D createCluster(
##D   area = "fr", 
##D   cluster_name = "my_cluster",
##D   prepro_data = matrix(
##D     data = c(rep(1, times = 365 * 2),
##D              rep(0, times = 365 * 4)), 
##D     ncol = 6
##D   )
##D )
##D 
##D # with a data.frame
##D createCluster(
##D   area = "fr", 
##D   cluster_name = "my_cluster",
##D   prepro_data = data.frame(
##D     v1 = rep(7, 365), # column name doesn't matter
##D     v2 = rep(27, 365),
##D     v3 = rep(0.05, 365),
##D     v4 = rep(0.12, 365),
##D     v5 = rep(0, 365),
##D     v6 = rep(1, 365)
##D   )
##D )
##D 
##D 
##D # Pre-process modulation : 
##D # this is the default data
##D createCluster(
##D   area = "fr", 
##D   cluster_name = "my_cluster",
##D   prepro_modulation =  = matrix(
##D     data = c(rep(1, times = 365 * 24 * 3),
##D              rep(0, times = 365 * 24 * 1)),
##D     ncol = 4
##D   )
##D )
##D 
##D # with a data.frame
##D createCluster(
##D   area = "fr", 
##D   cluster_name = "my_cluster",
##D   prepro_modulation = data.frame(
##D     var1 = rep(0, 8760), # column name doesn't matter
##D     var2 = rep(1, 8760),
##D     var3 = rep(0, 8760),
##D     var4 = rep(1, 8760)
##D   )
##D )
##D 
## End(Not run)



