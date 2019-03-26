library(rgl)


### Name: rglToLattice
### Title: Convert rgl userMatrix to lattice or base angles
### Aliases: rglToLattice rglToBase

### ** Examples

if (requireNamespace("orientlib")) {  
  persp3d(volcano, col = "green")
  if (requireNamespace("lattice")) 
    lattice::wireframe(volcano, screen = rglToLattice())
  angles <- rglToBase()
  persp(volcano, col = "green", border = NA, shade = 0.5,
        theta = angles$theta, phi = angles$phi)
}



