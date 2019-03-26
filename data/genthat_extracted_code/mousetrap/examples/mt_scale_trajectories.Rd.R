library(mousetrap)


### Name: mt_scale_trajectories
### Title: Standardize variables in mouse trajectory array.
### Aliases: mt_scale_trajectories

### ** Examples

# Calculate derivatives
mt_example <- mt_derivatives(mt_example)

# Standardize velocity across trajectories
mt_example <- mt_scale_trajectories(mt_example,var_names = "vel")




