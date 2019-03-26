library( testthat )

context("estimate_systematic() functions test.")



test_that("estimate oracle", {

  df = make.randomized.dat( 100, beta.vec=c(-1,-1,1) )

  orc = estimate_systematic(Y.1 + Y.0 ~ Z, data=df, interaction.formula = ~ A + B)
  expect_equivalent( coef( orc ), c(-1, -1, 1) )
  coef( orc )

  ess = estimate_systematic( Yobs ~ Z, data=df, interaction.formula = ~ A + B )
  coef( ess )

  df2 = df[c("A","B","Yobs","Z") ]
  names(df2) = c( "AA", "BB", "myY", "myZ" )
  rs = estimate_systematic( myY ~ myZ, data=df2, interaction.formula = ~ AA + BB )
  coef( rs )

  expect_equivalent( coef( ess ), coef( rs ) )

} )



test_that( "OLS estimation corresponds to lm", {

  df = make.randomized.dat( 100, beta.vec=c(-1,-1,1) )


  # The simple interaction approach using OLS
  M0 = lm( Yobs ~ (A+B) * Z, data=df )
  M0

  # same in our wrapper.  Sanity check
  M.ols = estimate_systematic( Yobs ~ Z, interaction.formula = ~ A + B, data=df, method="OLS" )
  M.ols

  expect_equivalent( coef( M.ols ), coef(M0)[4:6] )

} )



test_that( "Main methods run without crashing", {

    df = make.randomized.dat( 100, beta.vec=c(-1,-1,1) )

    ## calc.beta.oracle
    tst = estimate_systematic(Y.1 + Y.0 ~ Z, data = df, interaction.formula = ~ A + B,
                   method = "RI")
    r2.tst <- R2(tst)
    tst = estimate_systematic(Y.1 + Y.0 ~ Z, data = df, interaction.formula = ~ A + B,
                   method = "OLS")
    r2.tst <- R2(tst)

    ## calc.beta
    tst = estimate_systematic(Yobs ~ Z, data = df, interaction.formula = ~ A, method = "RI")
    r2.tst <- R2(tst)
    tst = estimate_systematic(Yobs ~ Z, data = df, interaction.formula = ~ A,
                   control.formula = ~ B + C, method = "RI")
    r2.tst <- R2(tst)
    tst = estimate_systematic(Yobs ~ Z, data = df, interaction.formula = ~ A, method = "OLS")
    r2.tst <- R2(tst)
    tst = estimate_systematic(Yobs ~ Z, data = df, interaction.formula = ~ A,
                   control.formula = ~ B + C, method = "OLS")
    r2.tst <- R2(tst)
    expect_is( tst, "RI.regression.result" )
} )



test_that( "Clever dot notation for formula works", {
  
  df = make.randomized.dat( 100, beta.vec=c(-1,-1,1) )
  head( df )
  df = dplyr::select( df, A, B, C, Z, Yobs )
  
  tst = estimate_systematic( Yobs ~ Z, data = df, interaction.formula = ~ . - Z - Yobs, method = "RI")
  summary( tst )
  expect_equal( length( coef( tst ) ), 4 )

  tst = estimate_systematic( Yobs ~ Z, data = df, interaction.formula = ~ A, 
                             control.formula = ~ . - Z - Yobs, method = "RI")
  summary( tst )
  expect_equal( length( coef( tst ) ), 2 )
  
} )


test_that( "Main complier methods work", {
  
    ## calc.beta.LATE
    df = make.randomized.compliance.dat( 100 )

    tst = estimate_systematic(Yobs ~ D | Z, data = df, interaction.formula = ~ A + B,
                   method = "RI")
    
    r2.tst <- R2(tst)
    tst = estimate_systematic(Yobs ~ D | Z, data = df, interaction.formula = ~ A + B,
                   method = "2SLS")
    
    r2.tst <- R2(tst)
    expect_is( tst, "RI.regression.result" )
    
} )




