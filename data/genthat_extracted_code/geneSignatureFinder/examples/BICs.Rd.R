library(geneSignatureFinder)


### Name: BICs
### Title: Compute the bayesian information criteria
### Aliases: BICs

### ** Examples

data(geNSCLC)
ans <- classify(geNSCLC[, "STX1A"])
BICs(geNSCLC[, "STX1A"], ans$clusters)

# an example with missing values
data(geNSCLC)
ans <- classify(geNSCLC[, "CALCA"])
BICs(geNSCLC[!ans$missing, "CALCA"], ans$clusters[!ans$missing])



