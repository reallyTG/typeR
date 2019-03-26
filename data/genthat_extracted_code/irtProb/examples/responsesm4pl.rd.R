library(irtProb)


### Name: responsesm4pl
### Title: Simulation of Response Patterns and Computation of the
###   Probability of the Patterns from m4pl
### Aliases: grm4pl ggrm4pl pggrm4pl
### Keywords: distribution

### ** Examples

## Not run: 
##D ## ....................................................................
##D # Generation of response patterns (0,1) from r4pl() for N subjects (default value
##D # of N = 10)
##D 
##D # Generation of a response (0,1) from rm4pl for N subjects
##D  grm4pl(theta=0)
##D  grm4pl(N=5, theta=c(-4,4), c=0)
##D 
##D # Generation of n m4pl response patterns (0,1) for [rep * length(theta)] subjects
##D #  The subject number ia equal to [rep * length(theta)]
##D #  a,b,c et d are item parameters vectors
##D  nitems <- n <- 7; N <- 1
##D  s     <- rep(0,nitems); b <- seq(-4,4,length=nitems); c <- rep(0,nitems)
##D  d     <- rep(1,nitems)
##D  theta <- seq(-4,4,length=5)
##D  x     <- ggrm4pl(n=nitems, rep=N, theta=theta,s=s,b=b,c=c,d=d)
##D  x
##D 
##D # TO BE REWORKED - Probability of a response pattern and test caracteristic curve
##D # (TCC)
##D  nItems <- n <- 7; N <- 1
##D  s      <- rep(0,nItems); b <- seq(-4,4,length=nItems)
##D  c      <- rep(0,nItems); d <- rep(1,nItems)
##D  theta <- seq(-4,4,length=5);     S <- rep(1/1.702,length(theta));
##D  C     <- rep(0.3,length(theta)); D <- rep(0,length(theta))
##D  x <- ggrm4pl(n=nItems, rep=N, theta=theta, S=S, C=C, D=D, s=s, b=b, c=c, d=d)
##D  x
##D  res <- pggrm4pl(x=x, rep=N, theta=theta, S=1/1.702, C=0.3, D=0, s=s, c=c, d=d,
##D                  TCC=TRUE)
##D  res
##D  res <- pggrm4pl(x=x, rep=N, theta=rep(2,length(theta)), S=1/1.702, C=0, D=0,
##D                  s=s, c=c, d=d, TCC=FALSE)
##D  res
##D  pggrm4pl(theta=3)
##D  pggrm4pl(n=10, theta=seq(-4,4,length=5), x=ggrm4pl(rep=1), TCC=TRUE)
##D ## ....................................................................
##D  
## End(Not run)
 


