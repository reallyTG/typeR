library(bibliometrix)


### Name: normalizeSimilarity
### Title: Calculate similarity indices
### Aliases: normalizeSimilarity

### ** Examples


data(scientometrics)
NetMatrix <- biblioNetwork(scientometrics, analysis = "co-occurrences", 
              network = "keywords", sep = ";")
S=normalizeSimilarity(NetMatrix, type = "association")




