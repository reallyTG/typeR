library(kcirt)


### Name: kcirt.fitMSS
### Title: Metaheuristic k-Cube Thurstonian IRT Fitting
### Aliases: kcirt.fitMSS
### Keywords: ~kwd1 ~kwd2

### ** Examples

constructMap.ls <- list(
c(1,1,2,2),
c(1,1,3,3),
c(2,2,3,3),
c(1,1,2,2),
c(1,1,3,3),
c(2,2,3,3),
c(1,2),
c(2,3),
c(1,3)
)
    
    
qTypes <- rep("R", length(constructMap.ls))
    
mod <- kcirt.model(constructMap.ls=constructMap.ls, qTypes=qTypes, mxLambda=NULL)
    
N <- 200
set.seed(99999)
mod <- kcirt.sim(model=mod, N=N)
    
    
ikcirt.df1(mod, "self")
    
####### create initial guess for hyperparameters (aka loadings)
mod$mxHatLambda <- mod$mxLambda - matrix( rnorm( sum(mod$ns)^2, 0, 0.3 ), sum(mod$ns), sum(mod$ns) )
    
####### need to assign hat states and utilities
mod$mxHatEta <- matrix(0, N, sum(mod$nuc))
mod$hatMu <- rep(0, sum(mod$ns))

## Not run: 
##D ###### run MSS fit -- performance is R^2 btwn true and pred states (aka scales)
##D mod <- kcirt.fitMSS(model=mod, lambdaConstraint="self", kcpus=2, penalty="L2", 
##D usetruesigma=TRUE, mss.sd=1)
##D mod$performance
##D     
##D ###### run again ...
##D mod <- kcirt.fitMSS(model=mod, lambdaConstraint="self", kcpus=2, penalty="L2", 
##D usetruesigma=TRUE, mss.sd=1)
##D mod$performance
##D     
##D ###### run a few more times ... ...
## End(Not run)




