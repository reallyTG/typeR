library(BigQuic)


### Name: BigQuic
### Title: Big Quadratic Inverse Covariance Estimation
### Aliases: BigQuic
### Keywords: BigQUIC package covariance regularization graphical model
###   lasso Newton coordinate descent

### ** Examples

lambda <- 0.91
exampleResult <- BigQuic(inputFileName = paste(path.package("BigQuic"), 
                         "/extdata/testInput", sep = ""), 
                         outputFileName = tempfile(pattern = 
                         "BigQuic_output_matrix", fileext = ".Bmat"),
                         lambda = lambda, numthreads = 1, memory_size = 512, 
                         seed = 1, use_ram = TRUE)
BigQuic.select(exampleResult)
plot(exampleResult)
exampleResult$cleanFiles()
## Not run: 
##D If you have the hdi package installed: 
##D library(hdi)
##D data(riboflavin)
##D lambda <- seq(from = 0.9, to = 0.99, by = 0.01)
##D exampleResult <- BigQuic(as.matrix(riboflavin), lambda = lambda, 
##D                          numthreads = 1, memory_size = 512, seed = 1, 
##D                          use_ram = TRUE)
##D BigQuic.select(exampleResult)
##D plot(exampleResult)
## End(Not run)



