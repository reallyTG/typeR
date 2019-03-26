library(algstat)


### Name: Smaker
### Title: Means matrix (rank data)
### Aliases: Smaker

### ** Examples

data(city)

X <- permutations(3)

# the average rank can be computed without this function
normalize <- function(x) x / sum(x)
factorial(3) * apply(t(X) %*% city, 2, normalize)
# the dataset city is really like three datasets; they can be pooled back
# into one via:
rowSums(city)
factorial(3) * apply(t(X) %*% rowSums(city), 2, normalize)


# the means matrix is used to summarize the data to the means subspace
# which is the subspace of m! spanned by the columns of permutations(m)
# note that when we project onto that subspace, the projection has the
# same average rank vector :
Smaker(3) %*% city # the projections, table 2.8
factorial(3) * apply(t(X) %*% Smaker(3) %*% city, 2, normalize)

# the residuals can be computed by projecting onto the orthogonal complement
(diag(6) - Smaker(3)) %*% city # residuals


apply(t(X) %*% city, 2, function(x) x / sum(x) * factorial(3)) # average ranks by group

apply(t(X) %*% rowSums(city), 2, function(x) x / sum(x) * factorial(3)) # average ranks pooled



