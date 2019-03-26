library(dials)


### Name: grid_regular
### Title: Create grids of tuning parameters
### Aliases: grid_regular grid_random

### ** Examples

# Will fail due to unknowns:
# grid_regular(mtry, min_n)

grid_regular(penalty, mixture)
grid_regular(penalty, mixture, levels = c(3, 4))
grid_random(penalty, mixture)




