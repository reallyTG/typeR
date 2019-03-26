library(riskclustr)


### Name: optimal_kmeans_d
### Title: Obtain optimal D solution based on k-means clustering of disease
###   marker data in a case-control study
### Aliases: optimal_kmeans_d

### ** Examples

## No test: 
# Cluster 30 disease markers to identify the optimally
# etiologically heterogeneous 3-subtype solution
res <- optimal_kmeans_d(
  markers = c(paste0("y", seq(1:30))),
  M = 3,
  factors = list("x1", "x2", "x3"),
  case = "case",
  data = subtype_data,
  nstart = 100,
  seed = 81110224
)

# Look at the value of D for the optimal D solution
res[["optimal_d"]]

# Look at a table of the optimal D solution
table(res[["optimal_d_data"]]$optimal_d_label)
## End(No test)




