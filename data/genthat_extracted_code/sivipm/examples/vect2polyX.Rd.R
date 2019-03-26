library(sivipm)


### Name: vect2polyX
### Title: Create polyX Object from Polynomial Description
### Aliases: vect2polyX

### ** Examples

X <- cornell0[,1:3]
# Monomials expressed by variable numbers:
monomials <- c("1","2","3", "1*2*3")
polyXI <- vect2polyX (X, monomials)
# Monomials expressed by variable names:
monomials <- c("Distillation", "Reformat", "NaphthaT",
               "Distillation*Reformat*NaphthaT")
polyXI <- vect2polyX (X, monomials)



