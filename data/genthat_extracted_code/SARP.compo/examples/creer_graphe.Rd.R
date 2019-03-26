library(SARP.compo)


### Name: creer_graphe
### Title: Create a graph using a set of p-values from pairwise tests
### Aliases: creer_graphe grf.Mp grf.DFp create.graphe
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



