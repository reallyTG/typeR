library(tcgsaseq)


### Name: qAbundanceDist
### Title: Gene abundance proportion distribution of RNA-seq data.
### Aliases: qAbundanceDist
### Keywords: datasets

### ** Examples

## Not run: 
##D # Get distribution function of abundance proportions
##D # This distribution was generated from a real dataset
##D #load(url("http://bioinf.wehi.edu.au/voom/qAbundanceDist.RData"))
##D data("qAbundanceDist")
##D curve(qAbundanceDist, from=0, to =0.99)
##D 
##D # Generate baseline proportions for desired number of genes
##D ngenes <- 10000
##D baselineprop <- qAbundanceDist( (1:ngenes)/(ngenes+1) )
##D baselineprop <- baselineprop/sum(baselineprop)
## End(Not run)





