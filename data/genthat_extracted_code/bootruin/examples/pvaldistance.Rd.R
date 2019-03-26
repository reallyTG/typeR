library(bootruin)


### Name: pvaldistance
### Title: Distance Measures of Empirical Probability Functions
### Aliases: pvaldistance
### Keywords: distribution univar

### ** Examples

# A sample from the standard uniform distribution
x <- runif(100, 0, 1)

# Distance to uniformity should be small
pvaldistance(x, "ks")
pvaldistance(x, "cvm")

# A sample from the Beta(2, 7) distribution
y <- rbeta(100, 2, 7)

# Distance to uniformity should be much larger here
pvaldistance(y, "ks")
pvaldistance(y, "cvm")



