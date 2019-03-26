library(plinkQC)


### Name: check_maf
### Title: Identification of SNPs with low minor allele frequency
### Aliases: check_maf

### ** Examples

indir <- system.file("extdata", package="plinkQC")
qcdir <- tempdir()
name <- "data"
path2plink <- '/path/to/plink'
# the following code is not run on package build, as the path2plink on the
# user system is not known.
## Not run: 
##D fail_maf <- check_maf(indir=indir, qcdir=qcdir, name=name, macTh=15,
##D interactive=FALSE, verbose=TRUE, path2plink=path2plink)
## End(Not run)



