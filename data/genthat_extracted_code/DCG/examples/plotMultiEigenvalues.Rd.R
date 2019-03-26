library(DCG)


### Name: plotMultiEigenvalues
### Title: plot eigenvalues 'plotMultiEigenvalues' plot eigenvalues to
###   determine number of communities by finding the elbow point
### Aliases: plotMultiEigenvalues

### ** Examples

symmetricMatrix <- as.symmetricAdjacencyMatrix(monkeyGrooming, weighted = TRUE, rule = "weak")
Sim <- as.SimilarityMatrix(symmetricMatrix)
temperatures <- temperatureSample(start = 0.01, end = 20, n = 20, method = 'random')
## Not run: 
##D # for illustration only. skip CRAN check because it ran forever.
##D Ens_list <- getEnsList(Sim, temperatures, MaxIt = 1000, m = 5)
## End(Not run)
## Don't show: 
# for CRAN check only
Ens_list <- getEnsList(Sim, temperatures, MaxIt = 5, m = 5)
## End(Don't show)

plotMultiEigenvalues(Ens_list = Ens_list, mfrow = c(10, 2), mar = c(1, 1, 1, 1))




