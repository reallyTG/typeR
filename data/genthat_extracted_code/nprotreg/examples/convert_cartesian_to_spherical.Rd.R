library(nprotreg)


### Name: convert_cartesian_to_spherical
### Title: Converts Cartesian to Spherical Coordinates.
### Aliases: convert_cartesian_to_spherical

### ** Examples

library(nprotreg)

# Define the Cartesian coordinates of the North and South Poles.

north_pole <- cbind(0, 0, 1)
south_pole <- cbind(0, 0, -1)
cartesian_coords <- rbind(north_pole, south_pole)

# Get the corresponding Spherical coordinates.

spherical_coords <- convert_cartesian_to_spherical(cartesian_coords)



