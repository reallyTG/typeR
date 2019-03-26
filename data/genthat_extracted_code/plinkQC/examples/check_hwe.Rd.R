library(plinkQC)


### Name: check_hwe
### Title: Identification of SNPs showing a significant deviation from
###   Hardy-Weinberg- equilibrium (HWE)
### Aliases: check_hwe

### ** Examples

indir <- system.file("extdata", package="plinkQC")
qcdir <- tempdir()
name <- "data"
path2plink <- '/path/to/plink'
# the following code is not run on package build, as the path2plink on the
# user system is not known.
## Not run: 
##D fail_hwe <- check_hwe(indir=indir, qcdir=qcdir, name=name, interactive=FALSE,
##D verbose=TRUE, path2plink=path2plink)
## End(Not run)



