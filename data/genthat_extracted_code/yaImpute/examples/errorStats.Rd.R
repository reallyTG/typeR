library(yaImpute)


### Name: errorStats
### Title: Compute error components of k-NN imputations
### Aliases: errorStats
### Keywords: multivariate

### ** Examples


require (yaImpute)

data(TallyLake)

diag(cov(TallyLake[,1:8])) # see col A in Table 3 in Stage and Crookston

mal=yai(x=TallyLake[,9:29],y=TallyLake[,1:8],
        noTrgs=TRUE,method="mahalanobis")


msn=yai(x=TallyLake[,9:29],y=TallyLake[,1:8],
        noTrgs=TRUE,method="msn")


# variable "see" for "mal" matches col B (when squared and scaled)
# other columns don't match exactly as Stage and Crookston used different
# software to compute values

errorStats(mal,msn)




