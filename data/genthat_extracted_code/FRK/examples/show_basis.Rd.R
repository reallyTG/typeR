library(FRK)


### Name: show_basis
### Title: Show basis functions
### Aliases: show_basis show_basis,Basis-method
###   show_basis,TensorP_Basis-method

### ** Examples

library(ggplot2)
library(sp)
data(meuse)
coordinates(meuse) = ~x+y # change into an sp object
G <- auto_basis(manifold = plane(),data=meuse,nres = 2,regular=2,prune=0.1,type = "bisquare")
## Not run: show_basis(G,ggplot()) + geom_point(data=data.frame(meuse),aes(x,y))



