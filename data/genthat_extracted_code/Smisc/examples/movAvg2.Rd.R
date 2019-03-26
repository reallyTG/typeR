library(Smisc)


### Name: movAvg2
### Title: Calculate the moving average using a 2-sided, symmetric window
### Aliases: movAvg2 print.movAvg2 plot.movAvg2
### Keywords: misc

### ** Examples

z <- movAvg2(rnorm(25), bw = 10, type = "e", center.weight = 2)
z

# Look at the attributes
attributes(z)

# Plot the weights
plot(z)

# If we just want to see the weights (without supplying data)
plot(movAvg2(bw = 20, type = "g", center.weight = 1))

# Note how it produces the same values as filter (except at the edge
# of the series
x <- rnorm(10)
movAvg2(x, bw = 2, type = "u")
filter(x, rep(1, 5) / 5)

# These are also the same, except at the edge.
movAvg2(x, bw = 1, type = "l", furthest.weight = 0.5, center.weight = 1)
filter(x, c(0.5, 1, 0.5) / 2)



