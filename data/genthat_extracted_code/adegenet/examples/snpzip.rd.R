library(adegenet)


### Name: snpzip
### Title: Identification of structural SNPs
### Aliases: snpzip
### Keywords: multivariate

### ** Examples

  ## Not run: 
##D     simpop <- glSim(100, 10000, n.snp.struc = 10, grp.size = c(0.3,0.7), 
##D                     LD = FALSE, alpha = 0.4, k = 4)
##D     snps <- as.matrix(simpop)
##D     phen <- simpop@pop
##D     
##D     outcome <- snpzip(snps, phen, method = "centroid")
##D     outcome
##D   
## End(Not run)
  ## Not run: 
##D     simpop <- glSim(100, 10000, n.snp.struc = 10, grp.size = c(0.3,0.7), 
##D                     LD = FALSE, alpha = 0.4, k = 4)
##D     snps <- as.matrix(simpop)
##D     phen <- simpop@pop
##D     
##D     dapc1 <- dapc(snps, phen, n.da = 1, n.pca = 30)
##D     
##D     features <- snpzip(dapc1, loading.plot = TRUE, method = "average")
##D     features
##D   
## End(Not run)



