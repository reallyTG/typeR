library(idm)


### Name: add_es
### Title: Adds two eigenspaces using block-wise incremental SVD (with or
###   without mean update)
### Aliases: add_es

### ** Examples


## Example 1 - eigenspace merge (Hall et al., 2002)
#Iris species
data("iris", package = "datasets")
X = iris[,-5]
#obtain two eigenspaces
eg = do_es(X[1:50, ])
eg2 = do_es(X[c(51:150), ])
#add the two eigenspaces keeping track of the data mean
eg12 = add_es(method = "esm", eg, eg2)
#equivalent to the SVD of the mean-centered data (svd(scale(X, center = TRUE,scale = FALSE)))

## Example 2 - block-wise incremental SVD with mean update, full rank (Ross et al., 2008)
data("iris", package = "datasets")
# obtain the eigenspace of the first 50 Iris species
X = iris[,-5]
eg = do_es(X[1:50, ])
#update the eigenspace of the remaining species to
eg_new = add_es(method = "isvd", eg, data.matrix(X[c(51:150), ]))
#equivalent to the SVD of the mean-centered data (svd(scale(X, center = TRUE, scale = FALSE)))

##Example 3 - incremental SVD with mean update, 2d approximation (Ross et al., 2008)
data("iris", package = "datasets")
# obtain the eigenspace of the first 50 Iris species
X = iris[,-5]
eg = do_es(X[1:50, ])
#update the eigenspace of the remaining species to
eg = add_es(method = "isvd", eg, data.matrix(X[c(51:150), ]),current_rank = 2)
#similar to PCA on the covariance matrix of X (SVD of the mean-centered data)




