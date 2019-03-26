library(plinkQC)


### Name: evaluate_check_ancestry
### Title: Evaluate results from PLINK PCA on combined study and reference
###   data
### Aliases: evaluate_check_ancestry

### ** Examples

## Not run: 
##D qcdir <- system.file("extdata", package="plinkQC")
##D name <- "data"
##D fail_ancestry <- evaluate_check_ancestry(indir=qcdir, name=name,
##D refSamplesFile=paste(qcdir, "/HapMap_ID2Pop.txt",sep=""),
##D refColorsFile=paste(qcdir, "/HapMap_PopColors.txt", sep=""),
##D prefixMergedDataset="data.HapMapIII", interactive=FALSE)
## End(Not run)



