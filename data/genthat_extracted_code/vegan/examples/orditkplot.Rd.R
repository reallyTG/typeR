library(vegan)


### Name: orditkplot
### Title: Ordination Plot with Movable Labels
### Aliases: orditkplot plot.orditkplot scores.orditkplot points.orditkplot
###   text.orditkplot
### Keywords: iplot dynamic

### ** Examples

## The example needs user interaction and is not executed directly.
## It should work when pasted to the window.
## Not run: 
##D data(varespec)
##D ord <- cca(varespec)
##D ## Do something with the graph and end by clicking "Dismiss"
##D orditkplot(ord, mar = c(4,4,1,1)+.1, font=3)
##D ## Use ordipointlabel to produce a plot that has both species and site
##D ## scores in different colors and plotting symbols
##D pl <- ordipointlabel(ord)
##D orditkplot(pl)
## End(Not run)



