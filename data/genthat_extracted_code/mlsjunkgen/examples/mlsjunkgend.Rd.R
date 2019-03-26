library(mlsjunkgen)


### Name: mlsjunkgend
### Title: Generate a data frame of pseudo-random numbers using the MLS
###   Junk Generator algorithm
### Aliases: mlsjunkgend

### ** Examples

# Generate a pseudo-random number data frame with 10 observations from user-specified seeds

w <- 1
x <- 2
y <- 3
z <- 4

mlsjunkgend(n = 10, w = w, x = x, y = y, z = z) # returns a data frame of 10 observations

# Specifying different values for n and round

mlsjunkgend(n = 5, w = w, x = x, y = y, z = z, round = 2)
# returns a data frame identical to the above example but with only 5 observations
# rounded to 2 decimal places

# using the default value of n (1) is identical to assigning the rounded result of
# junkgen to a data frame of 1 observation

round(junkgen(w = w, x = x, y = y, z = z), 5) # returns "[1] 0.95516"
mlsjunkgend(w = w, x = x, y = y, z = z)
# returns the following:
#        RN
# 1 0.95516



