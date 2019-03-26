library(timsac)


### Name: wnoise
### Title: White Noise Generator
### Aliases: wnoise
### Keywords: ts

### ** Examples

# Example 1
wnoise(len = 100, perr = 1)

# Example 2
v <- matrix(c(1,  0,  0,
              0,  2,  0,
              0,  0,  3), nrow = 3, ncol = 3, byrow = TRUE)
wnoise(len = 20, perr = v)



