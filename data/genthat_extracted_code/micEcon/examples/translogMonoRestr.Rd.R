library(micEcon)


### Name: translogMonoRestr
### Title: Monotonicity Restrictions of a Translog Function
### Aliases: translogMonoRestr
### Keywords: models

### ** Examples

   data( germanFarms )
   # quantity of variable inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput

   # matrix to check or impose monotonicity at all observations
   monoRestrObs <- translogMonoRestr( c( "qLabor", "land", "qVarInput" ),
      germanFarms )

   # matrix to check or impose monotonicity within a box that includes all 
   # observations
   monoRestrBox <- translogMonoRestr( c( "qLabor", "land", "qVarInput" ),
      germanFarms, box = TRUE )



