library(LW1949)


### Name: keeponly
### Title: Eliminate Consecutive Extreme Values
### Aliases: keeponly

### ** Examples

vec <- c(0, 0, 0, 4, 4, 4, 100, 100, 100, 100)
vec[keeponly(vec)]
# the original vector need not be ordered
vec <- c(100, 4, 100, 4, 0, 100, 0, 4, 0, 100)
keeponly(vec)



