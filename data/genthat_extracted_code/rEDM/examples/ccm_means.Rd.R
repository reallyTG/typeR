library(rEDM)


### Name: ccm_means
### Title: Take output from ccm and compute means as a function of library
###   size.
### Aliases: ccm_means

### ** Examples

data("sardine_anchovy_sst")
anchovy_xmap_sst <- ccm(sardine_anchovy_sst, E = 3, 
  lib_column = "anchovy", target_column = "np_sst", 
  lib_sizes = seq(10, 80, by = 10), num_samples = 100)
a_xmap_t_means <- ccm_means(anchovy_xmap_sst)
 



