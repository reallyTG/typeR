library(micEconIndex)


### Name: quantityIndex
### Title: Calculate Quantity Indices
### Aliases: quantityIndex
### Keywords: models

### ** Examples

   data( Missong03E7.7, package = "micEcon" )
   # Laspeyres Quantity Indices
   quantityIndex( c( "p.beef", "p.veal", "p.pork" ),
      c( "q.beef", "q.veal", "q.pork" ), 1, Missong03E7.7 )
   # Paasche Quantity Indices
   quantityIndex( c( "p.beef", "p.veal", "p.pork" ),
      c( "q.beef", "q.veal", "q.pork" ), 1, Missong03E7.7, "Paasche" )

   data( Bleymueller79E25.1, package = "micEcon" )
   # Laspeyres Quantity Indices
   quantityIndex( c( "p.A", "p.B", "p.C", "p.D" ), c("q.A", "q.B", "q.C", "q.D" ),
      1, Bleymueller79E25.1 )
   # Paasche Quantity Indices
   quantityIndex( c( "p.A", "p.B", "p.C", "p.D" ), c("q.A", "q.B", "q.C", "q.D" ),
      1, Bleymueller79E25.1, "Paasche" )



