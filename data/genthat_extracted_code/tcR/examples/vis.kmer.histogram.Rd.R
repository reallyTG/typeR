library(tcR)


### Name: vis.kmer.histogram
### Title: Plot of the most frequent kmers.
### Aliases: vis.kmer.histogram

### ** Examples

## Not run: 
##D # Load necessary data and package.
##D library(gridExtra)
##D load('immdata.rda')
##D # Get 5-mers.
##D imm.km <- get.kmers(immdata)
##D # Plots for kmer proportions in each data frame in immdata.
##D p1 <- vis.kmer.histogran(imm.km, .position = 'stack')
##D p2 <- vis.kmer.histogran(imm.km, .position = 'fill')
##D grid.arrange(p1, p2)
## End(Not run)



