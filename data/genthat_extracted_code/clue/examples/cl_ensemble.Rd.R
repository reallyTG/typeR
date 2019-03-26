library(clue)


### Name: cl_ensemble
### Title: Cluster Ensembles
### Aliases: cl_ensemble as.cl_ensemble is.cl_ensemble
### Keywords: cluster

### ** Examples

d <- dist(USArrests)
hclust_methods <-
    c("ward", "single", "complete", "average", "mcquitty")
hclust_results <- lapply(hclust_methods, function(m) hclust(d, m))
names(hclust_results) <- hclust_methods 
## Now create an ensemble from the results.
hens <- cl_ensemble(list = hclust_results)
hens
## Subscripting.
hens[1 : 3]
## Replication.
rep(hens, 3)
## Plotting.
plot(hens, main = names(hens))
## And continue to analyze the ensemble, e.g.
round(cl_dissimilarity(hens, method = "gamma"), 4)



