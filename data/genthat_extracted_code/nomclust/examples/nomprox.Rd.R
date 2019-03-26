library(nomclust)


### Name: nomprox
### Title: Nominal Clustering based on a Proximity Matrix
### Aliases: nomprox

### ** Examples

#sample data
data(data20)
#computation of a proximity matrix using the iof similarity measure
matrix <- iof(data20)
#creation of a dataset with cluster memberships
hca <- nomprox(data20, matrix, clu_high = 5, method = "complete")
#getting evaluation statistics
eval <- hca$eval
#getting cluster membership variables
mem <- hca$mem 




