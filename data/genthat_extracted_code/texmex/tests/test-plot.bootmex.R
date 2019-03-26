context("plot.bootmex")

test_that("plot.bootmex behaves as it should", {
  skip_on_cran()
  skip_on_travis()
    
  set.seed(3141593)
  
  # 2-d wavesurge data
  
  wavesurge.fit <- mex(wavesurge,which=1,mqu=0.7,dqu=0.7) 
  wavesurge.boot <- bootmex(wavesurge.fit,R=50,trace=51)
  par(mfrow=c(3,2),pty="m")
  check1 <- plot(wavesurge.boot,main="Marginal parameters\nWave surge data of Coles 2001")
  check2 <- plot(wavesurge.boot,plots="dep",main="Dependence parameters\nWave surge data of Coles 2001\nLaplace margins")
  
  # 5-d air pollution data
  
  Qu <- 0.7
  mqus <- c(.9, .7, .7, .85, .7)
  mquw <- 0.7
  smarmex.O3   <- mex(summer, mqu=mqus, which = 1, dqu = Qu, penalty="none",margins="gumbel",constrain=FALSE)
  wmarmex.O3   <- mex(winter, mqu=mquw, which = 1, dqu = Qu, penalty="none",margins="gumbel",constrain=FALSE)
  smarmex.NO2  <- mex(summer, mqu=mqus, which = 2, dqu = Qu, penalty="none",margins="gumbel",constrain=FALSE)
  wmarmex.NO2  <- mex(winter, mqu=mquw, which = 2, dqu = Qu, penalty="none",margins="gumbel",constrain=FALSE)
  smarmex.NO   <- mex(summer, mqu=mqus, which = 3, dqu = Qu, penalty="none",margins="gumbel",constrain=FALSE)
  wmarmex.NO   <- mex(winter, mqu=mquw, which = 3, dqu = Qu, penalty="none",margins="gumbel",constrain=FALSE)
  smarmex.SO2  <- mex(summer, mqu=mqus, which = 4, dqu = Qu, penalty="none",margins="gumbel",constrain=FALSE)
  wmarmex.SO2  <- mex(winter, mqu=mquw, which = 4, dqu = Qu, penalty="none",margins="gumbel",constrain=FALSE)
  smarmex.PM10 <- mex(summer, mqu=mqus, which = 5, dqu = Qu, penalty="none",margins="gumbel",constrain=FALSE)
  wmarmex.PM10 <- mex(winter, mqu=mquw, which = 5, dqu = Qu, penalty="none",margins="gumbel",constrain=FALSE)
  
  Qu <- 0.7
  R <- 50
  
  Sboot.O3 <- bootmex(smarmex.O3, R=R,trace=R+1)
  Wboot.O3 <- bootmex(wmarmex.O3, R=R,trace=R+1)
  Sboot.NO2 <- bootmex(smarmex.NO2, R=R,trace=R+1)
  Wboot.NO2 <- bootmex(wmarmex.NO2, R=R,trace=R+1)
  Sboot.NO <- bootmex(smarmex.NO, R=R,trace=R+1)
  Wboot.NO <- bootmex(wmarmex.NO, R=R,trace=R+1)
  Sboot.SO2 <- bootmex(smarmex.SO2, R=R,trace=R+1)
  Wboot.SO2 <- bootmex(wmarmex.SO2, R=R,trace=R+1)
  Sboot.PM10 <- bootmex(smarmex.PM10, R=R,trace=R+1)
  Wboot.PM10 <- bootmex(wmarmex.PM10, R=R,trace=R+1)
  
  par(mfrow=c(3,2))
  check3 <- plot(Sboot.O3,plots="dep",main="Summer air pollution data\nFig.5 Heffernan & Tawn 2004",xlim=c(0,1),ylim=c(-1,1))
  plot(Wboot.O3,plots="dep",main="Winter air pollution data\nFig.5 Heffernan & Tawn 2004",xlim=c(0,1),ylim=c(-1,1))
  plot(Sboot.NO2,plots="dep",main="Summer air pollution data\nFig.5 Heffernan & Tawn 2004",xlim=c(0,1),ylim=c(-1,1))
  plot(Wboot.NO2,plots="dep",main="Winter air pollution data\nFig.5 Heffernan & Tawn 2004",xlim=c(0,1),ylim=c(-1,1))
  plot(Sboot.NO,plots="dep",main="Summer air pollution data\nFig.5 Heffernan & Tawn 2004",xlim=c(0,1),ylim=c(-1,1))
  plot(Wboot.NO,plots="dep",main="Winter air pollution data\nFig.5 Heffernan & Tawn 2004",xlim=c(0,1),ylim=c(-1,1))
  plot(Sboot.SO2,plots="dep",main="Summer air pollution data\nFig.5 Heffernan & Tawn 2004",xlim=c(0,1),ylim=c(-1,1))
  plot(Wboot.SO2,plots="dep",main="Winter air pollution data\nFig.5 Heffernan & Tawn 2004",xlim=c(0,1),ylim=c(-1,1))
  plot(Sboot.PM10,plots="dep",main="Summer air pollution data\nFig.5 Heffernan & Tawn 2004",xlim=c(0,1),ylim=c(-1,1))
  plot(Wboot.PM10,plots="dep",main="Winter air pollution data\nFig.5 Heffernan & Tawn 2004",xlim=c(0,1),ylim=c(-1,1))
  
  expect_that(check1, equals(NULL), label="plot.bootmexsuccessfulexecutionofplottingcode2-ddata")
  expect_that(check2, equals(NULL), label="plot.bootmexsuccessfulexecutionofplottingcode2-ddata")
  expect_that(check3, equals(NULL), label="plot.bootmexsuccessfulexecutionofplottingcode3-ddata")
}
)
