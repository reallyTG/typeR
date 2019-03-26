library(pmd)


### Name: getstd
### Title: Find the independent ions for each retention time hierarchical
###   clustering based on PMD relationship within each retention time
###   cluster and isotope and return the index of the std data for each
###   retention time cluster.
### Aliases: getstd

### ** Examples

## No test: 
data(spmeinvivo)
pmd <- getpaired(spmeinvivo)
std <- getstd(pmd)
## End(No test)



