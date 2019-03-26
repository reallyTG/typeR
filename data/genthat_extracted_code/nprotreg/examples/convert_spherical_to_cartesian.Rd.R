library(nprotreg)


### Name: convert_spherical_to_cartesian
### Title: Converts Spherical to Cartesian Coordinates.
### Aliases: convert_spherical_to_cartesian

### ** Examples

library(nprotreg)

# Define the Spherical coordinates of the North and South Poles.

north_pole <- cbind(0, pi / 2)
south_pole <- cbind(0, - pi / 2)
spherical_coords <- rbind(north_pole, south_pole)

# Get the corresponding Cartesian coordinates.

cartesian_coords <- convert_spherical_to_cartesian(spherical_coords)



