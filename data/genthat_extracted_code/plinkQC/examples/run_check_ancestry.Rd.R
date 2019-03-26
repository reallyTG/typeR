library(plinkQC)


### Name: run_check_ancestry
### Title: Run PLINK principal component analysis
### Aliases: run_check_ancestry

### ** Examples

indir <- system.file("extdata", package="plinkQC")
qcdir <- tempdir()
prefixMergedDataset <- 'data.HapMapIII'
# the following code is not run on package build, as the path2plink on the
# user system is not known.
## Not run: 
##D run <- run_check_ancestry(indir=indir, qcdir=qcdir, prefixMergedDataset)
## End(Not run)



