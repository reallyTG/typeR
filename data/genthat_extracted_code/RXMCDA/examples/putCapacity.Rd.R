library(RXMCDA)


### Name: putCapacity
### Title: Put a capacity
### Aliases: putCapacity
### Keywords: methods

### ** Examples

library(kappalab)

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

mu<-capacity(0:15)

a <- Mobius(mu)

critIDs <- c("g1","g2","g3","g4")

putCapacity(tree, a, critIDs, mcdaConcept="capacity")



