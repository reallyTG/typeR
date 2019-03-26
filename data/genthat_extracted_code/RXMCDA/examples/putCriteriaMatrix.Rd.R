library(RXMCDA)


### Name: putCriteriaMatrix
### Title: Puts values in a criteria matrix
### Aliases: putCriteriaMatrix
### Keywords: methods

### ** Examples

critIDs <- c("x","y","z")

criteriaMatrix <- rbind(c(1,2,3),c(4,5,6),c(7,8,9))

rownames(criteriaMatrix) <- critIDs
colnames(criteriaMatrix) <- critIDs

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)

putCriteriaMatrix(tree,criteriaMatrix)



