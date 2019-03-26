library(RevEcoR)


### Name: seedset-class
### Title: 'seedset-class'
### Aliases: seedset-class

### ** Examples

## Not run: 
##D #' ## generate a metabolic network in igraph class and a seed set of this graph
##D annodir <- system.file("extdata","koanno.tab",package = "RevEcoR")
##D metabolic.data <- read.delim2(file=annodir,stringsAsFactors=FALSE)
##D g <- reconstructGsMN(metabolic.data)
##D seeds <- getSeedSets(g)@seeds
##D seed.set <- new("seedset",GsMN = g, seeds = seeds)
## End(Not run)



