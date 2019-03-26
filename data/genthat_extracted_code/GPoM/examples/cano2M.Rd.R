library(GPoM)


### Name: cano2M
### Title: cano2M : Converts a model in canonical form into a matrix form
### Aliases: cano2M

### ** Examples

# A vector of polynomial terms corresponding to a canonical form:
polyTerms <- c(0.2,0,-1,0.5,0,0,0,0,0,0)
# Convert this vector into a matrix formulation with all the equations: 
K <- cano2M(3,2,polyTerms)
# Visualize the equations:
visuEq(3,2,K)




