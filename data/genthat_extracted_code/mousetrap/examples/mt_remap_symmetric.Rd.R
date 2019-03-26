library(mousetrap)


### Name: mt_remap_symmetric
### Title: Remap mouse trajectories.
### Aliases: mt_remap_symmetric

### ** Examples

# Remap trajectories so that all trajectories
# end in the top-left corner
mt_example <- mt_import_mousetrap(mt_example_raw)
mt_example <- mt_remap_symmetric(mt_example)

# Only flip trajectories vertically so that all
# trajectories end in the upper half of the screen
mt_example <- mt_import_mousetrap(mt_example_raw)
mt_example <- mt_remap_symmetric(mt_example,
  remap_xpos="no", remap_ypos="up")
  



