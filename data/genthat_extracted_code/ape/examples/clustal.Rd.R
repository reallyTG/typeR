library(ape)


### Name: clustal
### Title: Multiple Sequence Alignment with External Applications
### Aliases: clustal clustalomega muscle tcoffee
### Keywords: manip

### ** Examples

## Not run: 
##D ### display the options:
##D clustal()
##D clustalomega()
##D muscle()
##D tcoffee()
##D 
##D data(woodmouse)
##D ### open gaps more easily:
##D clustal(woodmouse, pw.gapopen = 1, pw.gapext = 1)
##D ### T-Coffee requires negative values (quite slow; muscle() is much faster):
##D tcoffee(woodmouse,  MoreArgs = "-gapopen=-10 -gapext=-2")
## End(Not run)


