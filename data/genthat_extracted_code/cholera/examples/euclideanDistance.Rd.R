library(cholera)


### Name: euclideanDistance
### Title: Compute the Euclidean distance between cases and/or pumps.
### Aliases: euclideanDistance

### ** Examples

# path from case 1 to nearest pump.
euclideanDistance(1)

# path from case 1 to pump 6.
euclideanDistance(1, 6)

# exclude pump 7 from consideration.
euclideanDistance(1, -7)

# path from case 1 to case 6.
euclideanDistance(1, 6, type = "cases")

# path from pump 1 to pump 6.
euclideanDistance(1, 6, type = "pumps")



