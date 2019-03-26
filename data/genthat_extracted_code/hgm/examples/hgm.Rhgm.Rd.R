library(hgm)


### Name: hgm.Rhgm
### Title: The function hgm.Rhgm performs the holonomic gradient method
###   (HGM) for a given Pfaffian system and an initial value vector.
### Aliases: hgm.Rhgm
### Keywords: Normalization constant Holonomic gradient method HGM

### ** Examples

# Example 1.
# A demo program; von Mises--Fisher on S^{3-1}

G.exact = function(th){  # exact value by built-in function
  c( sinh(th[1])/th[1], cosh(th[1])/th[1] - sinh(th[1])/th[1]^2 )
}

dG.fun = function(th, G, fn.params=NULL){  # Pfaffian
  dG = array(0, c(1, 2))
  sh = G[1] * th[1]
  ch = G[2] * th[1] + G[1]
  dG[1,1] = G[2] # Pfaffian eq's
  dG[1,2] = sh/th[1] - 2*ch/th[1]^2 + 2*sh/th[1]^3
  dG
}

th0 = 0.5
th1 = 15

G0 = G.exact(th0)
G0

G1 = hgm.Rhgm(th0, G0, th1, dG.fun)  # HGM
G1

G1.exact = G.exact(th1)
G1.exact

#
# Example 2.
#
hgm.Rhgm.demo1()




