library(adamethods)


### Name: adalara_no_paral
### Title: Multivariate non-parallel archetypoid algorithm for large
###   applications (ADALARA)
### Aliases: adalara_no_paral

### ** Examples

## Not run: 
##D library(Anthropometry)
##D 
##D # Load data:
##D data(mtcars)
##D data <- mtcars
##D n <- nrow(data)
##D 
##D # Arguments for the archetype/archetypoid algorithm:
##D # Number of archetypoids:
##D k <- 3 
##D numRep <- 2
##D huge <- 200
##D 
##D # Size of the random sample of observations:
##D m <- 10
##D # Number of samples:
##D N <- floor(1 + (n - m)/(m - k))
##D N
##D            
##D prob <- 0.75            
##D 
##D # ADALARA algorithm:
##D preproc <- preprocessing(data, stand = TRUE, percAccomm = 1)
##D data1 <- as.data.frame(preproc$data)
##D res_adalara <- adalara_no_paral(data1, 1, N, m, k, 
##D                                 numRep, huge, prob, "ada_rob", FALSE, TRUE, 
##D                                 method = "adjbox", frame = FALSE)
##D 
##D # Examine the results:
##D res_adalara
##D 
##D res_adalara1 <- adalara_no_paral(data1, 1, N, m, k, 
##D                                 numRep, huge, prob, "ada_rob", FALSE, TRUE, 
##D                                 vect_tol = c(0.95, 0.9, 0.85), 
##D                                 alpha = 0.05, outl_degree = c("outl_strong", "outl_semi_strong", 
##D                                                               "outl_moderate"),
##D                                 method = "toler", frame = FALSE)
##D res_adalara1                                 
##D                                  
## End(Not run)
                                                                                                                                                             



