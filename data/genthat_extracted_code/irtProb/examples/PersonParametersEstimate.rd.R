library(irtProb)


### Name: PersonParametersEstimate
### Title: Estimation of the Personal Parameters from the mpl4 Logistic
###   Model
### Aliases: m4plEstimate m4plEstimateMore m4plPersonParameters
### Keywords: distribution

### ** Examples

## Not run: 
##D ## GENERATION OF VECTORS OF RESPONSE
##D  # NOTE THE USUAL PARAMETRIZATION OF THE ITEM DISCRIMINATION,
##D  # THE VALUE OF THE PERSONNAL FLUCTUATION FIXED AT 0,
##D  # AND THE VALUE OF THE PERSONNAL PSEUDO-GUESSING FIXED AT 0.30.
##D  # IT COULD BE TYPICAL OF PLAGIARISM BEHAVIOR.
##D  nItems <- 40
##D  a      <- rep(1.702,nItems); b <- seq(-5,5,length=nItems)
##D  c      <- rep(0,nItems); d <- rep(1,nItems)
##D  nSubjects <- 1; rep <- 2
##D  theta     <- seq(-1,-1,length=nSubjects)
##D  S         <- runif(n=nSubjects,min=0.0,max=0.0)
##D  C         <- runif(n=nSubjects,min=0.3,max=0.3)
##D  D         <- runif(n=nSubjects,min=0,max=0)
##D  set.seed(seed = 100)
##D  X         <- ggrm4pl(n=nItems, rep=rep,
##D                       theta=theta, S=S, C=C, D=D,
##D                       s=1/a, b=b,c=c,d=d)
##D                      
##D ## Genreric function m4plPersonParameters to use
##D ## prefered to the more specific one: m4plEstimate and m4plEstimateMore
##D  # ....................................................................
##D  model <- "C"
##D  test1 <- m4plPersonParameters(x=X, b=b, s=1/a, c=c, d=d, m=0, model=model,
##D                                prior="uniform", more=FALSE)
##D  test2 <- m4plPersonParameters(x=X, b=b, s=1/a, c=c, d=d, m=0, model=model,
##D                                prior="uniform", more=TRUE)
##D  # ....................................................................
##D 
##D ## ESTIMATION OF THE PERSONNAL PARAMETERS BY ALL MODELS.
##D  # THE CHOOSEN PRIOR IS UNIFORM WITH m=0.
##D  # ....................................................................
##D  m4plEstimate(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "T",    prior="uniform")
##D  m4plEstimate(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "S",    prior="uniform")
##D  m4plEstimate(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "C",    prior="uniform")
##D  m4plEstimate(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "D",    prior="uniform")
##D  m4plEstimate(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "SC",   prior="uniform")
##D  m4plEstimate(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "SD",   prior="uniform")
##D  m4plEstimate(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "CD",   prior="uniform")
##D  m4plEstimate(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "SCD",  prior="uniform")
##D  # ....................................................................
##D 
##D ## THE SAME ESTIMATION, BUT WITH INFORMATION ABOUT
##D  # THE STANDARD ERROR, THE CORRELATION AND THE LOG LIKELIKOOD
##D  m4plEstimateMore(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "T",    prior="uniform")
##D  m4plEstimateMore(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "S",    prior="uniform")
##D  m4plEstimateMore(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "C",    prior="uniform")
##D  m4plEstimateMore(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "D",    prior="uniform")
##D  m4plEstimateMore(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "SC",   prior="uniform")
##D  m4plEstimateMore(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "SD",   prior="uniform")
##D  m4plEstimateMore(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "CD",   prior="uniform")
##D  m4plEstimateMore(x=X, b=b, s=1/a, c=c, d=d, m=0, model= "SCD",  prior="uniform")
##D  # ....................................................................
##D 
##D ## Same simulation, but with replications
##D  # ....................................................................
##D  rep <- 100
##D  set.seed(seed = 100)
##D  X         <- ggrm4pl(n=nItems, rep=rep,
##D                       theta=theta, S=S, C=C, D=D,
##D                       s=1/a, b=b,c=c,d=d)
##D                      
##D ## Function used to extract each parameters of the list return by m4plEstimateMore
##D  extract <- function(x,i) x[[i]]
##D 
##D ## Usual IRT model integrating only the parameters theta
##D  apply(         X, 1, m4plEstimate,     b=b, s=1/a, c=c, d=d, m=0, model= "T",
##D                 prior="uniform")
##D  tests <- apply(X, 1, m4plEstimateMore, b=b, s=1/a, c=c, d=d, m=0, model= "T",
##D                 prior="uniform")
##D  personParameters <- matrix(unlist(lapply(tests,extract,1)),nrow=rep)
##D  personSe         <- matrix(unlist(lapply(tests,extract,2)),nrow=rep)
##D  personCor        <- matrix(unlist(lapply(tests,extract,3)),nrow=rep)
##D  personLL         <- matrix(unlist(lapply(tests,extract,4)),nrow=rep)
##D  results          <- data.frame(Parameter=personParameters, Se=personSe,
##D                                 LL=personLL)
##D  round(c(mean=sapply(results, mean, na.rm=TRUE)),2); round(c(se=sapply(results, sd, na.rm=TRUE)),2)
##D 
##D ## Model integrating the parameters theta and C
##D  # Same response patterns for comparison of estimates
##D  t(       apply(X, 1, m4plEstimate,     b=b, s=1/a, c=c, d=d, m=0, model= "C",
##D                 prior="uniform"))
##D  tests <- apply(X, 1, m4plEstimateMore, b=b, s=1/a, c=c, d=d, m=0, model= "C",
##D                 prior="uniform")
##D  personParameters <- t(matrix(unlist(lapply(tests,extract,1)),ncol=rep))
##D  personSe         <- t(matrix(unlist(lapply(tests,extract,2)),ncol=rep))
##D  personLL         <- t(matrix(unlist(lapply(tests,extract,4)),ncol=rep))
##D  results          <- data.frame(Parameter=personParameters, Se=personSe,
##D                                 LL=personLL)
##D  round(c(mean=sapply(results, mean, na.rm=TRUE)),2); round(c(se=sapply(results, sd, na.rm=TRUE)),2)
##D  ## Average correlation between the person parameters
##D  nParameters <- length(personParameters[1,])
##D  personCor   <- unlist(lapply(tests,extract,3))
##D  personCor   <- matrix( sapply(data.frame(t(matrix(personCor,ncol=rep))), mean, na.rm=TRUE),
##D                 ncol=nParameters)
##D  personCor
##D  
##D ## Model integrating the parameters theta and C
##D  # Same response patterns for comparison of estimates
##D  t(apply(       X,1, m4plEstimate,      b=b, s=1/a, c=c, d=d, m=0, model= "SCD",
##D                 prior="uniform"))
##D  tests <- apply(X, 1, m4plEstimateMore, b=b, s=1/a, c=c, d=d, m=0, model= "SCD",
##D                 prior="uniform")
##D  personParameters <- t(matrix(unlist(lapply(tests,extract,1)),ncol=rep))
##D  personSe         <- t(matrix(unlist(lapply(tests,extract,2)),ncol=rep))
##D  personLL         <- t(matrix(unlist(lapply(tests,extract,4)),ncol=rep))
##D  results          <- data.frame(Parameter=personParameters, Se=personSe,
##D                                 LL=personLL)
##D  round(c(mean=sapply(results, mean, na.rm=TRUE)),2); round(c(se=sapply(results, sd, na.rm=TRUE)),2)
##D  ## Average correlation between the person parameters
##D  nParameters <- length(personParameters[1,])
##D  personCor   <- unlist(lapply(tests,extract,3))
##D  personCor   <- matrix( sapply(data.frame(t(matrix(personCor,ncol=rep))), mean, na.rm=TRUE),
##D                 ncol=nParameters)
##D  personCor
##D  # ....................................................................
##D  
## End(Not run)
 


