library(phyclust)


### Name: haplo.post.prob
### Title: Tzeng's Method: Haplotype Grouping for SNP Sequences
### Aliases: haplo.post.prob
### Keywords: Haploclust

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D data.path <- paste(.libPaths()[1], "/phyclust/data/crohn.phy", sep = "")
##D my.snp <- read.phylip(data.path, code.type = "SNP")
##D ret <- haplo.post.prob(my.snp$org, ploidy = 1)
##D str(ret)
## End(Not run)



