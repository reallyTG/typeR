library(sivipm)


### Name: takeoff.polyX
### Title: Remove Monomials from a polyX Object
### Aliases: takeoff.polyX takeoff takeoff,polyX-method

### ** Examples

X <- cornell0[,1:2] # X-inputs
# Polynomial creation
monomials <- c("Distillation","Reformat","Distillation*Reformat")
P <- vect2polyX (X, monomials)
# Remove the third  monomial:
P2 <- takeoff(P, c(3))
# Same expressed with using variable names:
P2 <- takeoff(P, c("Distillation*Reformat"))



