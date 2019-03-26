context("chi2 test statistic regression tests")

test_that("CCC chi2 test statistic regression tests", {
  testthat::skip_on_cran()
  
  set.seed(3141)
  
  
  N = 1034 # Sample size
  
  tau = 0.5
  
  # Four-dimensional Clayton copula (D-vine)
  structure = matrix(c(4,0,0,0,
                       1,3,0,0,
                       2,1,2,0,
                       3,2,1,1),4,4,TRUE)
  
  families = array(3,dim=dim(structure))
  par2 = array(0,dim=dim(structure))
  names = c("V1", "V2", "V3","V4")
  par_firstTree = BiCopTau2Par(3, tau)
  par_secondTree = par_firstTree/(1+par_firstTree)
  par_thirdTree = par_firstTree/(1+2*par_firstTree)
  par  = matrix(c(0,0,0,0,
                  par_thirdTree,0,0,0,
                  par_secondTree,par_secondTree,0,0,
                  par_firstTree,par_firstTree,par_firstTree,0),4,4,TRUE)
  
  rvm = RVineMatrix(structure,families,par,par2,names)
  rvm = RVineMatrixNormalize(rvm)
  
  U = RVineSim(N,rvm)
  rvmHat = RVineSeqEst(U,rvm)
  
  svcmDataFrameHat = pacotest:::rVineDataFrameRep(rvmHat)
  
  ind = matrix(NA,N,2)
  ind[,1] = c(rep(TRUE,N/2),rep(FALSE,N/2))
  ind[,2] = !ind[,1]
  
  res = pacotest:::testStatEqualCorrWithoutEstimation(U, svcmDataFrameHat, ind)
  resWithEstimation = pacotest:::testStatEqualCorrWithEstimation(U, svcmDataFrameHat, ind)
  
  
  expect_equal(res$testStat,0.83383352525331200233, tolerance = 1e-4)
  expect_equal(res$pValue,0.36116636240337429697, tolerance = 1e-4)
  
  expect_equal(resWithEstimation$testStat,0.84785692959644609612, tolerance = 1e-4)
  expect_equal(resWithEstimation$pValue,0.35715930974148979438, tolerance = 1e-4)
  
  
  ind = matrix(NA,N,3)
  ind[,1] = c(rep(TRUE,500),rep(FALSE,N-500))
  ind[,2] = c(rep(FALSE,500),rep(TRUE,331),rep(FALSE,N-831))
  ind[,3] = c(rep(FALSE,500),rep(FALSE,331),rep(TRUE,N-831))
  
  
  res = pacotest:::testStatEqualCorrWithoutEstimation(U, svcmDataFrameHat, ind)
  resWithEstimation = pacotest:::testStatEqualCorrWithEstimation(U, svcmDataFrameHat, ind)
  
  expect_equal(res$testStat,2.454766624833430555, tolerance = 1e-4)
  expect_equal(res$pValue,0.29305841758446760092, tolerance = 1e-4)
  
  expect_equal(resWithEstimation$testStat,2.7602023114432685524, tolerance = 1e-4)
  expect_equal(resWithEstimation$pValue,0.25155310573676692432, tolerance = 1e-4)
  
  
  ind = matrix(NA,N,4)
  ind[,1] = c(rep(TRUE,300),rep(FALSE,200),rep(FALSE,N-500))
  ind[,2] = c(rep(FALSE,300),rep(FALSE,200),rep(TRUE,331),rep(FALSE,N-831))
  ind[,3] = c(rep(FALSE,300),rep(FALSE,200),rep(FALSE,331),rep(TRUE,N-831))
  ind[,4] = c(rep(FALSE,300),rep(TRUE,200),rep(FALSE,331),rep(FALSE,N-831))
  
  
  res = pacotest:::testStatEqualCorrWithoutEstimation(U, svcmDataFrameHat, ind)
  resWithEstimation = pacotest:::testStatEqualCorrWithEstimation(U, svcmDataFrameHat, ind)
  
  expect_equal(res$testStat,2.7721624555651458444, tolerance = 1e-4)
  expect_equal(res$pValue,0.42810299746943947241, tolerance = 1e-4)
  
  expect_equal(resWithEstimation$testStat,2.9912498147485870881, tolerance = 1e-4)
  expect_equal(resWithEstimation$pValue,0.39297625116189294214, tolerance = 1e-4)
  
  
  
  set.seed(31412131)
  # Data set 2
  N= 1756
  # Four-dimensional D-vine
  structure = matrix(c(4,0,0,0,
                       1,3,0,0,
                       2,1,2,0,
                       3,2,1,1),4,4,TRUE)
  families  = matrix(c(0,0,0,0,
                       5,0,0,0,
                       1,1,0,0,
                       2,2,2,0),4,4,TRUE)
  par2  = matrix(c(0,0,0,0,
                   0,0,0,0,
                   0,0,0,0,
                   3,8,6,0),4,4,TRUE)
  par  = matrix(c(0,0,0,0,
                  5,0,0,0,
                  0.4,0.3,0,0,
                  0.5,0.8,0.6,0),4,4,TRUE)
  names = c("V1", "V2", "V3","V4")
  
  rvm2 = RVineMatrix(structure,families,par,par2,names)
  rvm2 = RVineMatrixNormalize(rvm2)
  
  U2 = RVineSim(N,rvm2)
  rvmHat2 = RVineSeqEst(U2,rvm2)
  
  svcmDataFrameHat2 = pacotest:::rVineDataFrameRep(rvmHat2)
  
  ind = matrix(NA,N,2)
  ind[,1] = c(rep(TRUE,N/2),rep(FALSE,N/2))
  ind[,2] = !ind[,1]
  
  res2 = pacotest:::testStatEqualCorrWithoutEstimation(U2, svcmDataFrameHat2, ind)
  resWithEstimation2 = pacotest:::testStatEqualCorrWithEstimation(U2, svcmDataFrameHat2, ind)
  
  
  expect_equal(res2$testStat,1.1630787964924615974, tolerance = 1e-4)
  expect_equal(res2$pValue,0.28082793910460845943, tolerance = 1e-4)
  
  expect_equal(resWithEstimation2$testStat,1.1486998581351295368, tolerance = 1e-4)
  expect_equal(resWithEstimation2$pValue,0.28382148028243781024, tolerance = 1e-4)
  
  
  ind = matrix(NA,N,3)
  ind[,1] = c(rep(TRUE,500),rep(FALSE,N-500))
  ind[,2] = c(rep(FALSE,500),rep(TRUE,331),rep(FALSE,N-831))
  ind[,3] = c(rep(FALSE,500),rep(FALSE,331),rep(TRUE,N-831))
  
  res2 = pacotest:::testStatEqualCorrWithoutEstimation(U2, svcmDataFrameHat2, ind)
  resWithEstimation2 = pacotest:::testStatEqualCorrWithEstimation(U2, svcmDataFrameHat2, ind)
  
  
  expect_equal(res2$testStat,1.8312662134969845962, tolerance = 1e-4)
  expect_equal(res2$pValue,0.40026313656338963209, tolerance = 1e-4)
  
  expect_equal(resWithEstimation2$testStat,1.8236835598401168745, tolerance = 1e-4)
  expect_equal(resWithEstimation2$pValue,0.40178354529346393953, tolerance = 1e-4)
  
  
  ind = matrix(NA,N,4)
  ind[,1] = c(rep(TRUE,300),rep(FALSE,200),rep(FALSE,N-500))
  ind[,2] = c(rep(FALSE,300),rep(FALSE,200),rep(TRUE,331),rep(FALSE,N-831))
  ind[,3] = c(rep(FALSE,300),rep(FALSE,200),rep(FALSE,331),rep(TRUE,N-831))
  ind[,4] = c(rep(FALSE,300),rep(TRUE,200),rep(FALSE,331),rep(FALSE,N-831))
  
  res2 = pacotest:::testStatEqualCorrWithoutEstimation(U2, svcmDataFrameHat2, ind)
  resWithEstimation2 = pacotest:::testStatEqualCorrWithEstimation(U2, svcmDataFrameHat2, ind)
  
  
  expect_equal(res2$testStat,2.704885100069900794, tolerance = 1e-4)
  expect_equal(res2$pValue,0.43939776104000616286, tolerance = 1e-4)
  
  expect_equal(resWithEstimation2$testStat,2.9090013927664419846, tolerance = 1e-4)
  expect_equal(resWithEstimation2$pValue,0.40586921002370979217, tolerance = 1e-4)
  
})

