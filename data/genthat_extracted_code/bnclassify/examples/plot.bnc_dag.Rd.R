library(bnclassify)


### Name: plot.bnc_dag
### Title: Plot the structure.
### Aliases: plot.bnc_dag

### ** Examples

 

# Requires the graph and Rgraphviz packages to be installed.
data(car)
nb <- nb('class', car)
nb <- nb('class', car)
## Not run: plot(nb)
## Not run: plot(nb, fontsize = 20)
## Not run: plot(nb, layoutType = 'circo')
## Not run: plot(nb, layoutType = 'fdp')
## Not run: plot(nb, layoutType = 'osage')
## Not run: plot(nb, layoutType = 'twopi')
## Not run: plot(nb, layoutType = 'neato')



