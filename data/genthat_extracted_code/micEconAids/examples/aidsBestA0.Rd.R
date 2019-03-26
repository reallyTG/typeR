library(micEconAids)


### Name: aidsBestA0
### Title: Find 'best' Value for alpha 0 in the AIDS
### Aliases: aidsBestA0
### Keywords: models

### ** Examples

   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   bestA0 <- aidsBestA0( c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      c( "wFood1", "wFood2", "wFood3", "wFood4" ), "xFood",
      data = Blanciforti86, useMatrix = FALSE )
   # may take some time (argument 'useMatrix = FALSE' decreases
   # the computation time only if the model and data set are small)
   print( bestA0$alpha0 )
   plot( bestA0$allValues ) # this should be convex



