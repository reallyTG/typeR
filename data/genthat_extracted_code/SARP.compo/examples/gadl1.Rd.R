library(SARP.compo)


### Name: GADL1
### Title: Gene expression change in bipolar disorder
### Aliases: gadl1 GADL1
### Keywords: datasets

### ** Examples

  data( GADL1 )
  # Optimal cut-off for ten genes and alpha = 0.05
  #  is around 0.22

  # First step, is there differences between healthy subjects
  #   and patients ?
  #
  M.m <- creer.Mp( d = GADL1, noms = names( GADL1 )[ -c( 1:3 ) ],
                   f.p = student.fpc, v.X = 'Groupe' )

  #  2) L'arbre associé
  #  [reference gene for plotting purpose]
  n.ref <- grep( 'HPRT|SDHA', names( GADL1 ), value = TRUE )
  plot( arbre.Mp( M.m, reference = n.ref ),
        seuil.p = c( 0.218, 0.207, 0.230 ) )

  #  3) Le graphe pour le seuil optimal
  #    => only IGF1 seems to behave differently
  #       (but it has missing values, so interpretation is difficult)
  plot( grf.Mp( M.m, reference = n.ref, p = 0.22 ) )

  
  # Second step, is there differences between patients
  #   that respond or not respond to treatment?
  d.R <- GADL1[ which( GADL1$Groupe == 'BPD' ), ]
  M.R <- creer.Mp( d = d.R, noms = names( GADL1 )[ -c( 1:3 ) ],
                   f.p = student.fpc, v.X = 'Phenotype' )

  #  2) L'arbre associé
  plot( arbre.Mp( M.R, reference = n.ref ),
        seuil.p = c( 0.218, 0.207, 0.230 ) )

  #  3) Le graphe pour le seuil optimal
  #    => no sign of any difference
  plot( grf.Mp( M.R, reference = n.ref, p = 0.22 ) )



