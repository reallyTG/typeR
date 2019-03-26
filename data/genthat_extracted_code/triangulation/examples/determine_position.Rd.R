library(triangulation)


### Name: determine_position
### Title: Determine position of observer
### Aliases: determine_position

### ** Examples

determine_position(A = c(0, 0), B = c(10, 0), C = c(5, 5 * 3^0.5), observer_angle_AB = pi * 2/3,
observer_angle_AC = pi * 1/2)

determine_position(A = c(0, 0), B = c(10, 0), C = c(5, 5), observer_angle_AB = pi * 5/6,
observer_angle_AC = pi * 1/2, observer_angle_BC = NA, lines_in_plot = FALSE)

determine_position(A = c(0, 0), B = c(10, 0), C = c(5, 5), observer_angle_AB = pi * 5/6,
observer_angle_AC = pi * 1/2, observer_angle_BC = pi * 2/3, lines_in_plot = FALSE)



