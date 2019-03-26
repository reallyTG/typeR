library(scrime)


### Name: pamCat
### Title: Prediction Analysis of Categorical Data
### Aliases: pamCat print.pamCat
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
##D # Let's assume that the predicted classes are the real classes
##D # of the observations. Then, mat2 can also be used in pamCat
##D # to compute the misclassification rate. 
##D 
##D cl2 <- predict(pam.out, mat2)
##D pamCat(mat, cl, newdata = mat2, newcl = cl2)
##D 
## End(Not run)


