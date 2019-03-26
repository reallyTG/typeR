library(SARP.compo)


### Name: puissance
### Title: Estimate the power and the type-I error of the
###   disjoint-subgraphs method
### Aliases: puissance alpha estimer.puissance estimer.alpha
### Keywords: compositional

### ** Examples

  ## Create a toy example: four components, two conditions
  ##  components 1 and 2 do not change between conditions
  ##  components 3 and 4 are doubled
  ##  component  1 is a reference component
  me <- rbind( 'A' = c( 1, 1, 1, 1 ),
               'B' = c( 1, 1, 2, 2 ) )
  colnames( me ) <- paste0( "C-", 1:4 )

  md <- modele_compo( me, reference = 'C-1' )

  ## How many simulations?
  ##  50 is for speed; increase for useful results...
  B <- 50

  ## What is the optimal cut-off for this situation?
  ## (only a few simulations for speed, should be increased)
  ## (B = 3000 suggests a cut-off between 0.104 and 0.122)
  seuil <- choisir.seuil( 4, B = B )

  ## What is approximately the type I error
  ## between conditions A and B using a Student test
  ## with a CV of around 50 % ?
  ##  (only a few simulations for speed, should be increased)
  alpha <- estimer.alpha( md, cv = 0.50, B = B,
                          f.p = student.fpc )

  # Plot it : darkgreen = the disjoint graph method
  #           orange    = the alr-like method, Holm's corrected
  #           salmon    = the alr-like method, uncorrected
  plot( alpha )

  ## What is approximately the power to detect that something changes
  ## between conditions A and B using a Student test
  ## with a CV of around 50 % ?
  ##  (only a few simulations for speed, should be increased)
  puissance <- estimer.puissance( md, cv = 0.50, B = B,
                                  f.p = student.fpc,
                                  genes.attendus = c( 'C-3', 'C-4' )  )

  # Plot it : darkgreen = the disjoint graph method
  #           orange    = the alr-like method, Holm's corrected
  #           salmon    = the alr-like method, uncorrected
  plot( puissance )

  ## Do we detect the correct situation in general?
  ##  (that is, exactly two sets: one with C-1 and C-2, the second with
  ##   C-3 and C-4 --- for the alr-like method, that only C-3 and C-4
  ##   are significant)
  #           darkgreen = the disjoint graph method
  #           orange    = the alr-like method, Holm's corrected
  #           salmon    = the alr-like method, uncorrected
  plot( puissance, correct = TRUE )
  



