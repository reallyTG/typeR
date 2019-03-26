library(SARP.compo)


### Name: tests
### Title: Utility functions to obtain p-values from tests on individual
###   ratios
### Aliases: tests anva1.fpc anva1vi.fpc rls.fpc kw.fpc anva_SC.fpc
###   student.fpc
### Keywords: compositional

### ** Examples

   # load the potery data set
   data( poteries )

   # Compute one-way ANOVA p-values for all ratios in this data set   
   Mp <- creer.Mp( poteries, c( 'Al', 'Na', 'Fe', 'Ca', 'Mg' ),
                   f.p = anva1.fpc, v.X = 'Site', frm = R ~ Site )
   Mp

   # Make a graphe from it and plot it
   plot( grf.Mp( Mp ) )



