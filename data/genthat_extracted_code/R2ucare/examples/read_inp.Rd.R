library(R2ucare)


### Name: read_inp
### Title: Read capture-recapture data with Input (.inp) format used by
###   program MARK
### Aliases: read_inp
### Keywords: package

### ** Examples

# read in Dipper dataset
dipper = system.file("extdata", "ed.inp", package = "R2ucare")
read_inp(dipper,group.df=data.frame(sex=c('Male','Female')))
# read in Geese dataset
geese = system.file("extdata", "geese.inp", package = "R2ucare")
read_inp(geese)



