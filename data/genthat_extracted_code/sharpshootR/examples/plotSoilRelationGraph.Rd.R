library(sharpshootR)


### Name: plotSoilRelationGraph
### Title: Plot a component relation graph
### Aliases: plotSoilRelationGraph
### Keywords: hplot

### ** Examples

# load sample data set
data(amador)

# create weighted adjacency matrix (see ?component.adj.matrix for details)
m <- component.adj.matrix(amador)

# plot network diagram, with Amador soil highlighted
plotSoilRelationGraph(m, s='amador')

# dendrogram representation
plotSoilRelationGraph(m, s='amador', plot.style='dendrogram')

# compare methods
m.o <- component.adj.matrix(amador, method='occurrence')

par(mfcol=c(1,2))
plotSoilRelationGraph(m, s='amador', plot.style='dendrogram')
title('community matrix')
plotSoilRelationGraph(m.o, s='amador', plot.style='dendrogram')
title('occurence')

# investigate max spanning tree
plotSoilRelationGraph(m, spanning.tree='max')

# investigate max spanning tree + edges with weights > 75-th pctile
plotSoilRelationGraph(m, spanning.tree=0.75)

## Not run: 
##D # get similar data from soilweb, for the Pardee series
##D s <- 'pardee'
##D u <- url(URLencode(paste(
##D 'http://casoilresource.lawr.ucdavis.edu/soil_web/reflector_api/soils.php?',
##D 'what=soil_series_component_query&q_string=', s, sep='')))
##D 
##D # fetch data
##D d <- read.table(u, sep='|', header=TRUE, stringsAsFactors=FALSE)
##D 
##D # normalize component names
##D d$compname <- tolower(d$compname)
##D 
##D # keep only major components
##D d <- subset(d, subset=compkind == 'Series')
##D 
##D # build adj. matrix and plot
##D m <- component.adj.matrix(d)
##D plotSoilRelationGraph(m, s=s, plot.style='dendrogram')
##D 
##D # alter plotting style, see ?plot.phylo
##D plotSoilRelationGraph(m, s=s, plot.style='dendrogram', type='fan')
##D plotSoilRelationGraph(m, s=s, plot.style='dendrogram', type='unrooted', use.edge.length=FALSE)
## End(Not run)



