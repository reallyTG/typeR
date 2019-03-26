library(RXMCDA)


### Name: putCriterionValue
### Title: Put a value related to a criterion
### Aliases: putCriterionValue
### Keywords: methods

### ** Examples

critID <- c("x")

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

putCriterionValue(tree,0.8,criteriaIDs = critID)



