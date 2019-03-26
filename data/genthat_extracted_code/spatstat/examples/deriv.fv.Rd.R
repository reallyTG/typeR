library(spatstat)


### Name: deriv.fv
### Title: Calculate Derivative of Function Values
### Aliases: deriv.fv
### Keywords: spatial math nonparametric

### ** Examples

   G <- Gest(cells)
   plot(deriv(G, which=".", spar=0.5))
   A <- pairorient(redwood, 0.05, 0.15)
   DA <- deriv(A, spar=0.6, Dperiodic=TRUE)



