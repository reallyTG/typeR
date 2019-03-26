library(GOplot)


### Name: GOHeat
### Title: Displays heatmap of the relationship between genes and terms.
### Aliases: GOHeat

### ** Examples

## Not run: 
##D # Load the included dataset
##D data(EC)
##D 
##D # Generate the circ object
##D circ <- circle_dat(EC$david, EC$genelist)
##D 
##D # Generate the chord object
##D chord <- chord_dat(circ, EC$genes, EC$process)
##D 
##D # Create the plot with user-defined colors
##D GOHeat(chord, nlfc = 1, fill.col = c('red', 'yellow', 'green'))
## End(Not run)



