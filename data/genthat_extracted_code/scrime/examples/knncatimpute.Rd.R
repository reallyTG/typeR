library(scrime)


### Name: knncatimpute
### Title: Missing Value Imputation with kNN
### Aliases: knncatimpute
### Keywords: classif NA

### ** Examples
## Not run: 
##D # Generate a data set consisting of 200 rows and 50 columns
##D # in which the values are integers between 1 and 3.
##D # Afterwards, remove 20 of the values randomly.
##D 
##D mat <- matrix(sample(3, 10000, TRUE), 200)
##D mat[sample(10000, 20)] <- NA
##D 
##D # Replace the missing values.
##D 
##D mat2 <- knncatimpute(mat)
##D 
##D # Replace the missing values using the 5 nearest neighbors
##D # and Cohen's Kappa.
##D 
##D mat3 <- knncatimpute(mat, nn = 5, dist = "cohen")
##D 
## End(Not run)


