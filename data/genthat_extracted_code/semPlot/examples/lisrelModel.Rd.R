library(semPlot)


### Name: lisrelModel
### Title: Construct SEM model using LISREL matrix specification.
### Aliases: lisrelModel

### ** Examples

## Example of a Full LISREL model path diagram with the same number of exgenous 
## and endogenous variables:

# Lambda matrices:
Loadings <- rbind(diag(1,2,2),diag(1,2,2),diag(1,2,2))

# Phi and Psi matrices:
LatVar <- diag(1,2,2)

# Beta matrix:
Beta <- matrix(0,2,2)
Beta[1,2] <- 1

# Theta matrices:
ManVar <- diag(1,nrow(Loadings),nrow(Loadings))

# Gamma matrix:
Gamma <- diag(1,2,2)

# Tau matrices:
ManInts <- rep(1,6)

# Alpha and Kappa matrices:
LatInts <- rep(1,2)

# Combine model:
mod <- lisrelModel(LY=Loadings,PS=LatVar,BE=Beta,TE=ManVar,
                   LX=Loadings,PH=LatVar,GA=Gamma,TD=ManVar,
                   TY=ManInts,TX=ManInts,AL=LatInts,KA=LatInts)

# Plot path diagram:
semPaths(mod, as.expression=c("nodes","edges"), sizeMan = 3, sizeInt = 1, 
  sizeLat = 4)

# Plot path diagram with more graphical options:
semPaths(mod, as.expression=c("nodes","edges"), sizeMan = 3, sizeInt = 1, 
  sizeLat = 4, label.prop=0.5, curve=0.5, bg="black", groups="latents", 
    intercepts=FALSE, borders=FALSE, label.norm="O")




