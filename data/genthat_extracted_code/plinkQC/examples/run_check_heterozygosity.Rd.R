library(plinkQC)


### Name: run_check_heterozygosity
### Title: Run PLINK heterozygosity rate calculation
### Aliases: run_check_heterozygosity

### ** Examples

indir <- system.file("extdata", package="plinkQC")
name <- 'data'
qcdir <- tempdir()
# the following code is not run on package build, as the path2plink on the
# user system is not known.
## Not run: 
##D run <- run_check_heterozygosity(indir=indir, qcdir=qcdir, name=name)
## End(Not run)



