library(mistral)


### Name: FORM
### Title: FORM method
### Aliases: FORM

### ** Examples
 
## Not run: 
##D  distribution = list()
##D  distribution[[1]] = list("gamma",c(2,1))
##D  distribution[[2]] = list("gamma",c(3,1))
##D  
##D  f <- function(X){
##D     X[1]/sum(X) - qbeta((1e-5),2,3)
##D  }
##D 
##D  res <- FORM(f, u.dep = c(0,0.1), inputDist = distribution, 
##D      N.calls = 1000, eps = 1e-7, Method = "HLRF", IS = "TRUE", 
##D      q = 0.1, copula = "unif")
##D                   
##D names(res)
##D print(res)
##D print(res$pf)
## End(Not run)



