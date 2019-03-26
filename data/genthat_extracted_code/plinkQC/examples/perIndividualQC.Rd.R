library(plinkQC)


### Name: perIndividualQC
### Title: Quality control for all individuals in plink-dataset
### Aliases: perIndividualQC

### ** Examples

indir <- system.file("extdata", package="plinkQC")
qcdir <- tempdir()
name <- "data"
# All quality control checks
# In this examples, run_check* already conducted and outcome files present
# in qcdir, hence dont.check_* all set to FALSE
## Not run: 
##D fail_individuals <- perIndividualQC(indir=indir, qcdir=qcdir, name=name,
##D refSamplesFile=paste(qcdir, "/HapMap_ID2Pop.txt",sep=""),
##D refColorsFile=paste(qcdir, "/HapMap_PopColors.txt", sep=""),
##D prefixMergedDataset="data.HapMapIII", interactive=FALSE, verbose=FALSE,
##D do.run_check_het_and_miss=FALSE, do.run_check_relatedness=FALSE,
##D do.run_check_sex=FALSE, do.run_check_ancestry=FALSE)
##D 
##D # Only check sex and missingness/heterozygosity
##D fail_sex_het_miss <- perIndividualQC(indir=indir, qcdir=qcdir, name=name,
##D dont.check_ancestry=TRUE, dont.check_relatedness=TRUE,
##D interactive=FALSE, verbose=FALSE, do.run_check_het_and_miss=FALSE,
##D do.run_check_sex=FALSE)
## End(Not run)



