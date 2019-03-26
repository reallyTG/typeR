library(iDINGO)


### Name: plotNetwork
### Title: Plot differential network
### Aliases: plotNetwork

### ** Examples

data(brca)

# Plot the iDINGO result using a p-value threshold of 0.01.
plotNetwork(brca$fit, threshold = 0.01, thresh.type = "p.val")



