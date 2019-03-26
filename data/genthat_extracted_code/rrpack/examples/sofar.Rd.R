library(rrpack)


### Name: sofar
### Title: Sparse orthogonal factor regression
### Aliases: sofar

### ** Examples

## Not run: 
##D library(rrpack)
##D ## Simulate data from a sparse factor regression model
##D p <- 100; q <- 50; n <- 100; nrank <- 3
##D mydata <- rrr.sim1(n, p, q, nrank, s2n = 1,
##D                    sigma = NULL, rho_X = 0.5, rho_E = 0.3)
##D Y <- mydata$Y
##D X <- mydata$X
##D 
##D fit1 <- sofar(Y, X, ic.type = "GIC", nrank = nrank + 2,
##D               control = list(methodA = "adlasso", methodB = "adlasso"))
##D summary(fit1)
##D plot(fit1)
##D 
##D fit1$U
##D crossprod(fit1$U) #check orthogonality
##D fit1$V
##D crossprod(fit1$V) #check orthogonality
## End(Not run)




