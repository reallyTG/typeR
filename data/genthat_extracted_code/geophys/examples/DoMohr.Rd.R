library(geophys)


### Name: DoMohr
### Title: Mohr's Circle
### Aliases: DoMohr
### Keywords: misc

### ** Examples

Stensor = matrix(c(2,.3, .3, 1), ncol=2)

Stensor = matrix(c(50, 40, 40, 10), ncol=2)

DoMohr(Stensor) 


Stensor = matrix(c(
-50, 40, 20,
40, 10, 10,
20,  10, 5), ncol=3)

DoMohr(Stensor) 





