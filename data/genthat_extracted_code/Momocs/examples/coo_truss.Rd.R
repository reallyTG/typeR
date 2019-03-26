library(Momocs)


### Name: coo_truss
### Title: Truss measurement
### Aliases: coo_truss

### ** Examples

# example on a single shape
cat <- coo_sample(shapes[4], 6)
coo_truss(cat)

# example on wings dataset
tx <- coo_truss(wings)
dim(tx)
# we normalize and plot an heatmap
txn <- apply(tx$coe, 2, .normalize)
# heatmap(txn)

txp <- PCA(tx, scale. = TRUE, center=TRUE, fac=wings$fac)
plot(txp, 1)



