library(fisheyeR)


### Name: toHiperbolico
### Title: Hyperbolic-alike space effect
### Aliases: toHiperbolico

### ** Examples

   circle1 = circulo(0,0,.25, PLOT = FALSE)
   circle2 = circulo(0,0,1.25, PLOT = FALSE)
   plot(0,0, xlim = c(-1.25,1.25), ylim= c(-1.25,1.25), col = 'white')
   points(circle1, col = 'blue', cex = 0.5)
   points(circle2, col = 'blue', cex = 0.5)
   points(toHiperbolico(circle2,3)$objetoC, col = 'green', cex = 0.5)
   points(toHiperbolico(circle1,3)$objetoC, col = 'green', cex = 0.5)



