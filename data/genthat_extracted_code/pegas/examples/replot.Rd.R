library(pegas)


### Name: replot
### Title: Edit the Layout of a Haplotype Network
### Aliases: replot
### Keywords: hplot

### ** Examples

## Not run: 
##D data(woodmouse)
##D net <- haploNet(haplotype(woodmouse))
##D plot(net)
##D o <- replot() # interactive
##D ## click to rearrange the network at will...
##D ## then do a different plot using the same coordinates:
##D plot(net, bg = "red", labels = FALSE, show.mutation = 2)
##D replot(o) # not interactive
## End(Not run)


