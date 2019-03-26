library(scrime)


### Name: predict.pamCat
### Title: Predict Method for pamCat Objects
### Aliases: predict.pamCat
### Keywords: classif

### ** Examples
## Not run: 
##D # Generate a data set consisting of 2000 rows (variables) and 50 columns.
##D # Assume that the first 25 observations belong to class 1, and the other
##D # 50 observations to class 2.
##D 
##D mat <- matrix(sample(3, 100000, TRUE), 2000)
##D rownames(mat) <- paste("SNP", 1:2000, sep = "")
##D cl <- rep(1:2, e = 25)
##D 
##D # Apply PAM for categorical data to this matrix, and compute the
##D # misclassification rate on the training set, i.e. on mat.
##D 
##D pam.out <- pamCat(mat, cl)
##D pam.out
##D 
##D # Now generate a new data set consisting of 20 observations, 
##D # and predict the classes of these observations using the
##D # value of theta that has led to the smallest misclassification
##D # rate in pam.out.
##D 
##D mat2 <- matrix(sample(3, 40000, TRUE), 2000)
##D rownames(mat2) <- paste("SNP", 1:2000, sep = "")
##D predict(pam.out, mat2)
##D 
##D # Another theta, say theta = 4, can also be specified.
##D 
##D predict(pam.out, mat2, theta = 4)
##D 
##D # The class probabilities for each observation can be obtained by
##D 
##D predict(pam.out, mat2, theta = 4, type = "prob") 
##D 
## End(Not run)


