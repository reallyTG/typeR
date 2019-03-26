skip_on_cran()
require(testthat)
require(EdSurvey)
options(width = 500)
options(useFancyQuotes=FALSE)


#source("REF-6-ECLS_K.R") # has REF output in it
if(!exists("edsurveyHome")) {
  if (Sys.info()[['sysname']] == "Windows") {
    edsurveyHome <- "C:/EdSurveyData/"
  } else {
    edsurveyHome <- "~/EdSurveyData/"
  }
}

if (!dir.exists(edsurveyHome)) {
  dir.create(edsurveyHome)
}

context("ECLS_K data reads in correctly")
test_that("ECLS_K data reads in correctly",{
  expect_silent(downloadECLS_K(years=c(1998, 2011), root=edsurveyHome, verbose=FALSE))
  expect_silent(eclsk11 <<- readECLS_K2011(file.path(edsurveyHome, "ECLS_K", "2011"), filename = "childK4p.dat", layoutFilename = "ECLSK2011_K4PUF.sps", verbose = FALSE))

  expect_is(eclsk11, "edsurvey.data.frame")
  expect_equal(dim(eclsk11), c(18174, 21443)) #18174 obs::21443 cols

  expect_silent(eclsk98 <<- readECLS_K1998(file.path(edsurveyHome, "ECLS_K", "1998"), filename="eclsk_98_99_k8_child_v1_0.dat", layoutFilename = "Layout_k8_child.txt", verbose = FALSE))
  expect_is(eclsk98, "edsurvey.data.frame")
  expect_equal(dim(eclsk98), c(21409, 18928)) #21409 obs::18928 cols
})

context("ECLS_K getData")
test_that("ECLS_K getData",{
  dat1 <- getData(eclsk98, c("childid", "gender", "race"))
  expect_equal(dim(dat1), c(21357, 3))
  withr::with_options(list(digits=7), co <- capture.output(summary(dat1)))
  expect_equal(co, dat1Summary.Ref)
  
  #test continuous variable having only omitted levels
  dat2 <- getData(eclsk98, c("childid", "c1height", "c2height", "c3height", "c4height", "c5height", "c6height", "c7height"), omittedLevels = FALSE)
  expect_equal(dim(dat2), c(21409, 8))
  withr::with_options(list(digits=7), co <- capture.output(summary(dat2)))
  expect_equal(co, dat2Summary.Ref)
})

context("ECLS_K rename.sdf")
test_that("ECLS_K rename.sdf", {
  eclsk11dat <- rename.sdf(eclsk11, oldnames = "a2exasis",
                                newnames = "extraassistancefrequency")
  expect_equal("extraassistancefrequency" %in% colnames(eclsk11dat),TRUE)
})

context("ECLS_K Taylor Series")
test_that("ECLS_K Taylor Series", {
  lmTaylor <- lm.sdf(x8mscalk4 ~  x12sesl, weightVar = "w8c28p_8t280", varMethod = "Taylor",
                     data = eclsk11)
  withr::with_options(list(digits=7), lmTaylorOutput <- capture.output(summary(lmTaylor)))
  expect_equal(lmTaylorOutput, lmTaylorREF)
  wt1 <- waldTest(lmTaylor, coeff=2)
  # the Wald chi-square test should equal t-test
  expect_equal(sqrt(wt1$result$chi2[["chi2"]]), lmTaylor$coefmat$t[2])
})

context("ECLS_K Wald test")
test_that("ECLS_K Wald test", {
  suppressWarnings(glmTaylor <- logit.sdf(I(x8mscalk4>122) ~  x12sesl, weightVar = "w8c28p_8t280", data = eclsk11))
  summary(glmTaylor)
  wt2 <- waldTest(glmTaylor, coeff=2)
  # the Wald chi-square test should equal t-test
  expect_equal(sqrt(wt2$result$chi2[["chi2"]]), glmTaylor$coefmat$t[2])
})

context("ECLS_K summary2")
test_that("ECLS_K summary2", {
  withr::with_options(list(digits=7), ecls_sum <- capture.output(summary2(eclsk98,"c7r4mscl")))
  expect_equal(ecls_sum,ecls_sumREF)
  suppressWarnings(withr::with_options(list(digits=7), ecls_sum_w <- capture.output(summary2(eclsk98,"c7r4mscl", weightVar = 'c7cpts0'))))
  expect_equal(ecls_sum_w, ecls_sum_wREF)
})
