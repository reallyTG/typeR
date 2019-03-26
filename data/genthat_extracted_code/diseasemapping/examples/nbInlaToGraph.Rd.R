library(diseasemapping)


### Name: nbToInlaGraph
### Title: Write a graph file for INLA
### Aliases: nbToInlaGraph

### ** Examples


data('kentucky')
# remove all the neighbours Ballard county
kSub = kentucky[-c(2,20,79),]

if( require("spdep", quietly=TRUE)) {


adjMat = poly2nb(
	kSub, 
	row.names=kSub$County,
	queen=FALSE
)

nFile = tempfile()
nbRes = nbToInlaGraph(adjMat, nFile)

# Ballard is region 3
nbRes['Ballard']
# note that Ballard has no neighbours
adjMat[[3]]

cat(readLines(nFile, n=5), sep='\n')

## Not run: 
##D # there will be a warning about zero neighbours
##D junk = bym(poverty ~ 1, data=kSub, family='gaussian')
## End(Not run)

}




