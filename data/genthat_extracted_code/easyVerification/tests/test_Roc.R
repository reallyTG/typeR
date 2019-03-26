library(easyVerification)
context('ROC scores')

obs <- diag(1, 4)[-4,]
fcst <- obs
fcst2 <- obs*0.2 + 0.2
fcst3 <- array(0.25, dim(obs))
obs2 <- rbind(diag(1, 4)[-4,], diag(1, 4)[-3,], diag(1,4)[-1,])
fcst4 <- pmax(obs2 + runif(length(obs2)), 0)
fcst4 <- fcst4 / rowSums(fcst4)

test_that('ROC area values', {
  for (use.easy in c(FALSE, TRUE)){
    expect_is(EnsRoca(fcst, obs, use.easy=use.easy), 'list')
    expect_equal(length(EnsRoca(fcst, obs, use.easy=use.easy)), 8)
    expect_equal(EnsRoca(fcst, obs, use.easy=use.easy)[1:4], list(cat1=1, cat2=1, cat3=1, cat4=as.numeric(NA)))
    expect_equal(EnsRoca(fcst3, obs, use.easy=use.easy)[1:4], list(cat1=0.5, cat2=0.5, cat3=0.5, cat4=as.numeric(NA)))
    expect_equal(EnsRoca(fcst, obs, use.easy=use.easy), EnsRoca(fcst2, obs, use.easy=use.easy)) 
  }
  expect_equal(EnsRoca(fcst4, obs2)[1:4], EnsRoca(fcst4, obs2, use.easy=TRUE)[1:4])
})