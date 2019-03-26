library(adamethods)


### Name: adalara
### Title: Multivariate parallel archetypoid algorithm for large
###   applications (ADALARA)
### Aliases: adalara

### ** Examples

## Not run: 
##D library(Anthropometry)
##D library(doParallel)
##D 
##D # Prepare parallelization (including the seed for reproducibility):
##D no_cores <- detectCores() - 1
##D cl <- makeCluster(no_cores)
##D registerDoParallel(cl)
##D clusterSetRNGStream(cl, iseed = 1)
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
##D 
##D adalara_aux <- adalara(data1, N, m, k, numRep, huge, prob, 
##D                        "ada_rob", FALSE, method = "adjbox", frame = FALSE)
##D 
##D #adalara_aux <- adalara(data1, N, m, k, numRep, huge, prob, 
##D #                       "ada_rob", FALSE, vect_tol = c(0.95, 0.9, 0.85), alpha = 0.05, 
##D #                       outl_degree = c("outl_strong", "outl_semi_strong", "outl_moderate"),
##D #                       method = "toler", frame = FALSE)
##D 
##D # Take the minimum RSS, which is in the second position of every sublist:
##D adalara <- adalara_aux[which.min(unlist(sapply(adalara_aux, function(x) x[2])))][[1]]
##D adalara
##D 
##D # End parallelization:
##D stopCluster(cl)
## End(Not run)




