context("thinAndBurn.evmSim")

test_that("thinAndBurn.evmSim behaves as it should", {
  skip_on_cran()
  skip_on_travis()
    
  # generate data to use for checking
  d <- sample(3:10,1)
  nrow <- 100
  x <- list(chains = apply(matrix(rep(1:d,each=nrow),ncol=d),2, function(o) o*1:nrow))
  oldClass(x) <- "evmSim"
  
  # test appropriate errors for misspecification of thin and burn
  
  expect_error(thinAndBurn(x, burn=2), label="thinAndBurn.evmSim:errorsformisspecificationofthinandburn")
  expect_error(thinAndBurn(x, thin=1), label="thinAndBurn.evmSim:errorsformisspecificationofthinandburn")
  
  #  test burn in
  burn <- sample(nrow/2,1)
  burnOnly <- thinAndBurn(x,burn=burn,thin=1)
  expect_that(x$chains[burn+1, ], equals(burnOnly$param[1, ]), label="thinAndBurn.evmSim:burnin")
  
  # test thinning
  thin <- 2
  thinOnly <- thinAndBurn(x,thin=thin,burn=0)
  
  expect_that(seq(thin, nrow, by=thin), equals(thinOnly$param[, 1]), label="thinAndBurn.evmSim:thinning")
  
  # test thinning and burning simultaneously
  
  thinBurn <- thinAndBurn(x,thin=thin,burn=burn)
  
  expect_that(seq(burn+thin, nrow, by=thin), equals(thinBurn$param[, 1]), label="thinAndBurn.evmSim:thinningandburningsimultaneously")
  
  # test returned values of thin and burn
  
  expect_that(thin, equals(thinBurn$thin, burn=0), label="thinAndBurn.evmSim:testreturnedvalueofthin")
  expect_that(burn, equals(thinBurn$burn, thin=1), label="thinAndBurn.evmSim:testreturnedvalueofburn")
  
  # test passing thin and burn via object
  
  x$thin <- thin
  x$burn <- burn
  thinBurn1 <- thinAndBurn(x)
  
  expect_that(seq(burn+thin, nrow, by=thin), equals(thinBurn1$param[, 1]), label="thinAndBurn.evmSim:testpassingthinandburnviaobject")
  expect_that(dim(thinBurn$param), equals(dim(thinBurn1$param)), label="thinAndBurn.evmSim:testpassingthinandburnviaobject")
  
  # test thinning and burning a previously thinned and burned object
  
  thin2 <- 4
  burn2 <- 4
  thinBurn2 <- thinAndBurn(thinBurn1,thin=thin2,burn=burn2)
  expect_that(dim(thinBurn1$chains)[2], equals(dim(thinBurn2$chains)[2]), label="thinAndBurn.evmSim:thinningandburningapreviouslythinnedandburnedobject")
  expect_that((nrow-burn2)/thin2, equals(dim(thinBurn2$param)[1]), label="thinAndBurn.evmSim:thinningandburningapreviouslythinnedandburnedobject")
}
)
