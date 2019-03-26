library(adamethods)


### Name: do_ada
### Title: Run the whole classical archetypoid analysis with the Frobenius
###   norm
### Aliases: do_ada

### ** Examples

library(Anthropometry)
data(mtcars)
#data <- as.matrix(mtcars)
data <- mtcars

k <- 3
numRep <- 2
huge <- 200

preproc <- preprocessing(data, stand = TRUE, percAccomm = 1)
set.seed(2018)
res_ada <- do_ada(preproc$data, k, numRep, huge, FALSE, method = "adjbox")
str(res_ada)     

res_ada1 <- do_ada(preproc$data, k, numRep, huge, FALSE, 
                   vect_tol = c(0.95, 0.9, 0.85), alpha = 0.05, 
                   outl_degree = c("outl_strong", "outl_semi_strong", 
                                   "outl_moderate"), method = "toler")
str(res_ada1) 
                 



