library(factoextra)


### Name: get_clust_tendency
### Title: Assessing Clustering Tendency
### Aliases: get_clust_tendency

### ** Examples

data(iris)

# Clustering tendency
gradient_col = list(low = "steelblue", high = "white")
get_clust_tendency(iris[,-5], n = 50, gradient = gradient_col)
   
# Random uniformly distributed dataset
# (without any inherent clusters)
set.seed(123)
random_df <- apply(iris[, -5], 2, 
                   function(x){runif(length(x), min(x), max(x))}
                   )
get_clust_tendency(random_df, n = 50, gradient = gradient_col)




