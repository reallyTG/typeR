library(m2r)


### Name: m2_matrix
### Title: Create a new matrix in Macaulay2
### Aliases: m2_matrix m2_matrix. m2_numrows m2_numcols m2_length
###   print.m2_matrix print.m2_image m2_kernel m2_kernel.

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D ##### basic usage
##D ########################################
##D 
##D (mat <- m2_matrix(matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2))
##D m2_matrix(matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2))
##D 
##D m2_name(mat)
##D m2(m2_name(mat))
##D m2(sprintf("class(%s)", m2_name(mat)))
##D (mat <- m2_matrix.(matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2)))
##D 
##D ##### known issues
##D ########################################
##D 
##D ring("x", "y", "z", coefring = "QQ")
##D mat <- matrix(mp(c("x","y","x+y","y-2","x-3","y-z")), nrow = 2, ncol = 3)
##D m2_matrix(mat, code = TRUE)
##D m2_matrix(mat)
##D # the above is an mpoly problem, not a m2r problem
##D # mpoly does not have a data structure for matrices (as of 12/2016)
##D 
##D mat_chars <- sapply(m2_matrix(mat), print, silent = TRUE)
##D dim(mat_chars) <- c(2, 3)
##D mat_chars
##D 
##D 
##D m2_numrows(mat)
##D m2_numcols(mat)
##D m2_parse(mat)
##D 
##D (mat <- m2_matrix(matrix(c(1,2),nrow=1)))
##D m2_kernel(mat)
##D 
## End(Not run)



