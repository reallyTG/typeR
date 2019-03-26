library(RNewsflow)


### Name: document.network.plot
### Title: Visualize (a subcomponent) of the document similarity network
### Aliases: document.network.plot

### ** Examples

data(docnet)
data(dtm)

docnet_comps = igraph::decompose.graph(docnet) # get subcomponents

# subcomponent 1
document.network.plot(docnet_comps[[1]]) 

# subcomponent 2 with wordcloud
document.network.plot(docnet_comps[[2]], dtm=dtm) 

# subcomponent 3 with additional arguments passed to plot.igraph 
document.network.plot(docnet_comps[[3]], dtm=dtm, vertex.color='red') 



