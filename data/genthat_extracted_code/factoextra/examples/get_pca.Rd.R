library(factoextra)


### Name: get_pca
### Title: Extract the results for individuals/variables - PCA
### Aliases: get_pca get_pca_ind get_pca_var

### ** Examples

## No test: 
# Principal Component Analysis
# +++++++++++++++++++++++++++++
 data(iris)
 res.pca <- prcomp(iris[, -5],  scale = TRUE)
 # Extract the results for individuals
 ind <- get_pca_ind(res.pca)
 print(ind)
 head(ind$coord) # coordinates of individuals
 head(ind$cos2) # cos2 of individuals
 head(ind$contrib) # contributions of individuals
 
 # Extract the results for variables
 var <- get_pca_var(res.pca)
 print(var)
 head(var$coord) # coordinates of variables
 head(var$cos2) # cos2 of variables
 head(var$contrib) # contributions of variables
 
 # You can also use the function get_pca()
 get_pca(res.pca, "ind") # Results for individuals
 get_pca(res.pca, "var") # Results for variable categories
 
## End(No test)



