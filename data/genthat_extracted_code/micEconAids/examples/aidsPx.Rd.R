library(micEconAids)


### Name: aidsPx
### Title: Price Index for the AIDS
### Aliases: aidsPx
### Keywords: models

### ** Examples

   data( Blanciforti86 )

   # Stone price index
   aidsPx( "S", c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      Blanciforti86, c( "wFood1", "wFood2", "wFood3", "wFood4" ) )

   # (log-linear analogue of the) Paasche price index
   aidsPx( "P", c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      Blanciforti86, c( "wFood1", "wFood2", "wFood3", "wFood4" ),
      base = row.names(Blanciforti86) == "1970" )

   # Tornqvist price index
   aidsPx( "T", c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      Blanciforti86, c( "wFood1", "wFood2", "wFood3", "wFood4" ),
      base = list( prices = rep( 100, 4 ), shares = rep( 0.25, 4 ) ) )



