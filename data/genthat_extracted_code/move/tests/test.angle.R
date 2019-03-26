context("angle")
test_that("angle",{
  expect_equal(angle(move(rep(0,10), 0:9, Sys.time()+1:10, proj=CRS("+proj=longlat"))), rep(0,9))
  expect_equal(angle(move(0:9,rep(0,10), Sys.time()+1:10, proj=CRS("+proj=longlat"))), rep(90,9))
  expect_equal(angle(move(9:0,rep(0,10), Sys.time()+1:10, proj=CRS("+proj=longlat"))), rep(-90,9))
  expect_equal(angle(move(9:0,rep(0,10), Sys.time()+1:10, proj=CRS("+proj=longlat"), animal=gl(2,5))), list(X1=rep(-90,4),X2=rep(-90,4)))
  })