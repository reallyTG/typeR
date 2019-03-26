library(plinkQC)


### Name: check_ancestry
### Title: Identification of individuals of divergent ancestry
### Aliases: check_ancestry

### ** Examples

## Not run: 
##D indir <- system.file("extdata", package="plinkQC")
##D name <- "data"
##D fail_ancestry <- check_ancestry(indir=indir, name=name,
##D refSamplesFile=paste(indir, "/HapMap_ID2Pop.txt",sep=""),
##D refColorsFile=paste(indir, "/HapMap_PopColors.txt", sep=""),
##D prefixMergedDataset="data.HapMapIII", interactive=FALSE,
##D run.check_ancestry=FALSE)
## End(Not run)



