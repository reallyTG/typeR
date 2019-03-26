library(irtProb)


### Name: likelihoodCurve
### Title: Functions to Graph m4pl Likelihood Curves
### Aliases: likelihoodCurve groupLikelihoodCurves
### Keywords: multivariate

### ** Examples

## Not run: 
##D  ## SIMULATION OF A RESPONSE PATTERN WITH 60 ITEMS
##D  nItems <- 60
##D  a      <- rep(1.702,nItems); b <- seq(-4,4,length=nItems)
##D  c      <- rep(0,nItems);     d <- rep(1,nItems)
##D  nSubjects <-  1
##D  theta     <-  -1
##D  S         <-  0.0
##D  C         <-  0.5
##D  D         <-  0.0
##D  
##D  set.seed(seed = 100)
##D  x         <- ggrm4pl(n=nItems, rep=1,
##D                       theta=theta, S=S, C=C, D=D,
##D                       s=1/a, b=b,c=c,d=d)
##D 
##D  ## Likelihood curves, person parameters estimates
##D   # and log likelihood of models graphed
##D  test <- likelihoodCurve(x=x, s=1/a, b=b, c=c, d=d, color=TRUE,
##D                          main="Likelihood Curve",
##D                          xlab=expression(theta), ylab=NULL, zlab="P(X)",
##D                          type="wireframe" , grain=50, limitD=c(0,1),
##D                          logLikelihood=FALSE, annotate=TRUE )
##D 
##D  # Contentd of the object test
##D  test$plotT
##D  test$plotC
##D  test$plotS
##D  test$plotD
##D  test$par
##D  round(test$logLikelihood,2)
##D 
##D  ## Graph of all the likelihood function curves
##D  groupLikelihoodCurves(test$plotT, test$plotS, test$plotC, test$plotD,
##D                        main=NULL, cex=0.7)
##D  
## End(Not run)
 


