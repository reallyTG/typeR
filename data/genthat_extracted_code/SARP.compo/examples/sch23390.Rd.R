library(SARP.compo)


### Name: SCH23390
### Title: Effect of MDMA and SCH23390 on gene expression
### Aliases: sch23390 SCH23390
### Keywords: datasets

### ** Examples

  data( SCH23390 )
  # Optimal cut-off for five genes and alpha = 0.05
  #  is around 0.13

  # First step, experimental check
  #
  # MDMA should change expression levels of all genes but the reference
  #  1) extract the data for the Ctrl vs MDMA groups comparison
  d.MDMA <- SCH23390[ which( SCH23390$Groupe %in% c( 'Ctrl', 'MDMA' ) ), ]
  M.MDMA <- creer.Mp( d = d.MDMA, noms = names( d.MDMA )[ 4:8 ], log = TRUE,
                      f.p = student.fpc, v.X = 'MDMA' )

  #  2) L'arbre associé
  plot( arbre.Mp( M.MDMA, reference = 'Hprt' ),
        seuil.p = c( 0.137, 0.128, 0.147 ) )

  #  3) Le graphe pour le seuil optimal
  #    => indeed, all genes are modified by MDMA
  #       Fos and Fosb seems to have the same behavior
  plot( grf.Mp( M.MDMA, reference = 'Hprt', p = 0.13 ) )

  
  # Second step, experiment analysis
  # Does SCH23390 modulate the MDMA effect?
  #   => interaction term in a two-ways analysis of variance
  M.I <- creer.Mp( d = SCH23390, noms = names( SCH23390 )[ 4:8 ], log = TRUE,
                   f.p = anva_SC.fpc,
                   frm = R ~ MDMA + SCH23390 + MDMA:SCH23390, SC = 3 )


  #  2) L'arbre associé
  plot( arbre.Mp( M.I, reference = 'Hprt' ),
        seuil.p = c( 0.137, 0.128, 0.147 ) )

  #  3) Le graphe pour le seuil optimal
  #    => no clear detection of interaction
  plot( grf.Mp( M.I, reference = 'Hprt', p = 0.13 ) )



