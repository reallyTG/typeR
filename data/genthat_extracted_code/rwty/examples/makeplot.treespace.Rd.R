library(rwty)


### Name: makeplot.treespace
### Title: Plot chains in treespace.
### Aliases: makeplot.treespace
### Keywords: plot, rwty treespace,

### ** Examples

## Not run: 
##D data(fungus)
##D 
##D p <- makeplot.treespace(fungus, burnin = 20, fill.color = 'LnL')
##D # Treespace plot for all the fungus data
##D 
##D # NB: these data indicate significant problems: the chains are sampling very 
##D # different parts of tree space.
##D #
##D # View the points plotted in treespace (these data indicate significant problems)
##D p$treespace.points.plot
##D 
##D # View the heatmap of the same data
##D # Note that this data is so pathologically bad that the heatmap is not
##D # very useful. It is more useful on better behaved datasets
##D p$treespace.heatmap
##D 
##D # we can also plot different parameters as the fill colour.
##D # e.g. we can plot the first two fungus chains with likelihood as the fill
##D makeplot.treespace(fungus[1:2], burnin = 100, fill.color = 'LnL')
##D 
##D # or with tree length as the fill
##D makeplot.treespace(fungus[1:2], burnin = 100, fill.color = 'TL')
##D 
##D # you can colour the plot with any parameter in your ptable
##D # to see which parameters you have you can simply do this:
##D names(fungus[[1]]$ptable)
## End(Not run)



