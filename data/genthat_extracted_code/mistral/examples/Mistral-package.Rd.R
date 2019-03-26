library(mistral)


### Name: mistral-package
### Title: Methods In Structural Reliability Analysis
### Aliases: mistral-package mistral
### Keywords: package

### ** Examples


########## FORM ###########

 distribution = list()
 distribution[[1]] = list("gamma",c(2,1))
 distribution[[2]] = list("gamma",c(3,1))

 f <- function(X){
   X[1]/sum(X) - qbeta((1e-5),2,3)
 }

 res <- FORM(f, u.dep = c(0,0.1), inputDist = distribution, 
     N.calls = 1000, eps = 1e-7, Method = "HLRF", IS = "TRUE", 
     q = 0.1, copula = "unif")

########### Wilks ##########

N <- WilksFormula(0.95,0.95,order=1)
print(N)




