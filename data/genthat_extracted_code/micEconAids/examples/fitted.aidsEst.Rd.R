library(micEconAids)


### Name: fitted.aidsEst
### Title: Fitted values of an Almost Ideal Demand System
### Aliases: fitted.aidsEst
### Keywords: methods

### ** Examples

   # Using data published in Blanciforti, Green & King (1986)
   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   estResult <- aidsEst( c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      c( "wFood1", "wFood2", "wFood3", "wFood4" ), "xFood",
      data = Blanciforti86 )
   fitted( estResult )



