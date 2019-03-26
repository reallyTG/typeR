library(polysat)


### Name: alleleCorrelations
### Title: Assign Alleles to Isoloci Based on Distribution of Genotypes
### Aliases: alleleCorrelations testAlGroups
### Keywords: cluster logic

### ** Examples

# randomly generate example data for an allotetraploid
mydata <- simAllopoly(n.alleles=c(5,5), n.homoplasy=1)
viewGenotypes(mydata)

# test allele correlations
# n.start is lowered in this example to speed up computation time
myCorr <- alleleCorrelations(mydata, n.subgen=2, n.start=10)
myCorr$Kmeans.groups
myCorr$clustering.method
if(!is.null(myCorr$heatmap.dist)) heatmap(myCorr$heatmap.dist)

# check individual genotypes 
# (low maxreps used in order to speed processing time for this example)
myRes <- testAlGroups(mydata, myCorr, SGploidy=2, maxreps = 5)
myRes$assignments
myRes2 <- testAlGroups(mydata, myCorr, SGploidy=2, swap = FALSE)
myRes2$assignments



