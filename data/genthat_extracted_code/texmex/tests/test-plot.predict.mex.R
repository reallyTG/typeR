context("plot.predict.mex")

test_that("plot.predict.mex behaves as it should", {
  skip_on_cran()
  skip_on_travis()
    # check reproduce Figure 6 in Heffernan and Tawn
  w <- mex(winter,mqu=0.7,penalty="none", which="NO", dqu=.7, margins="gumbel", constrain=FALSE)
  noMod <- bootmex(w,trace=101)
  noPred <- predict(noMod,trace=101)
  par(mfcol=c(2,2))
  res <- plot(noPred,main="Fig. 6 Heffernan and Tawn (2004)")
  expect_that(res, equals(NULL), label="plot.predict.mex:correctexecution")
  
  # check for 2-d data
  R <- 20
  nsim <- 100
  wavesurge.mex <- mex(wavesurge,mqu=.7,,dqu=0.7,which=1, margins="laplace")
  wavesurge.boot <- bootmex(wavesurge.mex,R=R,trace=R+1)
  wavesurge.pred <- predict(wavesurge.boot,nsim=nsim,trace=R+1)
  par(mfrow=c(1,1))
  res <- plot(wavesurge.pred)
  expect_that(res, equals(NULL), label="plot.predict.mex:correctexecution")
}
)
