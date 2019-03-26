library(cholera)


### Name: euclideanPath
### Title: Compute path of the Euclidean distance between cases and/or
###   pumps.
### Aliases: euclideanPath

### ** Examples

# path from case 1 to nearest pump.
euclideanPath(1)

# path from case 1 to pump 6.
euclideanPath(1, 6)

# exclude pump 7 from consideration.
euclideanPath(1, -7)

# path from case 1 to case 6.
euclideanPath(1, 6, type = "cases")

# path from pump 1 to pump 6.
euclideanPath(1, 6, type = "pumps")

# Plot result
plot(euclideanPath(1))



