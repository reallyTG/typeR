library(micEconIndex)


### Name: priceIndex
### Title: Calculate Price Indices
### Aliases: priceIndex
### Keywords: models

### ** Examples

   data( Missong03E7.7, package = "micEcon" )
   # Laspeyres Price Indices
   priceIndex( c( "p.beef", "p.veal", "p.pork" ),
      c( "q.beef", "q.veal", "q.pork" ), 1, Missong03E7.7 )
   # Paasche Price Indices
   priceIndex( c( "p.beef", "p.veal", "p.pork" ),
      c( "q.beef", "q.veal", "q.pork" ), 1, Missong03E7.7, "Paasche" )

   data( Bleymueller79E25.1, package = "micEcon" )
   # Laspeyres Price Indices
   priceIndex( c( "p.A", "p.B", "p.C", "p.D" ), c("q.A", "q.B", "q.C", "q.D" ),
      1, Bleymueller79E25.1 )
   # Paasche Price Indices
   priceIndex( c( "p.A", "p.B", "p.C", "p.D" ), c("q.A", "q.B", "q.C", "q.D" ),
      1, Bleymueller79E25.1, "Paasche" )



