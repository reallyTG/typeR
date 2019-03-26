library(libsoc)


### Name: libsoc
### Title: A package to handle PharmML standardized output (SO) XML files
### Aliases: libsoc libsoc-package
### Keywords: package

### ** Examples

# Read in parameter estimates
file <- system.file("extdata", "pheno.SO.xml",  package="libsoc")
so <- so_SO_read(file)
estimates <- so$SOBlock[[1]]$Estimation$PopulationEstimates$MLE

# For more examples see the examples directory



