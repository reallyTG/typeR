library(plinkQC)


### Name: check_snp_missingness
### Title: Identification of SNPs with high missingness rate
### Aliases: check_snp_missingness

### ** Examples

indir <- system.file("extdata", package="plinkQC")
qcdir <- tempdir()
name <- "data"
path2plink <- '/path/to/plink'
# the following code is not run on package build, as the path2plink on the
# user system is not known.
## Not run: 
##D fail_snp_missingness <- check_snp_missingness(qcdir=qcdir, indir=indir,
##D name=name, interactive=FALSE, verbose=TRUE, path2plink=path2plink)
## End(Not run)



