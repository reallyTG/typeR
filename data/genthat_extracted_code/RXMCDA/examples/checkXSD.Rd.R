library(RXMCDA)


### Name: checkXSD
### Title: XMCDA tree validation.
### Aliases: checkXSD
### Keywords: methods

### ** Examples

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

root<-getNodeSet(tree, "/xmcda:XMCDA")

criteria<-newXMLNode("criteria", parent=root[[1]], namespace=c())

criterion<-newXMLNode("criterion",attrs = c(id="g1"), 
                        parent=criteria, namespace=c())

y<-checkXSD(tree)



