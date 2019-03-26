library(DesignLibrary)


### Name: block_cluster_two_arm_designer
### Title: Create a two-arm design with blocks and clusters
### Aliases: block_cluster_two_arm_designer

### ** Examples

# Generate a design using default arguments:
block_cluster_two_arm_design <- block_cluster_two_arm_designer()
block_cluster_uneven <- block_cluster_two_arm_designer(
       N_blocks = 3, N_clusters_in_block = 2:4, N_i_in_cluster = 1:9)
# A design in which number of clusters of cluster size is not specified
# but N and block size are:        
block_cluster_guess <- block_cluster_two_arm_designer(N = 24, N_blocks = 3)
# A design in which cluster size is not specified but N and block size are 
# and target N is not met returns an error:        
## Not run: 
##D block_cluster_guess_2 <- block_cluster_two_arm_designer(N = 24,
##D N_blocks = 3, N_clusters_in_block = 3)
## End(Not run)




