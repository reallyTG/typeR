library(adegenet)


### Name: seploc
### Title: Separate data per locus
### Aliases: seploc seploc-methods seploc,ANY-method seploc,genind-method
###   seploc,genpop-method seploc,genlight-method
### Keywords: manip

### ** Examples

## Not run: 
##D ## example on genind objects
##D data(microbov)
##D 
##D # separate all markers
##D obj <- seploc(microbov)
##D names(obj)
##D 
##D obj$INRA5
##D 
##D 
##D ## example on genlight objects
##D x <- glSim(100, 1000, 0, ploidy=2) # simulate data
##D x <- x[,order(glSum(x))] # reorder loci by frequency of 2nd allele
##D glPlot(x, main="All data") # plot data
##D foo <- seploc(x, n.block=3) # form 3 blocks
##D foo
##D glPlot(foo[[1]], main="1st block") # plot 1st block
##D glPlot(foo[[2]], main="2nd block") # plot 2nd block
##D glPlot(foo[[3]], main="3rd block") # plot 3rd block
##D 
##D foo <- seploc(x, block.size=600, random=TRUE) # split data, randomize loci
##D foo # note the different block sizes
##D glPlot(foo[[1]])
## End(Not run)



