library(polmineR)


### Name: as.TermDocumentMatrix
### Title: Generate TermDocumentMatrix / DocumentTermMatrix.
### Aliases: as.TermDocumentMatrix as.DocumentTermMatrix
###   as.TermDocumentMatrix,character-method
###   as.DocumentTermMatrix,character-method
###   as.TermDocumentMatrix,bundle-method
###   as.DocumentTermMatrix,bundle-method
###   as.TermDocumentMatrix,partition_bundle-method
###   as.DocumentTermMatrix,partition_bundle-method
###   as.DocumentTermMatrix,context-method
###   as.TermDocumentMatrix,context-method

### ** Examples

use("polmineR")
 
# do-it-yourself 
p <- partition("GERMAPARLMINI", date = ".*", regex = TRUE)
pB <- partition_bundle(p, s_attribute = "date")
pB <- enrich(pB, p_attribute="word")
tdm <- as.TermDocumentMatrix(pB, col = "count")
   
 # leave the counting to the as.TermDocumentMatrix-method
pB2 <- partition_bundle(p, s_attribute = "date")
tdm <- as.TermDocumentMatrix(pB2, p_attribute = "word", verbose = TRUE)
   
# diretissima
tdm <- as.TermDocumentMatrix("GERMAPARLMINI", p_attribute = "word", s_attribute = "date")



