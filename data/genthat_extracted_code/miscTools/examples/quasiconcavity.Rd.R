library(miscTools)


### Name: quasiconcavity
### Title: Test for quasiconcavity / quasiconvexity
### Aliases: quasiconcavity quasiconvexity
### Keywords: array

### ** Examples

   quasiconcavity( matrix( 0, 3, 3 ) )

   quasiconvexity( matrix( 0, 3, 3 ) )

   m <- list()
   m[[1]] <- matrix( c( 0,-1,-1, -1,-2,3, -1,3,5 ), 3, 3 )
   m[[2]] <- matrix( c( 0,1,-1, 1,-2,3, -1,3,5 ), 3, 3 )

   quasiconcavity( m )

   quasiconvexity( m )



