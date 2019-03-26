library(BLSM)


### Name: estimate_latent_positions
### Title: BLSM simulation
### Aliases: estimate_latent_positions

### ** Examples

## Don't show: 
blsm_obj_test_1 = estimate_latent_positions(example_adjacency_matrix, burn_in = 10^3, nscan = 3*10^3, odens=100)
blsm_obj_test_2 = estimate_latent_positions(example_adjacency_matrix, procrustean=FALSE, burn_in = 10^3, nscan = 3*10^3, odens=100)
## End(Don't show)
## Not run: 
##D  # Procrustean version followed by clustering
##D  blsm_obj = estimate_latent_positions(example_adjacency_matrix,  
##D                           burn_in = 3*10^4, nscan = 10^5, dynamic_plot = TRUE)
##D                           
##D  avg_latent_positions = rowMeans(blsm_obj$Iterations, dims=2)                   
##D  h_cl = hclust(dist(avg_latent_positions), method="complete")
##D  n = 3
##D  latent_space_clusters = cutree(h_cl, k=n)
##D  print(latent_space_clusters)
##D  plot(avg_latent_positions, col=rainbow(n)[latent_space_clusters], pch=20)
##D  
##D  # Non-Procrustean version followed by clustering                    
##D  blsm_obj_2 = estimate_latent_positions(example_adjacency_matrix, procrustean=FALSE,
##D                           burn_in = 3*10^4, nscan = 10^5)
##D  avg_latent_distances = rowMeans(blsm_obj_2$Iterations, dims=2)
##D  h_cl = hclust(as.dist(avg_latent_distances), method="complete")
##D  n = 3
##D  latent_space_clusters_2 = cutree(h_cl, k=n)
##D  print(latent_space_clusters_2)
##D                            
##D  # Weighted network 
##D  blsm_obj_3 = estimate_latent_positions(example_adjacency_matrix, example_weights_matrix, 
##D                           burn_in = 10^5, nscan = 2*10^5, dynamic_plot = TRUE)
## End(Not run)



