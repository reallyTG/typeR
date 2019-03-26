library(network)


### Name: plotArgs.network
### Title: Expand and transform attributes of networks to values
###   appropriate for aguments to plot.network
### Aliases: plotArgs.network

### ** Examples

  net<-network.initialize(3)
  set.vertex.attribute(net,'color',c('red','green','blue'))
  set.vertex.attribute(net,'charm',1:3)
  # replicate a single colorname value
  plotArgs.network(net,'vertex.col','purple')
  # map the 'color' attribute to color
  plotArgs.network(net,'vertex.col','color')
  # similarly for a numeric attribute ...
  plotArgs.network(net,'vertex.cex',12)
  plotArgs.network(net,'vertex.cex','charm')



