library(shazam)


### Name: findThreshold
### Title: Find distance threshold
### Aliases: findThreshold

### ** Examples

## No test: 
# Subset example data to one sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, SAMPLE == "-1h")

# Use nucleotide Hamming distance and normalize by junction length
db <- distToNearest(db, model="ham", normalize="len", nproc=1)
                            
# Find threshold using the "gmm" method with optimal threshold
output <- findThreshold(db$DIST_NEAREST, method="gmm", model="gamma-gamma", cutoff="opt")
plot(output, binwidth=0.02, title=paste0(output@model, "   loglk=", output@loglk))
print(output)

# Find threshold using the "gmm" method with user defined specificity
output <- findThreshold(db$DIST_NEAREST, method="gmm", model="gamma-gamma", 
                        cutoff="user", spc=0.99)
plot(output, binwidth=0.02, title=paste0(output@model, "   loglk=", output@loglk))
print(output)

# Find threshold using the "density" method and plot the results
output <- findThreshold(db$DIST_NEAREST, method="density")
plot(output)
print(output)
## End(No test)



