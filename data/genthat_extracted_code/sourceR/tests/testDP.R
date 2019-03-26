context("Test Dirichlet Process inference")

# A rather basic test of the DP is to detect 4 groups
# from Poisson simulated data.  This test only checks the
# number of groups is correct, not the means of the groups.
test_that("Dirichlet process inference", {
  # Test rpois(9, c(4,4,4,40,40,40,400,400,400,1000,1000,1000))
  obs <- c(6L, 1L, 2L, 40L, 43L, 45L, 400L, 363L, 402L, 994L, 1026L, 994L)

  mu <- DirichletProcessNode$new(theta = 10, s = rep(1,length(obs)), alpha = 0.1,
                                 base = dgamma, shape = 1,
                                 rate = 0.1, name = 'mu')
  offset <- DataNode$new(rep(1, length(obs)), name='offset')
  y <- PoissonNode$new(obs, lambda=mu, offset=offset, name = 'y')

  upd <- PoisGammaDPUpdate$new(mu)

  iter <- 1000
  posterior <- matrix(nrow=iter, ncol=length(obs))
  posterior[1,] <- mu$getData()
  for(i in 2:1000) {
    upd$update()
    posterior[i,] <- mu$getData()
  }
  nGrp <- apply(posterior,1,function(x) length(unique(x)))
  ux <- unique(nGrp)
  m <- ux[which.max(tabulate(match(nGrp,ux)))]
  expect_equal(m, 4)
})
