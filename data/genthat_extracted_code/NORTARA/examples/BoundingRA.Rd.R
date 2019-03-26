library(NORTARA)


### Name: BoundingRA
### Title: Computes an intermediate multivariate normal correlation matrix
###   before using the NORTA approach.
### Aliases: BoundingRA

### ** Examples

## Not run: 
##D invcdfnames <- c("qt","qpois","qnorm")
##D paramslists <- list(
##D                m1 = list(df = 3),
##D                m2 = list(lambda = 5),
##D                m3 = NULL  # it means list(mean = 0, sd = 1)
##D                  )
##D cor_matrix <- matrix(c(1,0.5,-0.3,0.5,1,0.4,-0.3,0.4,1), 3)
##D Sigma <- BoundingRA(cor_matrix,invcdfnames,paramslists)
##D Sigma
##D invcdfnames <- c("qunif","qunif","qunif")
##D paramslists <- list(
##D                m1 = NULL, #it means list(min = 0, max = 1)
##D                m2 = NULL,
##D                m3 = NULL
##D               )
##D cor_matrix <- matrix(c(1,0.5,-0.3,0.5,1,0.4,-0.3,0.4,1), 3)
##D Sigma <- BoundingRA(cor_matrix,invcdfnames,paramslists)
##D Sigma
##D #NB:For element 0.5 in cor_matrix, the true root should be around 2*sin(0.5*3.14/6).
##D res <- sapply(c(0.5,-0.3,0.4), function(x){2*sin(x*pi/6)})
##D trueroots <- diag(1/2,3,3)
##D trueroots[upper.tri(trueroots)] <- res
##D trueroots <- trueroots + t(trueroots)
##D trueroots
##D abserrors <- abs(Sigma - trueroots)
##D abserrors
## End(Not run)



