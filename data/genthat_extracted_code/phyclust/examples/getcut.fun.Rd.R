library(phyclust)


### Name: getcut.fun
### Title: Tzeng's Method: Finding the Best Number of Clusters
### Aliases: getcut.fun
### Keywords: Haploclust

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D data.path <- paste(.libPaths()[1], "/phyclust/data/crohn.phy", sep = "")
##D my.snp <- read.phylip(data.path, code.type = "SNP")
##D ret <- haplo.post.prob(my.snp$org, ploidy = 1)
##D getcut.fun(sort(ret$haplo$hap.prob, decreasing = TRUE),
##D            nn = my.snp$nseq, plot = 1)
## End(Not run)



