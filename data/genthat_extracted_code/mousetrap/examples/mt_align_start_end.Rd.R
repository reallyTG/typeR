library(mousetrap)


### Name: mt_align_start_end
### Title: Align start and end position of trajectories.
### Aliases: mt_align_start_end

### ** Examples

# Align start and end positions to specific coordinates
mt_example <- mt_align_start_end(mt_example,
  start=c(0,0), end=c(-1,1))
  
  
# Import raw trajectories for demonstration
mt_example <- mt_import_mousetrap(mt_example_raw)

# Remap trajectories
mt_example <- mt_remap_symmetric(mt_example)

# Align trajectories to mean first and last coordinates
mt_example <- mt_align_start_end(mt_example,
  start=NULL, end=NULL)

  



