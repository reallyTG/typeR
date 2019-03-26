library(fisheyeR)


### Name: puntosMedios
### Title: Connect 2D coordinates points
### Aliases: puntosMedios

### ** Examples

   obj <- matrix(c(.5,0,0,.5, -.5,0, 0,-.5), ncol = 2, byrow = TRUE)
   plot(0, 0, col = 'white')
   points(puntosMedios(obj), col = 'yellow', type = 'l')
   points(obj, col = 'blue')   



