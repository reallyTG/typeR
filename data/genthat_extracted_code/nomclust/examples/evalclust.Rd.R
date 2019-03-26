library(nomclust)


### Name: evalclust
### Title: Evaluation of the Clustering
### Aliases: evalclust

### ** Examples

#sample data
data(data20)
#creation of a dataset with cluster memberships
data_clu <- nomclust(data20, iof, clu_high = 7)
#binding an original dataset to cluster memberships variables
data_clu2 <- cbind(data20, data_clu$mem)
#evaluation of created clusters
evaluation <- evalclust(data_clu2, 5, clu_high = 7)




