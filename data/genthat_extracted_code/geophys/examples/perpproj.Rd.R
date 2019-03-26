library(geophys)


### Name: perpproj
### Title: Perpendicular Projection
### Aliases: perpproj pointproj
### Keywords: misc

### ** Examples



  V1 = c( 2,  6, 1, 9)
    V2 = c( 0, 5,  1, 2)

  
    PP = perpproj( V1, V2, add=FALSE  )


    R = range(c(V1, V2, unlist(PP) ))

    plot(R, R, type='n', asp=1)

    arrows(V1[1], V1[3], V1[2], V1[4], length=.08 ) 
   arrows(V2[1], V2[3], V2[2], V2[4], length=.08 ) 

    points(PP$P1[1],PP$P1[2], col='red')
       points(PP$P2[1],PP$P2[2], col='blue')



    arrows(V2[2], V2[4],PP$P1[1],PP$P1[2] , length=.08, col='red' )
    
    arrows(V1[2], V1[4], PP$P2[1],PP$P2[2], length=.08, col='blue' ) 
 





