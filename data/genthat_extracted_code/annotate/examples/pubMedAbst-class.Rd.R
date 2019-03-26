library(annotate)


### Name: pubMedAbst-class
### Title: Class pubMedAbst, a class to handle PubMed abstracts, and
###   methods for processing them.
### Aliases: pubMedAbst-class pubMedAbst authors abstText articleTitle
###   journal pubDate pmid pubMedAbst,pubMedAbst-method
###   authors,pubMedAbst-method abstText,pubMedAbst-method
###   articleTitle,pubMedAbst-method journal,pubMedAbst-method
###   pubDate,pubMedAbst-method pmid,pubMedAbst-method
###   show,pubMedAbst-method
### Keywords: classes

### ** Examples

   x <- pubmed("9695952","8325638","8422497")
   a <- xmlRoot(x)
   numAbst <- length(xmlChildren(a))
   absts <- list()
   for (i in 1:numAbst) {
      absts[[i]] <- buildPubMedAbst(a[[i]])
   }



