library(SARP.compo)


### Name: calc.rapports
### Title: Compute all pairwise ratios of a set of variables
### Aliases: calc.rapports
### Keywords: ~kwd1 ~kwd2

### ** Examples

   # load the potery data set
   data( poteries )

   # Compute all ratios in the potery data set   
   d.r <- calc.rapports( d = poteries, noms = c( 'Al', 'Fe', 'Mg', 'Ca',
   'Na' ) )
   names( d.r )
   head( d.r )

   identical( d.r$Al.Fe.r, d.r$Al / d.r$Fe )



