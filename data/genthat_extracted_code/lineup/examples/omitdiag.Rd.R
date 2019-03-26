library(lineup)


### Name: omitdiag
### Title: Replace the diagonal in a distance matrix with missing values
### Aliases: omitdiag
### Keywords: array

### ** Examples

data(expr1, expr2)

## Don't show: 
expr1 <- expr1[,1:500]
expr2 <- expr2[,1:500]
## End(Don't show)

# distance as RMS difference
d <- distee(expr1, expr2)

# focus on the self-nonself distances
# (replace self-self distances with NA)
d_selfnonself <- omitdiag(d)




