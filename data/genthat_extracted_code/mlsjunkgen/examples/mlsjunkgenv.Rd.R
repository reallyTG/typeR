library(mlsjunkgen)


### Name: mlsjunkgenv
### Title: Generate a vector of pseudo-random numbers using the MLS Junk
###   Generator algorithm
### Aliases: mlsjunkgenv

### ** Examples

# Generate a pseudo-random number stream of length 5 with user-specified seeds

w <- 1
x <- 2
y <- 3
z <- 4

# the following call returns "[1] 0.95516 0.66908 0.21235 0.34488 0.11995"
mlsjunkgenv(n = 5, w = w, x = x, y = y, z = z)

# Specifying different values for n and round

mlsjunkgenv(n = 3, w = w, x = x, y = y, z = z, round = 2) # returns "[1] 0.96 0.67 0.21"

# using the default value of n (1) is identical to running junkgen and rounding
# the result to 5 decimal places

round(junkgen(w = w, x = x, y = y, z = z),5) # returns "[1] 0.95516"
mlsjunkgenv(w = w, x = x, y = y, z = z) # returns "[1] 0.95516"



