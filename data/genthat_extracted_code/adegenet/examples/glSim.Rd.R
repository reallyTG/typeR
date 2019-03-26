library(adegenet)


### Name: glSim
### Title: Simulation of simple genlight objects
### Aliases: glSim
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## no structure
##D x <- glSim(100, 1e3, ploid=2)
##D plot(x)
##D 
##D ## 1,000 non structured SNPs, 100 structured SNPs
##D x <- glSim(100, 1e3, n.snp.struc=100, ploid=2)
##D plot(x)
##D 
##D ## 1,000 non structured SNPs, 100 structured SNPs, ploidy=4
##D x <- glSim(100, 1e3, n.snp.struc=100, ploid=4)
##D plot(x)
##D 
##D ## same thing, stronger differences between groups
##D x <- glSim(100, 1e3, n.snp.struc=100, ploid=2, alpha=0.4)
##D plot(x)
##D 
##D ##  same thing, loci with LD structures
##D x <- glSim(100, 1e3, n.snp.struc=100, ploid=2, alpha=0.4, LD=TRUE, block.minsize=100)
##D plot(x)
## End(Not run)



