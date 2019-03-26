library(R2ucare)


### Name: testMltec
### Title: TestM.LTEC
### Aliases: testMltec
### Keywords: package

### ** Examples

## Not run: 
##D # Read in Geese dataset:
##D geese = system.file("extdata", "geese.inp", package = "R2ucare")
##D geese = read_inp(geese)
##D 
##D # Get encounter histories and number of individuals with corresponding histories
##D geese.hist = geese$encounter_histories
##D geese.freq = geese$sample_size
##D 
##D # perform TestM.LTEC
##D testMltec(geese.hist, geese.freq)
## End(Not run)



