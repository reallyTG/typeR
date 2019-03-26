library(paramlink)


### Name: plotPedList
### Title: Plot a list of pedigrees.
### Aliases: plotPedList

### ** Examples



# Simplest use: Just give a list of linkdat objects. 
# To guess suitable plot window dimensions, use 'newdev=T'
peds = list(nuclearPed(3),cousinPed(2), singleton(12), halfCousinsPed(0))
plotPedList(peds, newdev=TRUE)

## Not run: 
##D # Modify the relative widths (which are not guessed) 
##D widths = c(2, 3, 1, 2)
##D plotPedList(peds, widths=widths)
##D 
##D # In most cases the guessed dimensions are not perfect. 
##D # Resize plot window manually, and then plot again with newdev=F (default)
##D # plotPedList(peds, widths=widths)
##D 
##D ## Remove frames
##D plotPedList(peds, widths=widths, frames=F)
##D 
##D # Non-default frames
##D frames = list(1, 2:3)
##D plotPedList(peds, widths=widths, frames=frames, frametitles=c('First', 'Second'))
##D 
##D # To give *the same* parameter to all plots, it can just be added at the end: 
##D margins=c(2,4,2,4)
##D title='Same title'
##D id.labels=''
##D symbolsize=1.5 # note: doesn't work as expected for singletons
##D plotPedList(peds, widths=widths, frames=frames, margins=margins, title=title, 
##D             id.labels=id.labels, symbolsize=symbolsize)
##D 
##D # For more control of individual plots, each plot and all its parameters 
##D # can be specified in its own list:
##D x1 = nuclearPed(3)
##D x1$available = 3:5
##D m1 = marker(x1, 3, 1:2)
##D marg1 = c(5,4,5,4)
##D plot1 = list(x1, marker=m1, margins=marg1, title='Plot 1', deceased=1:2)
##D 
##D x2 = cousinsPed(2)
##D x2$available = leaves(x2)
##D m2 = marker(x2, leaves(x2), 'A')
##D marg2 = c(3,4,2,4)
##D plot2 = list(x2, marker=m2, margins=marg2, title='Plot 2', symbolsize=1.2, 
##D              skip.empty.genotypes=T)
##D 
##D x3 = singleton(12)
##D x3 = setAvailable(x3, 12)
##D marg3 = c(10,0,0,0)
##D plot3 = list(x3, margins=marg3, title='Plot 3', available='shaded', symbolsize=2)
##D 
##D x4 = halfCousinsPed(0)
##D names4 = c(Father=1, Brother=3, Sister=5)
##D marg4 = marg1
##D plot4 = list(x4, margins=marg4, title='Plot 4', id.labels=names4)
##D 
##D plotPedList(list(plot1, plot2, plot3, plot4), widths=c(2,3,1,2), 
##D             frames=list(1,2:3,4), available=T, newdev=T)
##D 
##D # Different example:
##D plotPedList(list(halfCousinPed(4), cousinsPed(7)), title='Many generations', 
##D     new=T, dev.height=9, dev.width=9)
## End(Not run)




