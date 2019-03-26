require(testthat)
require(EdSurvey)
options(width = 500)
options(useFancyQuotes=FALSE)
#source("REF-2-esdfl.R") # has REF output in it

context("read ESDFL")
test_that("read ESDFL",{
  sdf <<- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
  sdfA <<- subset(sdf, scrpsu %in% c(5,45,56))
  sdfB <- subset(sdf, scrpsu %in% c(75,76,78))
  sdfC <- subset(sdf, scrpsu %in% 100:200)
  sdfD <<- subset(sdf, scrpsu %in% 201:300)

  sdfB$year <- 2002
  sdfC$year <- 2003

  sdfB <<- sdfB
  sdfC <<- sdfC
  # construct an edsurvey.data.frame.list from these four data sets
  sdfl <<- edsurvey.data.frame.list(list(sdfA, sdfB, sdfC, sdfD),
                                    labels=c("A locations",
                                             "B locations",
                                             "C locations",
                                             "D locations"))
  expect_is(sdfl, "edsurvey.data.frame.list")
})

context("ESDFL achievementLevels")
test_that("ESDFL achievementLevels", {
  expect_known_value(test8 <- achievementLevels(data=sdfl), file="aLevels_test8.rds", update=FALSE)
})

context("ESDFL cor")
test_that("ESDFL cor", {
  c1 <- cor.sdf("b017451", "b003501", sdfA,
						    method="Pearson",
						    weightVar="origwt")
  c1234 <- cor.sdf("b017451", "b003501", sdfl,
						       method="Pearson",
						       weightVar="origwt")
  expect_equal(c1,c1234[[1]])
  skip_on_cran()
  c3 <- cor.sdf("b017451", "b003501", sdfC,
                method="Pearson",
                weightVar="origwt")
  expect_equal(c3,c1234[[3]])
})

context("ESDFL edsurveyTable")
test_that("ESDFL edsurveyTable",{
  et1 <- edsurveyTable(composite ~ b017451 + dsex, sdfl)
  et1c <- capture.output(et1)

  etB <- edsurveyTable(composite ~ b017451+ dsex, sdfB)
  # row names will not agree, homogenize them
  row.names(et1$data) <- paste(rep(LETTERS[1:4], each=nrow(etB$data)), rep(1:nrow(etB$data), 4))
  row.names(etB$data) <- paste("B", 1:nrow(etB$data))
  # remove "labels" because it is only on the edsurveyTableList
  ss <- subset(et1$data, labels=="B locations")[,2:ncol(et1$data)]
  for(i in 1:ncol(ss)) {
    mostattributes(ss[,i]) <- attributes(et1$data[,i+1])
  }
  expect_equal(capture.output(etB$data), capture.output(ss))
  skip_on_cran()
  expect_equal(et1c, et1REF)
})

context("ESDFL edsurveyTable error handling")
test_that("ESDFL error handling",{
  skip_on_cran()
  expect_warning(edsurveyTable(composite ~ b017451, sdfl, 
                               returnMeans=TRUE, returnSepct=FALSE,
                               pctAggregationLevel=6), 
                 paste0("Resetting ", sQuote("pctAggregationLevel") , " to 0. the largest potentially meaningful value."))
  sdfE <- "String"
  sdfl_error <- edsurvey.data.frame.list(list(sdfE, sdfB, sdfC, sdfE),
                                         labels=c("first E locations",
                                                  "B locations",
                                                  "C locations",
                                                  "second E locations"))
  expect_message(edsurveyTable(composite ~ b017451, 
                               sdfl_error, returnMeans=FALSE, 
                               returnSepct=FALSE), 
                 "Error on dataset 4")
  
  et2 <- edsurveyTable(composite ~ b017451, sdfl_error, returnMeans=FALSE, returnSepct=FALSE)
  et2c <- capture.output(et2)

  expect_error(g1 <- gap("composite", sdfl_error, groupA= dsex=="Male"))
  sdfl_errorB <- edsurvey.data.frame.list(list(sdfA, sdfB, sdfE, sdfC),
                                          labels=c("A locations",
                                                   "B locations",
                                                   "E locations",
                                                   "C locations"))
  expect_message(g2 <- gap("composite", sdfl_errorB, groupA= dsex=="Male"),
                 "An error occurred while working on a dataset \"E locations\". The results from that dataset will be excluded. Error message:")
  g3 <- gap("composite", sdfl, groupA= dsex=="Male")
  expect_equivalent(g2$results[2,], g3$results[2,])  
  skip_on_cran()
  expect_equal(et2c, et2REF)
})

context("ESDFL gap")
test_that("ESDFL gap",{
	g1 <- gap("composite", sdfl, dsex=="Male", dsex=="Female", returnSimpleDoF=TRUE)
	# check that the columns output for just one agree between esdfl and sdf
	g2 <- gap("composite", sdfC, dsex=="Male", dsex=="Female", returnSimpleDoF=TRUE)
  mnames <- names(g2$results)
  mnames <- mnames[mnames %in% names(g1$results)]
  expect_equal(unlist(g2$results[mnames]), unlist(g1$results[3,mnames]))
  skip_on_cran()
  # also check that the overall output has not changed.targetLevel="Male"
	expect_known_value(g1, "gap_esdfl_mean.rds", update=FALSE)
  # percentile
  expect_known_value(g_pct <- gap("composite", sdfl, dsex=="Male", percentiles=c(2,50)), "gap_esdfl_pct.rds", update=FALSE)
  # achievement level
  expect_known_value(g_al <- gap("composite", sdfl, dsex=="Male", achievementLevel="Proficient"), "gap_esdfl_al.rds", update=FALSE)
  # percent
  expect_known_value(g_per <- gap("dsex", sdfl, dsex=="Male", targetLevel="Male"), "gap_esdfl_perct.rds", update=FALSE)
})

context("ESDFL helper functions")
test_that("ESDFL helper functions",{
  d1 <- dim(sdfl)
  expect_equal(d1$nrow[1], nrow(sdfA))
  expect_equal(d1$ncol[3], ncol(sdfC))
  pv1 <- getPlausibleValue("composite", sdfl)
  expect_equal(pv1[[2]], getPlausibleValue("composite", sdfB))
  wr1 <- getWeightJkReplicates("origwt", sdfl)
  expect_equal(wr1[[4]], getWeightJkReplicates("origwt", sdfD))
  hpv1 <- hasPlausibleValue("algebra", sdfl)
  expect_equal(hpv1[[1]], hasPlausibleValue("algebra", sdfA))
  hpv2 <- hasPlausibleValue("dsex", sdfl)
  expect_equal(hpv2[[2]], hasPlausibleValue("dsex", sdfB))
  iw1 <- isWeight("origwt", sdfl)
  expect_equal(iw1[[3]], TRUE)
  iw2 <- isWeight("composite", sdfl)
  expect_equal(iw2[[4]], FALSE)
  l1 <- levelsSDF("sdracem", sdfl)
  expect_equal(l1[[1]], levelsSDF("sdracem", sdfA))
  l2 <- levelsSDF("dsex", sdfl)
  expect_equal(l2[[2]], levelsSDF("dsex", sdfB))
  n1 <- colnames(sdfl)
  expect_equal(n1[[3]], colnames(sdfC))
  spvo1 <- capture.output(showPlausibleValues(sdfl))
  spvoD <- capture.output(showPlausibleValues(sdfD))
  expect_equal(rev(spvo1)[1:length(spvoD)], rev(spvoD))
  sw1 <- capture.output(showWeights(sdfl, verbose=TRUE))
  swA <- capture.output(showWeights(sdfA, verbose=TRUE))
  swB <- capture.output(showWeights(sdfB, verbose=TRUE))
  swC <- capture.output(showWeights(sdfC, verbose=TRUE))
  swD <- capture.output(showWeights(sdfD, verbose=TRUE))
  expect_equal(sw1, c(swA, swB, swC, swD))
})

context("ESDFL subset and print")
test_that("ESDFL subset and print",{
  sdfl2 <- subset(sdfl, dsex=="Male")
  expect_known_value(capture.output(print(sdfl2)), file="esdfl_print.rds", update=FALSE)
  d1 <- dim(sdfl2)
  expect_equal(d1$nrow[1], nrow(subset(sdfA, dsex=="Male")))
  expect_equal(d1$ncol[3], ncol(subset(sdfC, dsex=="Female")))
  
  # inside = TRUE 
  expect_equal(d1, dim(subset(sdfl,eval("dsex == \"Male\""), inside = TRUE)))
  
  # expected message and error
  expect_warning(sdfl_e <- subset(sdfl, dsex1 == "Male"))
  expect_equal(sdfl_e, NULL)
  
  sdfE <- "String"
  sdfl_error <- edsurvey.data.frame.list(list(sdfE, sdfB, sdfC, sdfE),
                                         labels=c("first E locations",
                                                  "B locations",
                                                  "C locations",
                                                  "second E locations"))
  sdfl_ref <- subset(edsurvey.data.frame.list(list(sdfB,sdfC), labels = c("B locations","C locations")), dsex == "Male")
  expect_warning(sdfl_error_subset <- subset(sdfl_error, dsex == 'Male'))
  expect_equal(dim(sdfl_error_subset), dim(sdfl_ref))
  expect_equal(sdfl_error_subset$covs, sdfl_ref$covs)
})


context("ESDFL lm.sdf")
test_that("ESDFL lm.sdf",{
  skip_on_cran()
  # jrrIMax is required to make sure U isn't singular
  et1 <- lm.sdf(composite ~ b017451 + dsex, sdfl, jrrIMax=Inf)
  # lm maps to lm.sdf when data is an edsurvey.data.frame.list
  #et1b <- lm(composite ~ b017451 + dsex, sdfl)
  #expect_equal(et1, et1b)
  et1D <- lm.sdf(composite ~ b017451 + dsex, sdfD, jrrIMax=Inf)
  # summary output should be the same
  et1s <- capture.output(summary(et1))
  et1Ds <- capture.output(summary(et1D))
  expect_equal(rev(et1s)[1:length(et1Ds)], rev(et1Ds))
  # check coefs are equal
  expect_equal(coef(et1)[,4], coef(et1D))
  # check print results
  et1p <- capture.output(print(et1))
  et1Dp <- capture.output(print(et1D))
  expect_equal(rev(et1p)[1:2], rev(et1Dp))
})

context("ESDFL percentile")
test_that("ESDFL percentile",{
  expect_known_value(pct3 <- percentile("composite", 50, sdfl), "pct3.rds", update=FALSE)
  skip_on_cran()
  pct3C <- percentile("composite", 50, sdfC)
  expect_equal(unlist(pct3C[,,drop=TRUE]), unlist(pct3[3,names(pct3C),drop=TRUE]))
})

context("ESDFL same survey")
test_that("ESDFL same survey",{
  expect_true(!EdSurvey:::sameSurvey(sdfA, sdfB))
  expect_true(EdSurvey:::sameSurvey(sdf, sdfA))
  expect_true(EdSurvey:::sameSurvey(sdfl[[1]][[4]], sdfD))
})

context("ESDFL append")
test_that("ESDFL append", {
    
  sdfl1a <- edsurvey.data.frame.list(list(sdfA, sdfB),
                                     labels=c("A locations",
                                              "B locations"))

  sdfl1b <- edsurvey.data.frame.list(list(sdfC, sdfD),
                                     labels=c("C locations",
                                              "D locations"))

  sdfl1a_rev<- edsurvey.data.frame.list(list(sdfB, sdfA),
                                        labels=c("B locations",
                                                 "A locations"))

  sdfl1b_rev <- edsurvey.data.frame.list(list(sdfD, sdfC),
                                         labels=c("D locations",
                                                  "C locations"))

  sdfl2 <- edsurvey.data.frame.list(list(sdfA, sdfB, sdfC, sdfD),
                                    labels=c("A locations",
                                             "B locations",
                                             "C locations",
                                             "D locations"))

  sdfl2_rev <- edsurvey.data.frame.list(list(sdfD, sdfC, sdfB, sdfA),
                                        labels=c("D locations",
                                                 "C locations",
                                                 "B locations",
                                                 "A locations"))
  sdfl3 <- append.edsurvey.data.frame.list(
    append.edsurvey.data.frame.list(sdfl1a, sdfC, labelsB = "C locations"),
    sdfD,
    labelsB = "D locations")
  
  sdfl4 <- append.edsurvey.data.frame.list(sdfl1a, sdfl1b)
  
  sdfl5 <- append.edsurvey.data.frame.list(sdfl1b_rev, sdfl1a_rev)
  
  expect_true(identical(sdfl2, sdfl3))
  expect_true(identical(sdfl2, sdfl4))
  expect_true(identical(sdfl2_rev, sdfl5))
})