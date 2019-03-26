library(SARP.compo)


### Name: arbre.Mp
### Title: Grouping composants by changes in cut-off separation
### Aliases: arbre.Mp plot.Arbre
### Keywords: compositional

### ** Examples

   # load the potery data set
   data( poteries )

   # Compute one-way ANOVA p-values for all ratios in this data set   
   Mp <- creer.Mp( poteries, c( 'Al', 'Na', 'Fe', 'Ca', 'Mg' ),
                   f.p = anva1.fpc, v.X = 'Site' )

   # Build the tree (in log scale, p-values are all < 0.01)
   arbre <- arbre.Mp( Mp, en.log = TRUE )

   # It is a dendrogram as defined in the cluster package
   str( arbre )
   class( arbre )

   # Drawing this tree
   plot( arbre )



