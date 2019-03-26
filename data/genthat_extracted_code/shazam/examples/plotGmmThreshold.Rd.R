library(shazam)


### Name: plotGmmThreshold
### Title: Plot findThreshold results for the gmm method
### Aliases: plotGmmThreshold

### ** Examples

## No test: 
# Subset example data to one sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, SAMPLE == "-1h")

# Use nucleotide Hamming distance and normalize by junction length
db <- distToNearest(db, model="ham", normalize="len", nproc=1)

# To find the threshold cut, call findThreshold function for "gmm" method.
output <- findThreshold(db$DIST_NEAREST, method="gmm", model="norm-norm", cutoff="opt")
print(output)

# Plot results
plotGmmThreshold(output, binwidth=0.02)
## End(No test)



