library(GOplot)


### Name: GOBubble
### Title: Bubble plot.
### Aliases: GOBubble

### ** Examples

## Not run: 
##D #Load the included dataset
##D data(EC)
##D 
##D #Building the circ object
##D circ <- circular_dat(EC$david, EC$genelist)
##D 
##D #Creating the bubble plot colouring the table entries according to the category
##D GOBubble(circ, table.col = T)
##D 
##D #Creating the bubble plot displaying the term instead of the ID and without the table
##D GOBubble(circ, ID = F, table.legend = F)
##D 
##D #Faceting the plot
##D GOBubble(circ, display = 'multiple')
## End(Not run)



