library(testthat)

######### testing rlr function

test_that("the trend option works in rlr function", {
  d1=simdata(nn=100, hr.linear = 2, hazard.func = "linear")
  rde=rlr(times=d1$times, status=d1$status, x=d1$x, trend='decrease')
  rin=rlr(times=d1$times, status=d1$status, x=d1$x, trend='increase')
  expect_true(all(rde[,'logrank.stat']>0))
  expect_true(all(rin[,'logrank.stat']<0))
  expect_equal(rde[,'logrank.stat']+rin[,'logrank.stat'], rep(0, nrow(rde)))

  d2=simdata(nn=100, hr.linear = 1/3, hazard.func = "linear")
  rde=rlr(times=d2$times, status=d2$status, x=d2$x, trend='decrease')
  rin=rlr(times=d2$times, status=d2$status, x=d2$x, trend='increase')
  expect_true(all(rde[,'logrank.stat']<0))
  expect_true(all(rin[,'logrank.stat']>0))
  expect_equal(rde[,'logrank.stat']+rin[,'logrank.stat'], rep(0, nrow(rde)))

  })

test_that("the method two options produce close results in rlr function", {
  d1=simdata(nn=100, hr.linear = 2, hazard.func = "linear")
  r1=rlr(times=d1$times, status=d1$status, x=d1$x, trend='decrease', method="approximate")
  r2=rlr(times=d1$times, status=d1$status, x=d1$x, trend='decrease', method="exact")
  expect_true(abs(cor(r1[,'logrank.stat'], r2[,'logrank.stat'])-0.99)<0.01)

  d2=simdata(nn=100, hr.linear = 1/3, hazard.func = "linear")
  r1=rlr(times=d1$times, status=d1$status, x=d1$x, trend='decrease', method="approximate")
  r2=rlr(times=d1$times, status=d1$status, x=d1$x, trend='decrease', method="exact")
  expect_true(abs(cor(r1[,'logrank.stat'], r2[,'logrank.stat'])-0.99)<0.01)

})


######### testing rhier function

test_that("the alt option doesn't matter in rhier function", {
  d1=simdata(nn=100, hr.linear = 2, hazard.func = "linear")
  rde=rhier(times=d1$times, status=d1$status, x=d1$x, alt='decrease')
  rin=rhier(times=d1$times, status=d1$status, x=d1$x, alt='increase')
  expect_equal(rde, rin)

  d2=simdata(nn=100, hr.linear = 1/3, hazard.func = "linear")
  rde=rhier(times=d2$times, status=d2$status, x=d2$x, alt='decrease')
  rin=rhier(times=d2$times, status=d2$status, x=d2$x, alt='increase')
  expect_equal(unlist(rde), unlist(rin))

})

########## testing rsolr12 function

test_that("the alt option works in rsolr12 function", {
  d1=simdata(nn=100, hr.linear = 2, hazard.func = "linear")
  rde=rsolr12(times=d1$times, status=d1$status, x=d1$x, alt='decrease')
  rin=rsolr12(times=d1$times, status=d1$status, x=d1$x, alt='increase')
  expect_true(all(rde[['stats.at.all.splits']][,3]>0))
  expect_true(all(rin[['stats.at.all.splits']][,3]<0))
  expect_true(all(rde[['stats.at.all.splits']][,3]+rin[['stats.at.all.splits']][,3]==0))

  d2=simdata(nn=100, hr.linear = 1/3, hazard.func = "linear")
  rde=rsolr12(times=d2$times, status=d2$status, x=d2$x, alt='decrease')
  rin=rsolr12(times=d2$times, status=d2$status, x=d2$x, alt='increase')
  expect_true(all(rde[['stats.at.all.splits']][,3]<0))
  expect_true(all(rin[['stats.at.all.splits']][,3]>0))
  expect_true(all(rde[['stats.at.all.splits']][,3]+rin[['stats.at.all.splits']][,3]==0))

})

test_that("the two method options produce similar results in rsolr12 function", {
  d1=simdata(nn=100, hr.linear = 2, hazard.func = "linear")
  r1=rsolr12(times=d1$times, status=d1$status, x=d1$x, alt='decrease', method='approximate')
  r2=rsolr12(times=d1$times, status=d1$status, x=d1$x, alt='decrease', method='exact')
  expect_equal(r1[['stats.at.all.splits']][,1],r2[['stats.at.all.splits']][,1])
  expect_equal(r1[['stats.at.all.splits']][,2],r2[['stats.at.all.splits']][,2])
  expect_true(abs(cor(r1[['stats.at.all.splits']][,3],
                      r2[['stats.at.all.splits']][,3])-0.99)<0.01)
  expect_true(abs(cor(r1[['stats.at.all.splits']][,4],
                      r2[['stats.at.all.splits']][,4])-0.99)<0.01)

  })



########## testing rmolr function

test_that("the alt option works in rmolr function", {
  d1=simdata(nn=100, hr.linear = 2, hazard.func = "linear")
  rde=rmolr(times=d1$times, status=d1$status, x=d1$x, alt='decrease')
  rin=rmolr(times=d1$times, status=d1$status, x=d1$x, alt='increase')
  expect_true(all(rde[['stats.at.all.splits']][,3]>0))
  expect_true(all(rin[['stats.at.all.splits']][,3]<0))
  expect_true(all(rde[['stats.at.all.splits']][,3]+rin[['stats.at.all.splits']][,3]==0))

  d2=simdata(nn=100, hr.linear = 1/3, hazard.func = "linear")
  rde=rmolr(times=d2$times, status=d2$status, x=d2$x, alt='decrease')
  rin=rmolr(times=d2$times, status=d2$status, x=d2$x, alt='increase')
  expect_true(all(rde[['stats.at.all.splits']][,3]<0))
  expect_true(all(rin[['stats.at.all.splits']][,3]>0))
  expect_true(all(rde[['stats.at.all.splits']][,3]+rin[['stats.at.all.splits']][,3]==0))

})

test_that("the two method options produce similar results in rmolr function", {
  d1=simdata(nn=100, hr.linear = 2, hazard.func = "linear")
  r1=rmolr(times=d1$times, status=d1$status, x=d1$x, alt='decrease', method='approximate')
  r2=rmolr(times=d1$times, status=d1$status, x=d1$x, alt='decrease', method='exact')
  expect_equal(r1[['stats.at.all.splits']][,1],r2[['stats.at.all.splits']][,1])
  expect_equal(r1[['stats.at.all.splits']][,2],r2[['stats.at.all.splits']][,2])
  expect_true(abs(cor(r1[['stats.at.all.splits']][,3],
                         r2[['stats.at.all.splits']][,3])-0.99)<0.01)

})

