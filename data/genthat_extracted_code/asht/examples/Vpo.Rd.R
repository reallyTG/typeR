library(asht)


### Name: Vpo
### Title: Variance for estimated Mann-Whitney parameter under proportional
###   odds.
### Aliases: Vpo
### Keywords: internal

### ** Examples

Vpo(.7,.8,5,7)
## Compare to LAPH method
VLAPH<- function(PHI,tf=tiefactor,ny=n.y,nx=n.x){
        tf*(PHI*(1-PHI)/(ny*nx))*
          (1+((ny+nx-2)/2)*
             ((1-PHI)/(2-PHI)+PHI/(1+PHI)))
      }   
VLAPH(.7,.8,5,7)      



