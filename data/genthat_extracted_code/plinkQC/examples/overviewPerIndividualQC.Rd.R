library(plinkQC)


### Name: overviewPerIndividualQC
### Title: Overview of per sample QC
### Aliases: overviewPerIndividualQC

### ** Examples

indir <- system.file("extdata", package="plinkQC")
qcdir <- tempdir()
name <- "data"
## Not run: 
##D fail_individuals <- perIndividualQC(qcdir=qcdir, indir=indir, name=name,
##D refSamplesFile=paste(qcdir, "/HapMap_ID2Pop.txt",sep=""),
##D refColorsFile=paste(qcdir, "/HapMap_PopColors.txt", sep=""),
##D prefixMergedDataset="data.HapMapIII", interactive=FALSE, verbose=FALSE,
##D do.run_check_het_and_miss=FALSE, do.run_check_relatedness=FALSE,
##D do.run_check_sex=FALSE, do.run_check_ancestry=FALSE)
##D 
##D overview <- overviewPerIndividualQC(fail_individuals)
## End(Not run)



