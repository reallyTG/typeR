library(GOplot)


### Name: GOCircle
### Title: Circular visualization of the results of a functional analysis.
### Aliases: GOCircle

### ** Examples

## Not run: 
##D # Load the included dataset
##D data(EC)
##D 
##D # Building the circ object
##D circ <- circle_dat(EC$david, EC$genelist)
##D 
##D # Creating the circular plot
##D GOCircle(circ)
##D 
##D # Creating the circular plot with a different colour scale for the logFC
##D GOCircle(circ, lfc.col = c('purple', 'orange'))
##D 
##D # Creating the circular plot with a different colour scale for the z-score
##D GOCircle(circ, zsc.col = c('yellow', 'black', 'cyan'))
##D 
##D # Creating the circular plot with different font style
##D GOCircle(circ, label.size = 5, label.fontface = 'italic')
## End(Not run)



