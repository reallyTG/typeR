library(DiceDesign)


### Name: maximinSA_LHS
### Title: Simulated annealing (SA) routine for Latin Hypercube Sample
###   (LHS) optimization via phiP criteria
### Aliases: maximinSA_LHS
### Keywords: design

### ** Examples

dimension <- 2
n <- 10
X <- lhsDesign(n,dimension)$design
Xopt <- maximinSA_LHS(X,T0=10,c=0.99,it=2000)
plot(Xopt$design)
plot(Xopt$critValues,type="l")
plot(Xopt$tempValues,type="l")
## Not run: 
##D   Xopt <- maximinSA_LHS(X,T0=10,c=0.99,it=1000,profile="GEOM_MORRIS")
## End(Not run)



