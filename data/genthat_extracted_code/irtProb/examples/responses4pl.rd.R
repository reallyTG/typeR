library(irtProb)


### Name: responses4pl
### Title: Simulation of Response Patterns and Computation of the
###   Probability of the Patterns
### Aliases: gr4pl ggr4pl pggr4pl
### Keywords: distribution

### ** Examples

## Not run: 
##D ## ....................................................................
##D # Generation of reponses (0,1) from r4pl() for N subjects (default value of N= 10)
##D  gr4pl(c = 1)
##D  gr4pl(N = 5, theta = c(-4, 4), c = 0)
##D 
##D # Generation of a 7 responses pattern (0,1) for [rep * length(theta)] subjects
##D #  The subjects number is equal to [rep * length(theta)]]
##D #  a,b,c et d are item parameters vectors
##D  nitems <- 7
##D  N      <- 10
##D  a      <- rep(1, nitems)
##D  b      <- rnorm(nitems)
##D  c      <- rep(0, nitems)
##D  d      <- rep(1, nitems)
##D  theta  <- seq(-4,4,length=5)
##D  x      <- ggr4pl(n = nitems, rep = N, theta = theta, a = a, b = b, c = c, d = d)
##D  x
##D 
##D ## Probability of a 10 responses pattern and test caracteristic curve (TCC)
##D  nitems <- 10
##D  a      <- rep(1,nitems)
##D  b      <- seq(-4,4,length=nitems)
##D  c      <- rep(0,nitems)
##D  d      <- rep(1,nitems)
##D  N      <- 3
##D  theta  <- seq(-1,1,length=12)
##D  # Generation of the response patterns
##D  x      <- ggr4pl(n = nitems, rep = N, theta = theta, a = a, b = b, c = c, d = d)
##D  x
##D  # Without TCC
##D  res    <- pggr4pl(x=x, rep=N, theta=theta,a=a,c=c,d=d,TCC=FALSE); res
##D  # With TCC for each response pattern
##D  res    <- pggr4pl(x=x, rep=N, theta=theta,a=a,c=c,d=d,TCC=TRUE); res
##D ## ....................................................................
##D  
## End(Not run)
 


