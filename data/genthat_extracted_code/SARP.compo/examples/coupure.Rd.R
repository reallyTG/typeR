library(SARP.compo)


### Name: coupures.Mp
### Title: Finding cut-offs for graph disjonctions
### Aliases: coupures.Mp plot.Coupures
### Keywords: compositional

### ** Examples

   # load the potery data set
   data( poteries )

   # Compute one-way ANOVA p-values for all ratios in this data set   
   Mp <- creer.Mp( poteries, c( 'Al', 'Na', 'Fe', 'Ca', 'Mg' ),
                   f.p = anva1.fpc, v.X = 'Site' )

   # Where would be the cut-offs?
   seuils <- coupures.Mp( Mp )
   seuils

   # Drawing this, in log10 scale
   plot( seuils, en.log = TRUE )



