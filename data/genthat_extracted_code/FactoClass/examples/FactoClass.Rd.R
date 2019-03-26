library(FactoClass)


### Name: FactoClass
### Title: Combination of Factorial Methods and Cluster Analysis
### Aliases: FactoClass print.FactoClass analisis.clus
### Keywords: multivariate cluster

### ** Examples


# Cluster analysis with Correspondence Analysis
data(ColorAdjective)
FC.col <-FactoClass(ColorAdjective, dudi.coa)
6
10
5

FC.col

FC.col$dudi


# Cluster analysis with Multiple Correspondence Analysis
data(DogBreeds)

DB.act <- DogBreeds[-7]  # active variables
DB.ilu <- DogBreeds[7]   # ilustrative variables

FC.db <-FactoClass( DB.act, dudi.acm, k.clust = 4,
                       scanFC = FALSE, dfilu = DB.ilu, nfcl = 10)

FC.db

FC.db$clus.summ
FC.db$indices




