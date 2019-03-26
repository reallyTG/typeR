library(mousetrap)


### Name: mt_add_variables
### Title: Add new variables to trajectory array.
### Aliases: mt_add_variables

### ** Examples

# Calculate new (arbitrary) variables for this example
# ... the sum of the x- and y-positions
xy_sum <- mt_example$trajectories[,,"xpos"] + mt_example$trajectories[,,"ypos"]
# ... the product of the x- and y-positions
xy_prod <- mt_example$trajectories[,,"xpos"] * mt_example$trajectories[,,"ypos"]

# Add the new variables to the trajectory array
mt_example <- mt_add_variables(mt_example,
  variables=list(xy_sum=xy_sum, xy_prod=xy_prod))




