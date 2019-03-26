library(bibliometrix)


### Name: localCitations
### Title: Author local citations
### Aliases: localCitations

### ** Examples

 
data(scientometrics)

CR <- localCitations(scientometrics, sep = ";")

CR$Authors[1:10,]
CR$Papers[1:10,]




