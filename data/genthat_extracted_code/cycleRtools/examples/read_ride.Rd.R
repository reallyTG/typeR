library(cycleRtools)


### Name: read_ride
### Title: Read cycling device data.
### Aliases: read_fit read_pwx read_ride read_srm read_tcx

### ** Examples

## Not run: 
##D fl  <- system.file("extdata/example_files.tar.gz",
##D                    package = "cycleRtools")
##D fls <- untar(fl, list = TRUE)
##D untar(fl)  # Extract to working directory.
##D 
##D dat <- lapply(fls, read_ride, format = TRUE, CP = 300, sRPE = 5)
##D 
##D file.remove(fls)
## End(Not run)




