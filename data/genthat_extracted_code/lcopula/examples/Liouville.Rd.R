library(lcopula)


### Name: Liouville
### Title: Liouville copulas
### Aliases: Liouville dliouv pliouv rliouv

### ** Examples

## Not run: 
##D #Multivariate density of Clayton Liouville copula
##D x <- rliouv(n = 100, family = "clayton", alphavec <- c(2,3), theta = 2)
##D dliouv(x=x, family="clayton", alphavec=c(2,3), theta=2, TRUE)
##D #Distribution function, multivariate sample
##D x <- rliouv(n=100, family="frank", theta=1.5, alphavec=c(2,3))
##D pliouv(theta=1.5, x=x,family="frank", alphavec=c(2,3))
## End(Not run)



