library(RNewsflow)


### Name: network.aggregate
### Title: Aggregate the edges of a network by vertex attributes
### Aliases: network.aggregate

### ** Examples

data(docnet)
aggdocnet = network.aggregate(docnet, by='sourcetype')
igraph::get.data.frame(aggdocnet, 'both')

aggdocdf = network.aggregate(docnet, by.from='sourcetype', by.to='source', return.df = TRUE)
head(aggdocdf)



