library(DiceDesign)


### Name: maximinESE_LHS
### Title: Enhanced Stochastic Evolutionnary (ESE) algorithm for Latin
###   Hypercube Sample (LHS) optimization via phiP criteria
### Aliases: maximinESE_LHS
### Keywords: design

### ** Examples

dimension <- 2
n <- 10
X <- lhsDesign(n,dimension)$design
Xopt <- maximinESE_LHS(X,T0=0.005*phiP(X),inner_it=100,J=50,it=2)
plot(Xopt$design)
plot(Xopt$critValues,type="l")




