library(SARP.compo)


### Name: creer_matrice
### Title: Create p-values matrix from pairwise tests of all possible
###   ratios of a compositional vector
### Aliases: creer_matrice creer.Mp create.Mp
### Keywords: compositional

### ** Examples

   # load the potery data set
   data( poteries )

   # Compute one-way ANOVA p-values for all ratios in this data set   
   Mp <- creer.Mp( poteries, c( 'Al', 'Na', 'Fe', 'Ca', 'Mg' ),
                   f.p = anva1.fpc, v.X = 'Site' )
   Mp

   # Make a graphe from it and plot it
   plot( grf.Mp( Mp ) )



