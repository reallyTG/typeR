library(DiceDesign)


### Name: discrepSA_LHS
### Title: Simulated annealing (SA) routine for Latin Hypercube Sample
###   (LHS) optimization via L2-discrepancy criteria
### Aliases: discrepSA_LHS
### Keywords: design

### ** Examples

dimension <- 2
n <- 10
X <- lhsDesign(n,dimension)$design
Xopt <- discrepSA_LHS(X,T0=10,c=0.99,it=2000,criterion="C2")
plot(Xopt$design)
plot(Xopt$critValues,type="l")
## Not run: 
##D   Xopt <- discrepSA_LHS(X,T0=10,c=0.99,it=1000,criterion="C2",profile="GEOM_MORRIS")
## End(Not run)



