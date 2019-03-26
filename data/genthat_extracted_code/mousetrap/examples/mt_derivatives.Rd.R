library(mousetrap)


### Name: mt_derivatives
### Title: Calculate distance, velocity, and acceleration.
### Aliases: mt_derivatives

### ** Examples

# Calculate derivatives looking at movement
# across both dimensions
mt_example <- mt_derivatives(mt_example)

# Calculate derivatives only looking at movement along x dimension
# reporting absolute values for distance and velocity
mt_example <- mt_derivatives(mt_example,
  dimensions="xpos", absolute=TRUE)




