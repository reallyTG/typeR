library(lineup)


### Name: pulldiag
### Title: Pull out the diagonal from a distance matrix
### Aliases: pulldiag
### Keywords: array

### ** Examples

data(expr1, expr2)

## Don't show: 
expr1 <- expr1[,1:500]
expr2 <- expr2[,1:500]
## End(Don't show)

# distance as RMS difference
d <- distee(expr1, expr2)

# pull out the self-self distances
d_selfself <- pulldiag(d)

# samples with smallest self-self correlation
sort(d_selfself)[1:10]




