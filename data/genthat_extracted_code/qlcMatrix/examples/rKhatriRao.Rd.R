library(qlcMatrix)


### Name: rKhatriRao
### Title: 'reduced' Khatri-Rao product (sparse matrices)
### Aliases: rKhatriRao

### ** Examples

# two sparse matrices with row names

X <- rSparseMatrix(1e4, 1e3, 1e4)
Y <- rSparseMatrix(1e4, 1e3, 1e4)

rownames(X) <- 1:nrow(X)
rownames(Y) <- 1:nrow(Y)

# the basic KhatriRao product is very fast
# but almost all rows are empty

system.time(M <- KhatriRao(X, Y))
## Not run: 
##D sum(rowSums(M)==0)/nrow(M) # 99.9% empty rows
## End(Not run)

# To produce all row names takes a long time
# with 1e8 row names it took half an hour on my laptop
# so: don't try the following, except on a very large machine!
## Not run: 
##D system.time(M <- KhatriRao(X, Y, make.dimnames = TRUE))
## End(Not run)

# Using the current special version works just fine and is reasonably quick
system.time(M <- rKhatriRao(X, Y))




