library(DiceDesign)


### Name: discrepESE_LHS
### Title: Enhanced Stochastic Evolutionnary (ESE) algorithm for Latin
###   Hypercube Sample (LHS) optimization via L2-discrepancy criteria
### Aliases: discrepESE_LHS
### Keywords: design

### ** Examples

## Not run: 
##D dimension <- 2
##D n <- 10
##D X <- lhsDesign(n,dimension)$design
##D Xopt <- discrepESE_LHS(X,T0=0.005*discrepancyCriteria(X,type='C2')[[1]],inner_it=100,J=50,it=2)
##D plot(Xopt$design)
##D plot(Xopt$critValues,type="l")
## End(Not run)



