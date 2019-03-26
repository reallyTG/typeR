library(micEconAids)


### Name: lrtest.aidsEst
### Title: Likelihood Ratio test for Almost Ideal Demand Systems
### Aliases: lrtest.aidsEst
### Keywords: models

### ** Examples

   # Using data published in Blanciforti, Green & King (1986)
   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   # names of prices and expenditure shares
   priceNames <- c( "pFood1", "pFood2", "pFood3", "pFood4" )
   shareNames <- c( "wFood1", "wFood2", "wFood3", "wFood4" )

   # estimation with symmetry and homogeneity imposed
   estResult <- aidsEst( c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      c( "wFood1", "wFood2", "wFood3", "wFood4" ), "xFood",
      data = Blanciforti86 )

   # estimation with only homogeneity imposed
   estResultHom <- aidsEst( c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      c( "wFood1", "wFood2", "wFood3", "wFood4" ), "xFood",
      data = Blanciforti86, sym = FALSE )

   # unrestricted estimation
   estResultUnr <- aidsEst( c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      c( "wFood1", "wFood2", "wFood3", "wFood4" ), "xFood",
      data = Blanciforti86, sym = FALSE, hom = FALSE )

   # LR tests
   lrtest( estResult, estResultHom, estResultUnr, estResult )

   ## Estimation with a demand shifter: linear trend
   Blanciforti86$trend <- c( 0:( nrow( Blanciforti86 ) - 1 ) )
   estResultTrend <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, shifterNames = "trend" )

   # LR tests
   lrtest( estResult, estResultTrend )



