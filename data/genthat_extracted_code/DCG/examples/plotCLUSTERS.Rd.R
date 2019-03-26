library(DCG)


### Name: plotCLUSTERS
### Title: generate tree plots for each ensemble matrix 'plotCLUSTERS' plot
###   all cluster trees
### Aliases: plotCLUSTERS

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
plotCLUSTERS(EnsList = Ens_list, mfrow = c(2, 10), mar = c(1, 1, 1, 1))



