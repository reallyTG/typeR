library(abf2)


### Name: split.abf2
### Title: Split an 'abf2' trace on tag boundaries.
### Aliases: split.abf2

### ** Examples

## Not run: 
##D # load an ABF file
##D ab <- abfload()
##D 
##D # split the 2nd channel
##D abx <- split(ab, adc=2)
##D 
##D # plot the first segment
##D plot(abx[[1]])
## End(Not run)



