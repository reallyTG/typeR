library(cherry)


### Name: hommelFast
### Title: Calculates adjusted p-values of Hommel's method efficiently.
### Aliases: hommelFast

### ** Examples

  
  #Generate a vector of pvalues
  set.seed(1)
  n <- 1000
  pvalues <- c(runif(0.50*n,0,0.001), runif(0.50*n,0,1))
  
  #Create an hommel object in which the adjusted p-values are stored, based on a Simes'test
  #(or Hommel's test, by choosing simes = FALSE):
  hom <- hommelFast(pvalues, simes = TRUE)
  
  #Retrieve the first 10 adjusted p-values by using the \code{pvalue} method. 
  pvalue(hom,1:10)
  
  



