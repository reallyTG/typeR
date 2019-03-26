library(mlsjunkgen)


### Name: mlsjunkgenm
### Title: Generate a matrix of pseudo-random numbers using the MLS Junk
###   Generator algorithm
### Aliases: mlsjunkgenm

### ** Examples

# Generate a 4x4 matrix of pseudo-random numbers with user-specified seeds

w <- 1
x <- 2
y <- 3
z <- 4

mlsjunkgenm(nrow = 4, ncol = 4, w = w, x = x, y = y, z = z) # returns a 4x4 matrix

# the sixteen values in the above matrix are equivalent to the following call
# to mlsjunkgenv

mlsjunkgenv(n = 16, w = w, x = x, y = y, z = z)

# matrices need not be square
# this returns a 3x2 matrix of pseudo-random numbers with 2 decimal places
mlsjunkgenm(nrow = 3, ncol = 2, w = w, x = x, y = y, z = z, round = 2)

# using the default value of n (1) generates a 1x1 matrix the value of which
# is identical to running junkgen and rounding the result to 5 decimal places

round(junkgen(w = w, x = x, y = y, z = z), 5) # returns "[1] 0.95516"
mlsjunkgenv(w = w, x = x, y = y, z = z) # returns a 1x1 matrix with single element = "0.95516"



