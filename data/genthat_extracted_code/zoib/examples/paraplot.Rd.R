library(zoib)


### Name: paraplot
### Title: visual display of the posterior inferences of the parameters
###   from a zoib model
### Aliases: paraplot

### ** Examples

  ## Not run: 
##D   set.seed(12) 
##D   x=rnorm(4); para1 = cbind(x, x-1,x+1); rownames(para1) = c("a","b","c","d")
##D   x=rnorm(4)+1; para2 = cbind(x, x-1,x+1); rownames(para2) = c("a","b","e","f")
##D   x=rnorm(3)+2; para3 = cbind(x, x-1,x+1); rownames(para3) = c("a","b","d")
##D   paraplot(para1, para2, para3, para4=NULL, legpos=c(-1.5,6),
##D             legtext=c("model 1","model 2","model 3"),annotate=TRUE)
##D   paraplot(para1, legpos=c(-2,3), legtext="m1", annotate=TRUE)
##D 	
## End(Not run)



