library(R2ucare)


### Name: overall_JMV
### Title: Overall goodness-of-fit test for the Jolly-Move model
### Aliases: overall_JMV
### Keywords: package

### ** Examples

## Not run: 
##D # read in Geese dataset
##D library(RMark)
##D geese = system.file("extdata", "geese.inp", package = "R2ucare")
##D geese = convert.inp(geese)
##D 
##D geese.hist = matrix(as.numeric(unlist(strsplit(geese$ch, ''))),nrow=nrow(geese),byrow=TRUE)
##D geese.freq = geese$freq
##D 
##D # encounter histories and number of individuals with corresponding histories
##D X = geese.hist
##D freq = geese.freq
##D 
##D # load R2ucare package
##D library(R2ucare)
##D 
##D # perform overall gof test
##D overall_JMV(X, freq)
## End(Not run)



