library( testthat )
library( hettx )

context("detect_idiosyncratic() functions test.")

test_that("FRTCI Runs", {
    data(ToyData)
    ## Set parameters
    B <- 20
    grid.size = 11

    ## Test for ideosyncratic treatment effect variation without covariates
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, B=B, grid.size = grid.size, verbose=FALSE)

    expect_false( is.null( tst ) )
    expect_is( tst, "FRTCI.test" )
    expect_equal( tst$test.stat, "SKS.stat" )
    
    s = summary( tst )
    s
    expect_equal( length( s$p.value.CI ), 2 )
})


test_that("Passing function for test stat works", {
  data(ToyData)
  ## Set parameters
  B <- 20
  grid.size = 11
  
  ## Test for ideosyncratic treatment effect variation without covariates
  tst = detect_idiosyncratic(Y ~ Z, data = ToyData, B=B, grid.size = grid.size, verbose=FALSE,
                             test.stat = SKS.stat)
  
  expect_false( is.null( tst ) )
  expect_is( tst, "FRTCI.test" )
  expect_equal( tst$test.stat, "SKS.stat" )
  
  summary( tst )
})



test_that( "Example code from documentation, copied over", {
    data(ToyData)

    B <- 20
    grid.size = 51
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, B=B, grid.size = grid.size, verbose=FALSE)
    tst
    plot( tst )
    
   
    expect_warning( tst <- detect_idiosyncratic(Y ~ Z, data = ToyData, plugin = TRUE, verbose=FALSE) )
    
    tst <- detect_idiosyncratic(Y ~ Z, data = ToyData, interaction.formula = ~ x1, B=B, verbose=FALSE )
    tst
    expect_equal( c(500,1), dim( tst$W ) )
    summary( tst )
})


test_that( "Variance ratio test works", {
  data( ToyData )
  vrt <- variance.ratio.test( Y, Z, data=ToyData )
  expect_true( vrt$pvalue <= 0.05 )
})


test_that( "get.p.value works", {
  data( ToyData )
  tst <- detect_idiosyncratic(Y ~ Z, data = ToyData, interaction.formula = ~ x1, B=10, verbose=FALSE )
  pv = get.p.value( tst )
  expect_equal( length( pv ), 4 )
})


test_that( "Every non-rq test statistic works", {

    data(ToyData)

    B <- 20
    grid.size = 11

    ## -------------
    ## Test defaults
    ## -------------
    ToyData$W.fact <- as.factor(sample(c("A", "B"), nrow(ToyData), replace = TRUE))
    
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, B=B, grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, control.formula = ~ x1 + x2, B=B, grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, interaction.formula = ~ x3 + x4, B=B, grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, interaction.formula = ~ x3 + x4, control.formula = ~ x1 + x2, B=B, grid.size=grid.size, verbose=FALSE)

    ## ------------------------------------------------
    ## Test statistics for no adjustment or interaction
    ## ------------------------------------------------
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, test.stat="KS.stat", B=B, grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, test.stat="SKS.stat", B=B, grid.size=grid.size, verbose=FALSE)

    ## ----------------------------------------------
    ## Test statistics for adjustment, no interaction
    ## ----------------------------------------------
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, control.formula = ~ x1 + x2, test.stat="SKS.stat.cov.pool", B=B, grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, control.formula = ~ x1 + x2, test.stat="SKS.stat.cov", B=B, grid.size=grid.size, verbose=FALSE)

    ## ----------------------------------------------
    ## Test statistics for interaction, no adjustment
    ## ----------------------------------------------

    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, interaction.formula = ~ x3 + x4, test.stat="SKS.stat.int.cov.pool", B=B, grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, interaction.formula = ~ x3 + x4, test.stat="SKS.stat.int.cov", B=B, grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, interaction.formula = ~ W.fact, test.stat="WSKS.t", B=B, grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, interaction.formula = ~ W.fact, test.stat="SKS.pool.t", B=B, grid.size=grid.size, verbose=FALSE)

    ## ----------------------------------------------
    ## Test statistics for interaction and adjustment
    ## ----------------------------------------------

    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, interaction.formula = ~ x3 + x4, control.formula = ~ x1 + x2, test.stat="SKS.stat.int.cov.pool", B=B, grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, interaction.formula = ~ x3 + x4, control.formula = ~ x1 + x2, test.stat="SKS.stat.int.cov", B=B, grid.size=grid.size, verbose=FALSE)

    expect_equal( class( tst ), "FRTCI.test" ) 
})




test_that( "rq test statistic works", {
    
    data(ToyData)
    
    B <- 20
    grid.size = 11
    
    ## -------------
    ## Test defaults
    ## -------------
    X <- model.matrix(~ x1 + x2, data = ToyData)[,-1]
    W <- model.matrix(~ x3 + x4, data = ToyData)[,-1]
    W.fact <- as.factor(sample(c("A", "B"), nrow(W), replace = TRUE))
    
    
    ## ------------------------------------------------
    ## Test statistics for no adjustment or interaction
    ## ------------------------------------------------
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData,
                               test.stat="rq.stat", B=B,
                               grid.size=grid.size, verbose=FALSE)
    
    ## ----------------------------------------------
    ## Test statistics for adjustment, no interaction
    ## ----------------------------------------------
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, control.formula = ~ x1 + x2,
                               test.stat="rq.stat.cond.cov", B=B,
                               grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, control.formula = ~ x1 + x2,
                               test.stat="rq.stat.uncond.cov", B=B,
                               grid.size=grid.size, verbose=FALSE)
    tst = detect_idiosyncratic(Y ~ Z, data = ToyData, control.formula = ~ x1 + x2,
                               test.stat="SKS.stat.cov.rq", B=B,
                               grid.size=grid.size, verbose=FALSE)   
    
    expect_is( tst, "FRTCI.test" )
})

