library(BiocManager)


### Name: install
### Title: Install or update Bioconductor, CRAN, and GitHub packages
### Aliases: install BIOCONDUCTOR_ONLINE_VERSION_DIAGNOSIS
### Keywords: environment

### ** Examples


## Not run: 
##D ## update previously installed packages
##D BiocManager::install()
##D 
##D ## install Bioconductor packages, and prompt to update all
##D ## installed packages
##D BiocManager::install(c("GenomicRanges", "edgeR"))
##D 
##D ## install a CRAN and Bioconductor packages:
##D BiocManager::install(c("survival", "SummarizedExperiment"))
##D 
##D ## install a package from source:
##D BiocManager::install("IRanges", type="source")
## End(Not run)




