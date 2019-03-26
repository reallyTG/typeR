library(cherry)


### Name: hommel class
### Title: Class "hommel" for storing the adjusted p-values of Hommel's
###   multiple testing method.
### Aliases: hommel hommel-class pvalue,hommel-method
### Keywords: methods

### ** Examples

  
  #Generate a vector of pvalues
  set.seed(1)
  n <- 1000
  pvalues <- c(runif(0.50*n,0,0.001), runif(0.50*n,0,1))
  
  #Create an hommel object in which the adjusted p-values are stored, based on a Simes'test
  #(or Hommel's test, by choosing simes = FALSE):
  hom <- hommelFast(pvalues, simes = TRUE)
  
  #To check how many of the hypotheses within a certain subset have to be false with 95% 
  #confidence, the pickSimes function can be used. If no subset is selected, the whole set of
  #hypotheses is used.  
  pickSimes(hom, alpha=0.05, silent=FALSE)
  
  #The same can be done for any subset, for example the first 10 hypotheses: 
  pickSimes(hom, select=1:10, alpha=0.05, silent=FALSE)
  
  #A plot can be made that displays the results of pickSimes (i.e. the lower confidence bounds)
  #but for selecting only the first 1,2,3,.... hypotheses from the selected set.
  curveSimes(hom, select=1:10, alpha=0.05, plot=FALSE)
    



