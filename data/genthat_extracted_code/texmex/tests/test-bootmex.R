context("bootmex")

test_that("bootmex behaves as it should", {
  skip_on_cran()
  skip_on_travis()
  # this is a weak test - it tests the structure  # of the output but not the correctness of the bootstrap coefficients; it will
  # also catch ERRORs (as opposed to FAILUREs) if the code breaks.  For strong
  # testing of this function, run test.predict.mex
  
  set.seed(20120327)
  smarmod <- migpd(summer, mqu=c(.9, .7, .7, .85, .7), penalty="none")
  wmarmod <- migpd(winter, mqu=.7,  penalty="none")
  
  mySdep <- mexDependence(smarmod, dqu=.7, which=1)
  myWdep <- mexDependence(wmarmod, dqu=.7, which=1)
  
  R <- 20
  
  mySboot <- bootmex(mySdep, R=R,trace=R+1)
  myWboot <- bootmex(myWdep, R=R,trace=R+1)
  
  expect_that(coef(mySdep)[[2]], equals(mySboot$simpleDep), label="bootmex:summersimpleDepfromcallwithmarmodel")
  expect_that(coef(myWdep)[[2]], equals(myWboot$simpleDep), label="bootmex:wintersimpleDepfromcallwithmarmodel")
  
  expect_that(coef(smarmod), equals(coef(mySboot$simpleMar)), label="bootmex:summersimpleMarfromcallwithmarmodel")
  expect_that(coef(wmarmod), equals(coef(myWboot$simpleMar)), label="bootmex:wintersimpleMarfromcallwithmarmodel")
  
  expect_that(dim(mySboot$boot[[1]]$Z)[2], equals(dim(mySdep$dependence$Z)[2]), label="bootmex:summerdimofresidualsfromcallwithmarmodel")
  expect_that(dim(myWboot$boot[[1]]$Z)[2], equals(dim(myWdep$dependence$Z)[2]), label="bootmex:winterdimofresidualsfromcallwithmarmodel")
  
  expect_that(dim(mySboot$boot[[1]]$dependence), equals(dim(coef(mySdep)[[2]])), label="bootmex:summerdimofcoefficientsfromcallwithmarmodel")
  expect_that(dim(myWboot$boot[[1]]$dependence), equals(dim(coef(myWdep)[[2]])), label="bootmex:winterdimofcoefficientsfromcallwithmarmodel")
  
  expect_that(R, equals(length(mySboot$boot)), label="bootmex:numberofbootstrapsamples")
  expect_that(R, equals(length(myWboot$boot)), label="bootmex:numberofbootstrapsamples")
  
  expect_that(dim(summer), equals(dim(mySboot$boot[[1]]$Y)), label="bootmex:sizeofbootstrapdataset")
  expect_that(dim(winter), equals(dim(myWboot$boot[[5]]$Y)), label="bootmex:sizeofbootstrapdataset")
  
  smexmod <- mex(summer, mqu=c(.9, .7, .7, .85, .7), penalty="none", dqu=.7, margins="gumbel",constrain=FALSE, which=1)
  wmexmod <- mex(winter, mqu=.7,  dqu=.7, penalty="none", margins="gumbel",constrain=FALSE, which=1)
  
  mySboot <- bootmex(smexmod, R=R,trace=R+1)
  myWboot <- bootmex(wmexmod, R=R,trace=R+1)
  
  expect_that(coef(smexmod)[[2]], equals(mySboot$simpleDep), label="bootmex:summersimpleDepfromcallwithmexmodel")
  expect_that(coef(smexmod)[[1]], equals(coef(mySboot$simpleMar)), label="bootmex:summersimpleMarfromcallwithmexmodel")
  
  expect_that(coef(wmexmod)[[2]], equals(myWboot$simpleDep), label="bootmex:wintersimpleDepfromcallwithmexmodel")
  expect_that(coef(wmexmod)[[1]], equals(coef(myWboot$simpleMar)), label="bootmex:wintersimpleMarfromcallwithmexmodel")
  
  expect_that(R, equals(length(mySboot$boot)), label="bootmex:numberofbootstrapsamples")
  expect_that(R, equals(length(myWboot$boot)), label="bootmex:numberofbootstrapsamples")
  
  expect_that(dim(summer), equals(dim(mySboot$boot[[1]]$Y)), label="bootmex:sizeofbootstrapdataset")
  expect_that(dim(winter), equals(dim(myWboot$boot[[5]]$Y)), label="bootmex:sizeofbootstrapdataset")
  
  smexmod.1 <- mex(summer, mqu=c(.9, .7, .7, .85, .7), penalty="none", dqu=.7, margins="laplace",constrain=FALSE, which=1)
  smexmod.2 <- mex(summer, mqu=c(.9, .7, .7, .85, .7), penalty="none", dqu=.7, margins="laplace",constrain=TRUE,v=2, which=1)
  mySboot.1 <- bootmex(smexmod.1,R=R,trace=R+1)
  mySboot.2 <- bootmex(smexmod.2,R=R,trace=R+1)
  
  expect_that(coef(smexmod.1)[[2]], equals(mySboot.1$simpleDep), label="bootmex:summersimpleDepfromcallwithmexmodel,constrain=FASLE")
  expect_that(coef(smexmod.1)[[1]], equals(coef(mySboot.1$simpleMar)), label="bootmex:summersimpleMarfromcallwithmexmodel,constrain=FASLE")
  expect_that(coef(smexmod.2)[[2]], equals(mySboot.2$simpleDep), label="bootmex:summersimpleDepfromcallwithmexmodel,v=2")
  expect_that(coef(smexmod.2)[[1]], equals(coef(mySboot.2$simpleMar)), label="bootmex:summersimpleMarfromcallwithmexmodel,v=2")
  
  # check execution of for 2-d data
  
  wavesurge.fit <- migpd(wavesurge,mqu=.7)
  wavesurge.mex <- mexDependence(wavesurge.fit, dqu=0.8,which=1)
  R <- 20
  
  wavesurge.boot <- bootmex(wavesurge.mex,R=R,trace=R+1)
  
  expect_that(dim(wavesurge.boot$boot[[1]]$Z)[2], equals(1), label="bootmex:executionfor2-ddata")
  expect_that(dimnames(wavesurge.boot$boot[[1]]$Z)[[2]], equals(names(wavesurge)[2]), label="bootmex:executionfor2-ddata")
  expect_that(length(wavesurge.boot$boot), equals(R), label="bootmex:executionfor2-ddata")
}
)
