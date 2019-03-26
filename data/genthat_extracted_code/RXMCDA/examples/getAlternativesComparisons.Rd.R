library(RXMCDA)


### Name: getAlternativesComparisons
### Title: Get comparisons of alternatives
### Aliases: getAlternativesComparisons
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

aC<-newXMLNode("alternativesComparisons", parent=root[[1]] , namespace=c())

pairs<-newXMLNode("pairs", parent=aC, namespace=c())
pair<-newXMLNode("pair", parent=pairs, namespace=c())

initial<-newXMLNode("initial", parent=pair)
newXMLNode("alternativeID", "a01", parent=initial, namespace=c())

terminal<-newXMLNode("terminal", parent=pair, namespace=c())
newXMLNode("alternativeID", "a02", parent=terminal, namespace=c())

value<-newXMLNode("value", parent=pair, namespace=c())
newXMLNode("real", "0.5", parent=value, namespace=c())

alternativesIDs <- c("a01","a02")
criteriaIDs <- c("g1","g2")

performance.table<-matrix(nrow=length(alternativesIDs),
                          ncol=length(criteriaIDs),
                          dimnames = list(alternativesIDs,criteriaIDs))

for (i in 1:length(alternativesIDs)){
  for (j in 1:length(criteriaIDs)){
    performance.table[i,j] = runif(1)
  }
}

y<-getNodeSet(tree,"//alternativesComparisons")

x<-getAlternativesComparisons(y[[1]], performance.table)



