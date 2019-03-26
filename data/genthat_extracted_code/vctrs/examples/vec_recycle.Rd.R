library(vctrs)


### Name: vec_recycle
### Title: Vector recycling
### Aliases: vec_recycle vec_recycle_common

### ** Examples

# Inputs with 1 observation are recycled
vec_recycle_common(1:5, 5)
## Not run: 
##D vec_recycle_common(1:5, 1:2)
## End(Not run)

# Inputs with 0 observations
vec_recycle_common(1:5, integer())

# Data frames and matrices are recycled along their rows
vec_recycle_common(data.frame(x = 1), 1:5)
vec_recycle_common(array(1:2, c(1, 2)), 1:5)
vec_recycle_common(array(1:3, c(1, 3, 1)), 1:5)



