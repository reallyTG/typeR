library(plinkQC)


### Name: overviewPerMarkerQC
### Title: Overview of per marker QC
### Aliases: overviewPerMarkerQC

### ** Examples

indir <- system.file("extdata", package="plinkQC")
qcdir <- tempdir()
name <- "data"
path2plink <- '/path/to/plink'
# the following code is not run on package build, as the path2plink on the
# user system is not known.
# All quality control checks
## Not run: 
##D fail_markers <- perMarkerQC(qcdir=qcdir, indir=indir, name=name,
##D interactive=FALSE, verbose=TRUE, path2plink=path2plink)
##D overview <- overviewPerMarkerQC(fail_markers)
## End(Not run)



