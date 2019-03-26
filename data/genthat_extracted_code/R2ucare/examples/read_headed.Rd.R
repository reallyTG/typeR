library(R2ucare)


### Name: read_headed
### Title: Read capture-recapture data with Headed format used by program
###   E-SURGE
### Aliases: read_headed
### Keywords: package

### ** Examples

# read in Dipper dataset
dipper = system.file("extdata", "ed.txt", package = "R2ucare")
read_headed(dipper)
# read in Geese dataset
geese = system.file("extdata", "geese.txt", package = "R2ucare")
read_headed(geese)



