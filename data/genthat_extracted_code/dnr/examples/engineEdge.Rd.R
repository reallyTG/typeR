library(dnr)


### Name: engineEdge
### Title: Implementation of simulation engine for dynamic networks using
###   smoothing estimates of change statistics.
### Aliases: engineEdge

### ** Examples

## Not run: 
##D input_network=rdNets[1:6];
##D model.terms=c("triadcensus.003", "triadcensus.012", "triadcensus.102", "triadcensus.021D", "gwesp");
##D model.formula = net~triadcensus(0:3)+gwesp(decay = 0, fixed=FALSE, cutoff=30)-1;
##D graph_mode='digraph';
##D group='dnc';
##D alpha.glmnet=1
##D directed=TRUE;
##D method <- 'bayesglm'
##D maxlag <- 3
##D lambda=NA
##D intercept = c("edges")
##D cdim <- length(model.terms)
##D lagmat <- matrix(sample(c(0,1),(maxlag+1)*cdim,replace = TRUE),ncol = cdim)
##D ylag <- rep(1,maxlag)
##D lagmat[1,] <- rep(0,ncol(lagmat))
##D out <- paramEdge(input_network,model.terms, model.formula,
##D                 graph_mode="digraph",group,intercept = c("edges"),exvar=NA,
##D                 maxlag = 3,
##D                 lagmat = lagmat,
##D                 ylag = rep(1,maxlag),
##D                 lambda = NA, method='bayesglm',
##D                 alpha.glmnet=1)
##D #
##D start_network <- input_network
##D inputcoeff <- out$coef$coef
##D nvertex <- 47
##D ns <- 10
##D exvar <- NA
##D tmp <- suppressWarnings(engineEdge(start_network=start_network,inputcoeff=inputcoeff,ns=ns,
##D                      model.terms=model.terms, model.formula=model.formula,
##D                      graph_mode=graph_mode,group=group,intercept=intercept,
##D                      exvar=exvar,
##D                      maxlag=maxlag,
##D                      lagmat=lagmat,
##D                      ylag=ylag,
##D                      lambda = NA, method='bayesglm',
##D                      alpha.glmnet=alpha.glmnet))
## End(Not run)




