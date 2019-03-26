library(LatticeKrig)


### Name: LKDist
### Title: Find all pairwise distances within a maximum distance.
### Aliases: LKDist LKDistComponents LKDistGrid LKDistGridComponents
###   LKGridCheck LKGridFindNmax
### Keywords: spatial

### ** Examples

set.seed( 123)	
x<- matrix( runif(100*2), 100,2)

DMatrix<- LKDist( x,x, delta=.1)
# coerce to spam matrix format
DMatrix2<- spind2spam( DMatrix)

# a grid
gridL<- list( x1= seq(0,1,.2), x2= seq( 0,2,.2) , x3= seq( -1,1,.2))
class(gridL)<- "gridList"	
x1<- cbind( runif( 100), runif(100)*2, 2*(runif( 100) -.5) )
look<- LKDistGrid( x1, gridL, delta=.45)
# check against rdist.
# look2<- rdist( x1, make.surface.grid(gridL))
# look2[ look2 >= .45] <- 0
# max( abs(look- look2)[look>0] )

# test of periodic option
 gridL<- structure(
            list( x1= seq(0,1,.02),
                  x2= seq( 0,1,.02)),
            class="gridList")
 look1<- LKDistGrid( rbind(c(0,0)), gridL, delta=.35,
                     periodic=c(TRUE,FALSE))
 look2<- spind2full(look1)
 image.plot( as.surface( gridL, look2) )
 
 look1<- LKDistGrid( rbind(c(0,0)), gridL, delta=.35,
                      periodic=c(TRUE,TRUE))
 look2<- spind2full(look1)
 image.plot( as.surface( gridL, look2) )  



