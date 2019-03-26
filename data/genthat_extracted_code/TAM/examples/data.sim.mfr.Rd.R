library(TAM)


### Name: data.sim.mfr
### Title: Simulated Multifaceted Data
### Aliases: data.sim.mfr data.sim.facets
### Keywords: datasets

### ** Examples

#######
# sim multi faceted Rasch model
data(data.sim.mfr)
data(data.sim.facets)

  # 1: A-matrix test_rater
  test_1_items <- TAM::.A.matrix( data.sim.mfr, formulaA=~rater,
            facets=data.sim.facets, constraint="items" )
  test_1_cases <- TAM::.A.matrix( data.sim.mfr, formulaA=~rater,
            facets=data.sim.facets, constraint="cases" )

  # 2: test_item+rater
  test_2_cases <- TAM::.A.matrix( data.sim.mfr, formulaA=~item+rater,
            facets=data.sim.facets, constraint="cases" )

  # 3: test_item+rater+topic+ratertopic
  test_3_items <- TAM::.A.matrix( data.sim.mfr, formulaA=~item+rater*topic,
            facets=data.sim.facets, constraint="items" )
  # conquest uses a different way of ordering the rows
  # these are the first few rows of the conquest design matrix
  # test_3_items$A[grep("item1([[:print:]])*topic1", rownames(test_3_items)),]

  # 4: test_item+step
  test_4_cases <- TAM::.A.matrix( data.sim.mfr, formulaA=~item+step,
            facets=data.sim.facets, constraint="cases" )

  # 5: test_item+item:step
  test_5_cases <- TAM::.A.matrix( data.sim.mfr, formulaA=~item+item:step,
            facets=data.sim.facets, constraint="cases" )
  test_5_cases$A[, grep("item1", colnames(test_5_cases)) ]

  # 5+x: more
  #=> 6: is this even well defined in the conquest-design output
  #          (see test_item+topicstep_cases.cqc / .des)
  #        regardless of the meaning of such a formula;
  #        currently .A.matrix throws a warning
  # test_6_cases <- TAM::.A.matrix( data.sim.mfr, formulaA=~item+topic:step,
  #                 facets=data.sim.facets, constraint="cases" )
  test_7_cases <- TAM::.A.matrix( data.sim.mfr, formulaA=~item+topic+topic:step,
            facets=data.sim.facets, constraint="cases" )

## Not run: 
##D   #=> 8: same as with 6
##D   test_8_cases <- TAM::.A.matrix( data.sim.mfr, formulaA=~item+rater+item:rater:step,
##D             facets=data.sim.facets, constraint="cases" )
##D ## [1] "Can't proceed the estimation: Lower-order term is missing."
##D   test_9_cases <- TAM::.A.matrix( data.sim.mfr, formulaA=~item+step+rater+item:step+item:rater,
##D             facets=data.sim.facets, constraint="cases" )
##D   test_10_cases <- TAM::.A.matrix( data.sim.mfr, formulaA=~item+female+item:female,
##D             facets=data.sim.facets, constraint="cases" )
##D 
##D   ### All Design matrices
##D   test_1_cases <- TAM::designMatrices.mfr( data.sim.mfr, formulaA=~rater,
##D             facets=data.sim.facets, constraint="cases" )
##D   test_4_cases <- TAM::designMatrices.mfr( data.sim.mfr, formulaA=~item+item:step,
##D             facets=data.sim.facets, constraint="cases" )
##D 
##D   ### TAM
##D   test_4_cases <- TAM::tam.mml.mfr( data.sim.mfr, formulaA=~item+item:step )
##D   test_tam <- TAM::tam.mml( data.sim.mfr )
##D 
##D   test_1_cases <- TAM::tam.mml.mfr( data.sim.mfr, formulaA=~rater,
##D             facets=data.sim.facets, constraint="cases" )
##D   test_2_cases <- TAM::tam.mml.mfr( data.sim.mfr, formulaA=~item+rater,
##D             facets=data.sim.facets, constraint="cases" )
## End(Not run)



