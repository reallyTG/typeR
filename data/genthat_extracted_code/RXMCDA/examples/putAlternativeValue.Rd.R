library(RXMCDA)


### Name: putAlternativeValue
### Title: Put a value related to an alternative
### Aliases: putAlternativeValue
### Keywords: methods

### ** Examples

altID <- c("x")

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

putAlternativeValue(tree,0.8,alternativesIDs = altID)



