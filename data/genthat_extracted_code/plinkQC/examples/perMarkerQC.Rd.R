library(plinkQC)


### Name: perMarkerQC
### Title: Quality control for all markers in plink-dataset
### Aliases: perMarkerQC

### ** Examples

indir <- system.file("extdata", package="plinkQC")
qcdir <- tempdir()
name <- "data"
path2plink <- '/path/to/plink'
# the following code is not run on package build, as the path2plink on the
# user system is not known.
# All quality control checks
## Not run: 
##D fail_markers <- perMarkerQC(indir=indir, qcdir=qcdir, name=name,
##D interactive=FALSE, verbose=TRUE, path2plink=path2plink)
## End(Not run)



