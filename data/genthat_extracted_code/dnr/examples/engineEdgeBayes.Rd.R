library(dnr)


### Name: engineEdgeBayes
### Title: Implementation of simulation engine for dynamic networks using
###   smoothing estimates of change statistics.
### Aliases: engineEdgeBayes

### ** Examples

## Not run: 
##D startNet <- rdNets[1:50]
##D model.terms=c("triadcensus.003", "triadcensus.012", "triadcensus.102", "triadcensus.021D", "gwesp")
##D model.formula = net~triadcensus(0:3)+gwesp(alpha=0, fixed=FALSE, cutoff=30)-1
##D graph_mode <- 'digraph'
##D group <- 'dnc'
##D alpha.glmnet <- 1
##D method <- 'bayesglm'
##D maxlag <- 3
##D lambda <- NA
##D intercept <- "edges"
##D cdim <- length(model.terms)
##D lagmat <- matrix(sample(c(0,1),(maxlag+1)*cdim,replace = TRUE),ncol = cdim)
##D ylag <- rep(1,maxlag)
##D lagmat[1,] <- rep(0,ncol(lagmat))
##D 
##D out.coef <- paramEdge(input_network = startNet,
##D                 model.terms = model.terms,
##D                 model.formula = model.formula,
##D                 graph_mode='digraph',
##D                 group=group,intercept = intercept,
##D                 exvar=NA,
##D                 maxlag = maxlag,
##D                 lagmat = lagmat,
##D                 ylag = ylag,
##D                 lambda = NA, method='bayesglm',
##D                 alpha.glmnet=1)
##D 
##D 
##D inputcoeff <- out.coef$coef$coef.edge
##D nvertex <- 47 ##find vertex here
##D ns <- 1
##D exvar <- NA
##D for(i in seq_along(startNet)) Theta <- Theta + startNet[[i]][,]
##D Theta <- Theta/length(startNet)
##D Theta <- thresh(Theta)
##D out.bayes <- engineEdgeBayes(start_network=startNet,
##D inputcoeff=inputcoeff,
##D ns=ns,
##D model.terms=model.terms,
##D model.formula=model.formula,
##D graph_mode=graph_mode,
##D group=group,intercept=intercept,
##D exvar=exvar,
##D maxlag=maxlag,
##D lagmat=lagmat,
##D ylag=ylag,
##D lambda = NA, method='bayesglm',
##D alpha.glmnet=alpha.glmnet,
##D Theta = Theta)
## End(Not run)



