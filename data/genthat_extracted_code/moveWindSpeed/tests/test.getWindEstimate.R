context("Generated examples")
test_that("getWindEstimate",{
  set.seed(3523)
  sd<-.8
  s<-rnorm(30000, 10, sd = sd)
  h<-1:length(s)/4
  w<-4:5
  d<-data.frame(t=1:length(s), vx=w[1]+sin(h)*s, vy=w[2]+cos(h)*s)
  expect_is(res<-getWindEstimate(as.matrix(d[,2:3]), 0, c(1,0)),'list')
  expect_equal(res[['windEst']], w, tolerance=.001)
  expect_equal(res[['residualVarAirSpeed']], sd^2, tolerance=.001)
  
  })