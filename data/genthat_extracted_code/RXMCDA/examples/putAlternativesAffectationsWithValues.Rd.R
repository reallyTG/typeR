library(RXMCDA)


### Name: putAlternativesAffectationsWithValues
### Title: Puts alternative affectations with values
### Aliases: putAlternativesAffectationsWithValues
### Keywords: methods

### ** Examples

alternativesIDs <-  c("a01", "a02", "a03", "a04")
categoriesIDs <- c("c01", "c02", "c03")
altAff = rbind(c(1, 2, 0.1),
      c(1, 3, 0.0),
      c(2, 3, 1.0),
      c(4, 1, 0.5))

tree = newXMLDoc()

newXMLNode("xmcda:XMCDA", 
           namespace = c("xsi" = "http://www.w3.org/2001/XMLSchema-instance", 
           "xmcda" = "http://www.decision-deck.org/2009/XMCDA-2.1.0"), 
           parent=tree)
     
putAlternativesAffectationsWithValues(tree, altAff, alternativesIDs, categoriesIDs)




