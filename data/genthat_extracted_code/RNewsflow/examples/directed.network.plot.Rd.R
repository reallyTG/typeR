library(RNewsflow)


### Name: directed.network.plot
### Title: A wrapper for plot.igraph for visualizing directed networks.
### Aliases: directed.network.plot

### ** Examples

data(docnet)
aggdocnet = network.aggregate(docnet, by='source')
directed.network.plot(aggdocnet, weight.var = 'to.Vprop', weight.thres = 0.2)



