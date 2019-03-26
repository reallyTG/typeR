library(sivipm)


### Name: bind.polyX
### Title: Bind Several polyX Objects
### Aliases: bind.polyX bind bind,polyX-method
### Keywords: methods

### ** Examples

# Create first polynomial
P <- vect2polyX(cornell0[,1:3],c("1","2","3", "3*3*3", "3*3"))
# Create second polynomial
P2 <- vect2polyX(cornell0[,1:3], c("1","2","3", "2*3"))
# Bind them: PP=X1 + X2 + X3 + X3*X3*X3 + X3*X3 + X2*X3
PP <- bind.polyX(P, P2)



