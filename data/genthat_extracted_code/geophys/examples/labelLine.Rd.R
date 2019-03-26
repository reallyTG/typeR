library(geophys)


### Name: labelLine
### Title: Label a Line Segment
### Aliases: labelLine
### Keywords: misc

### ** Examples



 V1 = c(runif(1) ,  runif(1),runif(1) , runif(1))

  
 P1 = c(V1[1], V1[3])
P2 =  c(V1[2], V1[4])
 plot(c(P1[1], P2[1]), c(P1[2], P2[2] ), asp=1, type='n' )
   arrows(P1[1], P1[2], P2[1], P2[2], length=.04, col='red')
    
   labelLine( P1, P2 , lab="ABOVE", dinch = .5,
           aty=2, acol='blue'  )
   labelLine( P1, P2 , above=FALSE, lab="below",
         dinch = .5, aty=2, acol='green', tcol="magenta"  )


 





