library(DCG)


### Name: getEnsList
### Title: generating a list of ensemble matrices based on the similarity
###   matrix and temperatures
### Aliases: getEnsList

### ** Examples

symmetricMatrix <- as.symmetricAdjacencyMatrix(monkeyGrooming, weighted = TRUE, rule = "weak")
Sim <- as.SimilarityMatrix(symmetricMatrix)
temperatures <- temperatureSample(start = 0.01, end = 20, n = 20, method = 'random')
## Not run: 
##D # Note: It takes a while to run the getEnsList example.
##D Ens_list <- getEnsList(Sim, temperatures, MaxIt = 1000, m = 5)
## End(Not run)
## Don't show: 
# for CRAN check only
Ens_list <- getEnsList(Sim, temperatures, MaxIt = 5, m = 5)
## End(Don't show)




