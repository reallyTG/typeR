library(micEconAids)


### Name: aidsElas
### Title: Elasticities of the AIDS model
### Aliases: aidsElas elas.aidsEst print.aidsElas
### Keywords: models

### ** Examples

   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   estResult <- aidsEst( c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      c( "wFood1", "wFood2", "wFood3", "wFood4" ), "xFood",
      data = Blanciforti86 )
   wMeans <- colMeans( Blanciforti86[ , c( "wFood1", "wFood2",
      "wFood3", "wFood4" ) ] )
   aidsElas( estResult$coef, shares = wMeans, method = "Ch",
      priceIndex = "S" )

   ## Repeating the evaluation of different elasticity formulas of
   ## Green & Alston (1990)
   priceNames <- c( "pFood1", "pFood2", "pFood3", "pFood4" )
   shareNames <- c( "wFood1", "wFood2", "wFood3", "wFood4" )

   # AIDS estimation and elasticities
   estResultA <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86[ -1, ],
      method = "IL", maxiter = 100 )
   diag( elas( estResultA, method = "AIDS" )$marshall )
   summary( elas( estResultA, method = "AIDS" ) )

   # LA-AIDS estimation
   estResultLA <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, priceIndex = "SL", maxiter = 100 )

   # LA-AIDS + formula of AIDS
   diag( elas( estResultLA, method = "AIDS" )$marshall )

   # LA-AIDS + formula of Eales + Unnevehr
   diag( elas( estResultLA, method = "EU" )$marshall )

   # LA-AIDS + formula of Goddard or Chalfant:
   diag( elas( estResultLA, method = "Go" )$marshall )
   diag( elas( estResultLA, method = "Ch" )$marshall )

   # LA-AIDS + formula of Green + Alston (= 1st of Buse):
   diag( elas( estResultLA, method = "GA" )$marshall )



