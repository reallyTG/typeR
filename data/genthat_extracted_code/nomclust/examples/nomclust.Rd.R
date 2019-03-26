library(nomclust)


### Name: nomclust
### Title: Nominal Clustering
### Aliases: nomclust

### ** Examples

#sample data
data(data20)
hca <- nomclust(data20, iof, method = "average", clu_high = 5, prox = TRUE)
#getting evaluation statistics
eval <- hca$eval
#getting cluster membership variables
mem <- hca$mem
#getting a proximity matrix
prox <- hca$prox




