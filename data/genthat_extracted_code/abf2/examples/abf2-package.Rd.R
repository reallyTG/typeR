library(abf2)


### Name: abf2-package
### Title: Load (gap-free) Axon ABF2 files
### Aliases: abf2-package abf2
### Keywords: package

### ** Examples

## Not run: 
##D # load an ABF file chosen through a standard file dialog
##D ab <- abfload()
##D 
##D # print a summary of the file contents
##D summary(ab)
##D 
##D # plot it with default options (full duration of first recorded channel)
##D plot(ab)
##D 
##D # plot the first 5 seconds of the second channel
##D plot(ab, adc=2, time=c(0,5))
## End(Not run)



