library(poppr)


### Name: bruvo.dist
### Title: Bruvo's distance for microsatellites
### Aliases: bruvo.dist

### ** Examples

# Please note that the data presented is assuming that the nancycat dataset 
# contains all dinucleotide repeats, it most likely is not an accurate
# representation of the data.

# Load the nancycats dataset and construct the repeat vector.
data(nancycats)
names(alleles(nancycats)) <- locNames(nancycats) # small bug in this data set
# Assume the alleles are all dinucleotide repeats.
ssr <- rep(2, nLoc(nancycats))
test_replen(nancycats, ssr)         # Are the repeat lengths consistent?
(ssr <- fix_replen(nancycats, ssr)) # Nope. We need to fix them.

# Analyze the first population in nancycats
bruvo.dist(popsub(nancycats, 1), replen = ssr)

## Not run: 
##D 
##D # get the per locus estimates:
##D bruvo.dist(popsub(nancycats, 1), replen = ssr, by_locus = TRUE)
##D 
##D # View each population as a heatmap.
##D sapply(popNames(nancycats), function(x) 
##D heatmap(as.matrix(bruvo.dist(popsub(nancycats, x), replen = ssr)), symm=TRUE))
## End(Not run)



