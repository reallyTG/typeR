library(inbreedR)


### Name: g2_snps
### Title: Estimating g2 from larger datasets, such as SNPs
### Aliases: g2_snps

### ** Examples

# load SNP genotypes in 0 (homozygous), 1 (heterozygous), NA (missing) format.
# low number of bootstraps and permutations for computational reasons.
data(mouse_snps)
(g2_mouse <- g2_snps(mouse_snps, nperm = 10, nboot = 10, CI = 0.95))

# parallelized version for more bootstraps or permutations
## Not run: 
##D (g2_mouse <- g2_snps(mouse_snps, nperm = 1000, nboot = 1000, 
##D                      CI = 0.95, parallel = TRUE, ncores = 4))
## End(Not run)




