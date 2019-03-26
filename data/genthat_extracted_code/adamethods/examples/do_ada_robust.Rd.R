library(adamethods)


### Name: do_ada_robust
### Title: Run the whole robust archetypoid analysis with the robust
###   Frobenius norm
### Aliases: do_ada_robust

### ** Examples

## Not run: 
##D library(Anthropometry)
##D data(mtcars)
##D #data <- as.matrix(mtcars)
##D data <- mtcars
##D 
##D k <- 3
##D numRep <- 2
##D huge <- 200
##D 
##D preproc <- preprocessing(data, stand = TRUE, percAccomm = 1)
##D set.seed(2018)
##D res_ada_rob <- do_ada_robust(preproc$data, k, numRep, huge, 0.8,
##D                              FALSE, method = "adjbox")
##D str(res_ada_rob)    
##D 
##D res_ada_rob1 <- do_ada_robust(preproc$data, k, numRep, huge, 0.8,
##D                              FALSE, vect_tol = c(0.95, 0.9, 0.85), alpha = 0.05, 
##D                              outl_degree = c("outl_strong", "outl_semi_strong", 
##D                                              "outl_moderate"),
##D                              method = "toler")
##D str(res_ada_rob1)  
## End(Not run)
                 



