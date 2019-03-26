library(birk)


### Name: conv_dim
### Title: Convert Dimensions of Measurement
### Aliases: conv_dim

### ** Examples

# How many minutes does it take to travel 100 meters at 3 feet per second?
conv_dim(x = 100, x_unit = "m", trans = 3, trans_unit = "ft_per_sec", y_unit = "min")

# How many degrees does the temperature increase with an increase in 4 kPa given 0.8 Celcius
# increase per psi?
conv_dim(x_unit = "C", trans = 0.8, trans_unit = "C_per_psi", y = 4, y_unit = "kPa")

# Find the densities given volume and mass measurements.
conv_dim(x = c(60, 80), x_unit = "ft3", trans_unit = "kg_per_l", y = c(6e6, 4e6), y_unit = "g")




