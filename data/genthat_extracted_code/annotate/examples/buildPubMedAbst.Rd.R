library(annotate)


### Name: buildPubMedAbst
### Title: A function to generate an instantiation of a pubMedAbst class
### Aliases: buildPubMedAbst
### Keywords: utilities

### ** Examples

   x <- pubmed("9695952","8325638","8422497")
   a <- xmlRoot(x)
   numAbst <- length(xmlChildren(a))
   absts <- list()
   for (i in 1:numAbst) {
      absts[[i]] <- buildPubMedAbst(a[[i]])
   }




