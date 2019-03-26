library(plinkQC)


### Name: cleanData
### Title: Create plink dataset with individuals and markers passing
###   quality control
### Aliases: cleanData

### ** Examples

package.dir <- find.package('plinkQC')
indir <- file.path(package.dir, 'extdata')
qcdir <- tempdir()
name <- "data"
path2plink <- '/path/to/plink'
# the following code is not run on package build, as the path2plink on the
# user system is not known.
## Not run: 
##D # Run individual QC checks
##D fail_individuals <- perIndividualQC(indir=indir, qcdir=qcdir, name=name,
##D refSamplesFile=paste(qcdir, "/HapMap_ID2Pop.txt",sep=""),
##D refColorsFile=paste(qcdir, "/HapMap_PopColors.txt", sep=""),
##D prefixMergedDataset="data.HapMapIII", interactive=FALSE, verbose=FALSE)
##D 
##D # Run marker QC checks
##D fail_markers <- perMarkerQC(indir=indir, qcdir=qcdir, name=name)
##D 
##D # Create new dataset of indiviudals and markers passing QC
##D ids_all <- cleanData(indir=indir, qcdir=qcdir, name=name, macTh=15,
##D interactive=FALSE, verbose=TRUE, path2plink=path2plink, filterAncestry=TRUE,
##D filterRelated=TRUE)
## End(Not run)



