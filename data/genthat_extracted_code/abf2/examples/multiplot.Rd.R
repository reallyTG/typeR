library(abf2)


### Name: multiplot
### Title: Plot multiple trace segments from an 'abf2' object.
### Aliases: multiplot

### ** Examples

## Not run: 
##D # load an abf file
##D ab <- abfload("yourfile.abf")
##D 
##D # assuming there are multiple tags in the file, plot
##D # the 2nd second of each tagged region of channel 2
##D multiplot(ab, adc=2, start=ab$tags$time + 1)
## End(Not run)



