library(mousetrap)


### Name: mt_align_start
### Title: Align start position of trajectories.
### Aliases: mt_align_start

### ** Examples

# Import raw trajectories for demonstration
mt_example <- mt_import_mousetrap(mt_example_raw)

# Align trajectories to start coordinates (0,0)
mt_example <- mt_align_start(mt_example,
  start=c(0,0))
  

# Import raw trajectories for demonstration
mt_example <- mt_import_mousetrap(mt_example_raw)

# Align trajectories to mean first coordinates
mt_example <- mt_align_start(mt_example,
  start=NULL)
  



