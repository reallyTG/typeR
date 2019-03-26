library(DesignLibrary)


### Name: cluster_sampling_designer
### Title: Create a design for cluster random sampling
### Aliases: cluster_sampling_designer

### ** Examples

# To make a design using default arguments:
cluster_sampling_design <- cluster_sampling_designer()
# A design with varying block size and varying cluster size
cluster_sampling_design <- cluster_sampling_designer(
  N_blocks = 2, N_clusters_in_block = 6:7, N_i_in_cluster = 3:15, 
  n_clusters_in_block = 5,  n_i_in_cluster = 2)



