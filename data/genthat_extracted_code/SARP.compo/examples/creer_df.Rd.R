library(SARP.compo)


### Name: creer_data.frame
### Title: Create p-values data-frame from pairwise tests of all possible
###   ratios of a compositional vector
### Aliases: creer_data.frame creer.DFp create.DFp
### Keywords: compositional

### ** Examples

   # load the Circadian Genes Expression dataset, at day 4
   data( "BpLi_J4" )
   ng <- names( BpLi_J4 )[ -c( 1:3 ) ] # Name of the genes
   
   # analysis function (complex design)
   #   1. the formula to be used
   frm <- R ~  (1 | Patient) + Phenotype + Li + Phenotype:Li

   #   2. the function itself
   #    needs the lme4 package
   if ( TRUE == require( "lme4" ) ) {
     f.p <- function( d, variable, ... ) {
          # Fit the model
          md <- lmer( frm, data = d )

          # Get coefficients and standard errors
          cf <- fixef( md )
          se <- sqrt( diag( vcov( md ) ) )

          # Wald tests on these coefficients
          p <- 2 * pnorm( -abs( cf ) / se )

          # Sending back the 4 p-values
          p
     }
 
     # CRAN does not like 'long' computations
     # => analyse only the first 6 genes
     #  (remove for real exemple!)
     ng <- ng[ 1:6 ]

     # Create the data.frame with all results
     DF.p <- creer.DFp( d = BpLi_J4, noms = ng,
                        f.p = f.p, add.col = c( 'p.NR', 'p.Li', 'p.I' ) )

     # Make a graphe from it and plot it
     #  for the interaction term, at the p = 0.2 threshold
     plot( grf.DFp( DF.p, p = 0.20, col.p = 'p.I' ) )
  }



