library(rEDM)


### Name: ccm
### Title: Perform convergent cross mapping using simplex projection
### Aliases: ccm

### ** Examples

data("sardine_anchovy_sst")
anchovy_xmap_sst <- ccm(sardine_anchovy_sst, E = 3, 
  lib_column = "anchovy", target_column = "np_sst", 
  lib_sizes = seq(10, 80, by = 10), num_samples = 100)
 



