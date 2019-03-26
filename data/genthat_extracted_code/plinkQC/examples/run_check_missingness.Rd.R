library(plinkQC)


### Name: run_check_missingness
### Title: Run PLINK missingness rate calculation
### Aliases: run_check_missingness

### ** Examples

indir <- system.file("extdata", package="plinkQC")
name <- 'data'
qcdir <- tempdir()
# the following code is not run on package build, as the path2plink on the
# user system is not known.
## Not run: 
##D run <- run_check_missingnessness(indir=indir, qcdir=qcdir, name=name)
## End(Not run)



