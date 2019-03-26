library(SARP.compo)


### Name: choisir.seuil
### Title: Cut-off selection by simulations
### Aliases: choisir.seuil print.SARPcompo.H0 plot.SARPcompo.H0
### Keywords: compositional

### ** Examples

   # What would be the optimal cut-off for 10 genes quantified in two
   #  groups of 5 replicates?
   # For speed reason, only 50 simulations are done here,
   #  but obviously much more are needed to have a good estimate f the cut-off.

   seuil <- choisir.seuil( 10, c( 5, 5 ), B = 50 )
   seuil

   # Get the cut-off and its confidence interval
   attr( seuil, "seuil" )

   # Plot the results
   plot( seuil )



