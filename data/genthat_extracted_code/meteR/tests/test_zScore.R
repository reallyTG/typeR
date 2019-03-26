context('test of z score functions')

test_that('z score for logLik is approx chi-squared', {
  esf1 <- meteESF(S0=100, N0=500)
  sad1 <- sad(esf1)
  sadRand <- sad1$r(100)
  esf2 <- meteESF(spp=paste('sp', 1:100), abund=sadRand)
  sad2 <- sad(esf2)
  sadZ <- logLikZ(sad2, nrep=500, return.sim=TRUE)
  
  expect_true(abs(sum(sadZ$sim > sadZ$z)/length(sadZ$sim) - as.numeric(pchisq(sadZ$z, 1, lower.tail=FALSE))) < 0.05)
})
