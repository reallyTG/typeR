library(networktools)


### Name: bridge
### Title: Bridge Centrality
### Aliases: bridge

### ** Examples

## No test: 
graph1 <- qgraph::EBICglasso(cor(depression), n=dim(depression)[1])
graph2 <- IsingFit::IsingFit(social)$weiadj

b <- bridge(graph1, communities=c('1','1','2','2','2','2','1','2','1'))
b
b2 <- bridge(graph2, communities=c(rep('1',8), rep('2',8)))
b2

plot(b)
plot(b2, order="value", zscore=TRUE, include=c("Bridge Strength", "Bridge Betweenness"))

## End(No test)



