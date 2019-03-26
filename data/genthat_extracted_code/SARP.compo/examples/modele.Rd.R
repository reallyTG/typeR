library(SARP.compo)


### Name: modele
### Title: Create a compositional model for simulations
### Aliases: modele modele_compo plot.SARPcompo.modele
### Keywords: compositional

### ** Examples

  ## Create a toy example: four components, two conditions
  ##  components 1 and 2 do not change between conditions
  ##  component  3 is doubled
  ##  component  4 is halfed
  me <- rbind( 'A' = c( 1, 1, 1, 1 ),
               'B' = c( 1, 1, 2, 0.5 ) )
  colnames( me ) <- paste0( "C-", 1:4 )

  md <- modele_compo( me )

  ## Plot it...
  plot( md )

  ## What is approximately the power to detect that something changes
  ## between conditions A and B using a Student test
  ## with a CV of around 50 % ?
  ##  (only a few simulations for speed, should be increased )
  puissance <- estimer.puissance( md, cv = 0.50, B = 50, f.p = student.fpc )
  plot( puissance )



