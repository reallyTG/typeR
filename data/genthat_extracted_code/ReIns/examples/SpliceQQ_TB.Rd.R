library(ReIns)


### Name: SpliceQQ_TB
### Title: Splicing quantile plot using Turnbull estimator
### Aliases: SpliceQQ_TB

### ** Examples

## Not run: 
##D 
##D # Pareto random sample
##D X <- rpareto(500, shape=2)
##D 
##D # Censoring variable
##D Y <- rpareto(500, shape=1)
##D 
##D # Observed sample
##D Z <- pmin(X,Y)
##D 
##D # Censoring indicator
##D censored <- (X>Y)
##D 
##D # Right boundary
##D U <- Z
##D U[censored] <- Inf
##D 
##D # Splice ME and Pareto
##D splicefit <- SpliceFiticPareto(L=Z, U=U, censored=censored, tsplice=quantile(Z,0.9))
##D 
##D 
##D 
##D x <- seq(0,20,0.1)
##D 
##D # Plot of spliced CDF
##D plot(x, pSplice(x, splicefit), type="l", xlab="x", ylab="F(x)")
##D 
##D # Plot of spliced PDF
##D plot(x, dSplice(x, splicefit), type="l", xlab="x", ylab="f(x)")
##D 
##D 
##D # Fitted survival function and Turnbull survival function 
##D SpliceTB(x, L=Z, U=U, censored=censored, splicefit=splicefit)
##D 
##D 
##D # Log-log plot with Turnbull survival function and fitted survival function
##D SpliceLL_TB(x, L=Z, U=U, censored=censored, splicefit=splicefit)
##D 
##D 
##D # PP-plot of Turnbull survival function and fitted survival function
##D SplicePP_TB(L=Z, U=U, censored=censored, splicefit=splicefit)
##D 
##D # PP-plot of Turnbull survival function and 
##D # fitted survival function with log-scales
##D SplicePP_TB(L=Z, U=U, censored=censored, splicefit=splicefit, log=TRUE)
##D 
##D # QQ-plot using Turnbull survival function and fitted survival function
##D SpliceQQ_TB(L=Z, U=U, censored=censored, splicefit=splicefit)
## End(Not run)



