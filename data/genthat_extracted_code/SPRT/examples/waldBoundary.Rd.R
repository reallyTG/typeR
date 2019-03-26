library(SPRT)


### Name: waldBoundary
### Title: Wald Boundaries
### Aliases: waldBoundary

### ** Examples

## Return the logarithm of Wald's A and B boundaries
waldBoundary()

# Return Wald's A and B boundaries
waldBoundary(log = FALSE)

# Return only Wald's A boundary
waldBoundary(boundary = "A", log = FALSE)

## Boundary for different type I and II error rates
waldBoundary(type1 = 0.01, type2 = 0.01, boundary = "A", log = FALSE)



