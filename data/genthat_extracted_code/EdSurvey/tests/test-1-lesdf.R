# This file tests that the light.edsurvey.data.frame works 
# the same as the edsurvey.data.frame
require(testthat)
require(EdSurvey)
# if(interactive()) {
#  setwd(system.file("testRDs", package = "EdSurvey"))
# }
options(width = 500)
#source("REF-1-lesdf.R") # has REF output in it

context("read LESDF")
test_that("read LESDF",{
  sdf <<- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
  lsdf <<- getData(sdf, c(all.vars(composite ~ dsex + b017451), "origwt"), addAttributes=TRUE)
  suppressWarnings(lsdf0 <<- getData(sdf, colnames(sdf), addAttributes=TRUE, omittedLevels=FALSE, defaultConditions=FALSE))
  expect_is(lsdf, "light.edsurvey.data.frame")
})

context("LESDF cbind function")
test_that("LESDF cbind function",{
  sm1 <- getData(sdf, c('composite', 'dsex', 'origwt'), dropUnusedLevels=FALSE, defaultConditions=FALSE, omittedLevels=FALSE, addAttributes=TRUE)
  sm2 <- getData(sdf, c('b017451'), dropUnusedLevels=FALSE, defaultConditions=FALSE, omittedLevels=FALSE)
  sm3 <- cbind(b017451=sm2$b017451,sm1)
  sm4 <- getData(sdf, c('composite','b017451', 'dsex', 'origwt'), dropUnusedLevels=FALSE, defaultConditions=FALSE, omittedLevels=FALSE, addAttributes=TRUE)
  expect_equal(attributes(sm4)$names,attributes(sm3)$names) # test just attribute names
  expect_equal(sm4,sm3) # test everything
  
  # cbind a data.frame
  sm5 <- cbind(sm2, sm1)
  expect_equal(sm5,sm3)
  
  # cbind matrix
  expect_is(cbind(c(1,2),c(1,2)),"matrix")
  
  # cbind vector with data.frame
  expect_equal(cbind(data.frame(V1 = c(1,2)), c(3,4)), base::cbind(data.frame(V1 = c(1,2)), c(3,4)))
})

context("LESDF rbind function")
test_that("LESDF cbind function",{
  sm1 <- getData(sdf, c('composite', 'dsex', 'origwt'), dropUnusedLevels=FALSE, defaultConditions=FALSE, omittedLevels=FALSE, addAttributes=TRUE)
  smF <- subset(sm1, dsex %in% "Female")
  dfM <- getData(subset(sm1, dsex %in% "Male"),c('composite', 'dsex', 'origwt'), dropUnusedLevels=FALSE, omittedLevels=FALSE)
  sm2 <- rbind(smF, dfM)
  expect_equal(dim(sm2),dim(sm1))
  expect_equal(dim(rbind(dfM,smF)), dim(sm1))
  
  # make sure generic rbind does not break anything
  expect_is(rbind(c(1,2),c(1,2)),"matrix")
  expect_equal(rbind(data.frame(V1 = c(1,2)), 3), base::rbind(data.frame(V1 = c(1,2)), 3))
})

context("LESDF merge function")
test_that("LESDF merge function",{
  sm1 <- getData(data=sdf, varnames=c("dsex", "b017451"), addAttributes = TRUE)
  attr_sm1 <- attributes(sm1)[!names(attributes(sm1)) %in% c("names","row.names")]
  df <- data.frame(dsex = c("Male","Female","extra"), dsex2 = c("Boy","Girl","extra"))
  merged_lsdf <- merge(sm1,df, by = "dsex")
  expect_equal(names(merged_lsdf), c("dsex","b017451","dsex2"))
  expect_equal(attributes(merged_lsdf)[!names(attributes(merged_lsdf)) %in% c("names","row.names")],attr_sm1)
  expect_equal(as.data.frame(merged_lsdf), merge(as.data.frame(sm1),df, by = "dsex"))
  
  # when expecting new rows
  merged_lsdf2 <- merge(sm1,df, by = "dsex", all = TRUE)
  expect_equal(unique(as.character(merged_lsdf2$dsex)), c("Male","Female","extra"))
  expect_equal(nrow(merged_lsdf2), nrow(sm1) + 1)
})


context("getData addAttributesTRUE returns a LESDF")
test_that("getData addAttributesTRUE returns a LESDF", {
	expect_is(sdf, "edsurvey.data.frame")
	expect_is(lsdf, "light.edsurvey.data.frame")
})

context("getData ignores defaultConditions when applied twice")
test_that("getData ignores defaultConditions when applied twice", {
  #skip_on_cran()
  lsdf1 <- getData(sdf, c("composite", "dsex", "b017451", "origwt"), addAttributes=TRUE, defaultConditions=FALSE)
  expect_equal(lsdf1, suppressWarnings(lsdf2 <- getData(lsdf1, c("composite", "dsex", "b017451", "origwt"))))
  expect_equal(lsdf1, suppressWarnings(lsdf3 <- getData(lsdf1, c("composite", "dsex", "b017451", "origwt"), defaultConditions=FALSE)))
  expect_equal(lsdf1, suppressWarnings(lsdf4 <- getData(lsdf1, c("composite", "dsex", "b017451", "origwt"), defaultConditions=TRUE)))
  lsdf2 <- getData(sdf, c("composite", "dsex", "b017451", "origwt"), addAttributes=TRUE, defaultConditions=TRUE)
  expect_equal(lsdf2, suppressWarnings(lsdf2 <- getData(lsdf2, c("composite", "dsex", "b017451", "origwt"))))
  expect_equal(lsdf2, suppressWarnings(lsdf3 <- getData(lsdf2, c("composite", "dsex", "b017451", "origwt"), defaultConditions=FALSE)))
  expect_equal(lsdf2, suppressWarnings(lsdf4 <- getData(lsdf2, c("composite", "dsex", "b017451", "origwt"), defaultConditions=TRUE)))
})

context("LESDF subset")
test_that("LESDF subset",{
  s1 <- EdSurvey:::subset(lsdf, dsex == "Male", verbose=FALSE)
  expect_equal(s2 <- base::subset(lsdf, dsex == "Male"),s1)

  sdfb12 <- getData(subset(sdf, b017451 %in% c(1,2), verbose=FALSE), c("b017451", "dsex"), dropUnusedLevels=FALSE)
  lsdfb12 <- subset(getData(sdf, c("b017451", "dsex"), dropUnusedLevels=FALSE), b017451 %in% c(1,2))
  expect_equal(sdfb12, lsdfb12)

  sdfb12 <- getData(subset(sdf, b017451 %in% c("Never or hardly ever","Once every few weeks"), verbose=FALSE), c("b017451", "dsex"), dropUnusedLevels=FALSE)
  lsdfb12 <- subset(getData(sdf, c("b017451", "dsex"), dropUnusedLevels=FALSE), b017451 %in% c("Never or hardly ever","Once every few weeks"))
  expect_equal(sdfb12, lsdfb12)

  s2 <- EdSurvey:::subset(lsdf, dsex == "Male", verbose=FALSE)
  expect_equal(attributes(s2)$names,attributes(lsdf)$names)
  
  # subset after recode
  lsdf_recode <- recode.sdf(lsdf, recode = list(dsex = list(from = "Female", to = "Girl")))
  s1 <- subset(lsdf_recode, dsex == "Girl", verbose = FALSE)
  expect_equal(s2 <- base::subset(lsdf_recode, dsex == "Girl"),s1)
  
  expect_equal(as.data.frame(getData(lsdf_recode,c(all.vars(composite ~ dsex + b017451), "origwt"))), 
               getData(sdf, c(all.vars(composite ~ dsex + b017451), "origwt"),recode = list(dsex = list(from = "Female", to = "Girl"))))
  norecode <- getData(sdf, c(all.vars(composite ~ dsex + b017451), "origwt"))
  expect_equal(nrow(s2), as.numeric(table(norecode$dsex)['Female']))
  
})

context("LESDF recode.sdf")
test_that("LESDF recode.sdf", {
  # recode numeric values
  lsdf_recode1 <- recode.sdf(lsdf, recode = list(b017451=list(from=c(1, 2, 3),
                                                              to=c("Infrequently")),
                                                 b017451=list(from=c(4, 5),
                                                              to=c("Frequently"))))
  expect_equal(llevels(lsdf_recode1$b017451),c(6,7))
  lsdf_recode2 <- recode.sdf(lsdf, recode = list(b017451=list(from=c(1, 2, 3),
                                                              to=4)))
  
  expect_equal(llevels(lsdf_recode2$b017451), c(4,5))
  expect_equal(levels(lsdf_recode2$b017451),c("2 or 3 times a week","Every day"))
  expect_equal(sum(table(lsdf$b017451)[1:4]),as.numeric(table(lsdf_recode2$b017451)[1]))
  
})

context("LESDF getData warnings")
test_that("LESDF getData warnings",{
  co <-evaluate_promise(getData(sdf, c('composite','dsex', 'b017451', 'origwt'), dropUnusedLevels = FALSE, defaultConditions = FALSE, addAttributes = TRUE, omittedLevels = FALSE))
  expect_equal(unique(co$warnings),character(0))
  expect_warning(co <- getData(sdf,
  	                           c('composite','dsex', 'b017451', 'm144901', 'origwt'),
  	                           dropUnusedLevels = FALSE,
  	                           defaultConditions = FALSE,
  	                           addAttributes = TRUE,
  	                           omittedLevels = FALSE), 
                 paste("Updating labels on ",sQuote('m144901')," because there are multiples of the label ", sQuote("Correct"),".",sep =""))
})

context("LESDF Simple functions")
test_that("LESDF Simple functions", {
  expect_true(hasPlausibleValue("composite", sdf))
  expect_true(hasPlausibleValue("composite", lsdf))
  expect_false(hasPlausibleValue("dsex", sdf))
  expect_false(hasPlausibleValue("dsex", lsdf))
  expect_equal(hasPlausibleValue("composite", sdf), hasPlausibleValue("composite", lsdf))
  expect_equal(getPlausibleValue("composite", sdf), getPlausibleValue("composite", lsdf))
  expect_error(getPlausibleValue("dsex", sdf))
  expect_error(getPlausibleValue("dsex", lsdf))
  expect_equal(getWeightJkReplicates("origwt", sdf), getWeightJkReplicates("origwt", lsdf))
  expect_error(getWeightJkReplicates("composite", sdf))
  expect_error(getWeightJkReplicates("composite", lsdf))
  expect_true(isWeight("origwt", sdf))
  expect_true(isWeight("origwt", lsdf))
  expect_false(isWeight("composite", sdf))
  expect_false(isWeight("composite", lsdf))
  expect_equal(isWeight("origwt", sdf), isWeight("origwt", lsdf))
  expect_equal(nrow(sdf), nrow(lsdf0))
  # the merge to schools removes one of the two merge columns. this now returns both merge vars if requested::tf
  expect_equal(ncol(sdf), ncol(lsdf0)) 
})

context("LESDF gap")
test_that("LESDF gap",{
  #skip_on_cran()
  g1 <- gap("composite", sdf, dsex=="Male", dsex=="Female")
  # omittedLevels must be set to FALSE or rows will be deleted because of other columns
  # using omitted levels 
  g1l <- gap("composite", lsdf0, dsex=="Male", dsex=="Female")
  # calls not expected to be equal
  g1$call <- NULL
  g1l$call <- NULL
  # compare
  expect_equal(g1, g1l)
})

context("LESDF achievementLevels")
test_that("LESDF achievementLevels",{
  #skip_on_cran()
  lsdf1l <- getData(sdf, c("composite", "origwt"), addAttributes=TRUE)
  expect_known_value(test1l <- achievementLevels(returnCumulative = TRUE, data=lsdf1l), file="aLevels_test1.rds", update=FALSE)
  a1 <- achievementLevels(c("composite","dsex", "b017451"),
                          aggregateBy = "dsex", sdf,
                          recode=list(
                                 b017451=list(
                                         from=c("Never or hardly ever",
                                         "Once every few weeks","About once a week"),
                                         to=c("Infrequently")),
                                 b017451=list(
                                         from=c("2 or 3 times a week","Every day"),
                                         to=c("Frequently"))))
  a2 <- achievementLevels(c("composite","dsex", "b017451"),
                          aggregateBy = "dsex", lsdf,
                          recode=list(
                                 b017451=list(
                                         from=c("Never or hardly ever",
                                         "Once every few weeks","About once a week"),
                                         to=c("Infrequently")),
                                 b017451=list(
                                         from=c("2 or 3 times a week","Every day"),
                                         to=c("Frequently"))))
  expect_equal(a1, a2)
})


context("LESDF cor.sdf")
test_that("LESDF cor.sdf",{
  #skip_on_cran()
  b3 <- cor.sdf("m815401", "b017451",method="Pearson", sdf,weightVar = "origwt")
  lsdf2 <- getData(sdf,c("m815401","m815701", "b017451","origwt"), addAttributes=TRUE, omittedLevels = FALSE)
  b4 <- cor.sdf("m815401", "b017451",method="Pearson", lsdf2,weightVar = "origwt", omittedLevels=TRUE) # dropUnusedLevels nolonger revealed, not set
  expect_equal(b3,b4)
  #cor passes omittedLevels to getData
  # in some ways this is maybe more of a test of getData
  b1 <- cor.sdf("m815401", "b017451",method="Pearson", sdf,weightVar = "origwt")
  lsdf3 <- getData(sdf,c("m815401", "b017451","origwt"), addAttributes=TRUE, omittedLevels = TRUE)
  b2 <- cor.sdf("m815401", "b017451",method="Pearson", lsdf3,weightVar = "origwt")
  expect_equal(b2,b4)
  expect_equal(b1,b2)

  c1 <- cor.sdf("b017451", "b003501", sdf,
                      method="Pearson",
                      weightVar="origwt")
  c2 <- cor.sdf("b017451", "b003501", lsdf0,
                      method="Pearson",
                      weightVar="origwt")
  expect_equal(c1, c2)

})

context("LESDF lm.sdf")
test_that("LESDF lm.sdf",{
  #skip_on_cran()
	sdfoutput <- capture.output(print(sm1 <- summary(lm.sdf(composite ~ dsex + b017451,sdf, jrrIMax=Inf))))
	gdoutput <- capture.output(print(sm2 <- summary(lm.sdf(composite ~ dsex + b017451,lsdf, jrrIMax=Inf))))
	expect_equal(sdfoutput, gdoutput)
	# do not expect the calls to be the same
	sm1$call <- sm2$call <- NULL
  sm2$lm0 <- sm1$data <- NULL
  sm1$waldDenomBaseDof <- NULL # sm2 will no have this because lsdf does not have the PSU nor stratum
	expect_equal(sm1, sm2)
})

context("LESDF print")
test_that("LESDF print",{
  #skip_on_cran()
	sdfoutput <- capture.output(print(sm1 <- lm.sdf(composite ~ dsex + b017451,sdf, jrrIMax=Inf)))
	gdoutput <- capture.output(print(sm2 <- lm.sdf(composite ~ dsex + b017451,lsdf, jrrIMax=Inf)))
	expect_equal(gdoutput, sdfoutput)
	# do not expect the calls to be the same
	sm1$call <- sm2$call <- NULL
  sm2$lm0 <- sm1$data <- NULL
  sm1$waldDenomBaseDof <- NULL # sm2 will no have this because lsdf does not have the PSU nor stratum
  expect_equal(sm1, sm2)
})

context("LESDF edsurveyTable")
test_that("LESDF edsurveyTable",{
  skip_on_cran()
  es10 <- edsurveyTable( ~ dsex + b017451, lsdf, jrrIMax=1)
  est10c <- capture.output(es10)
	expect_equal(est10c,es10REF)
	# two levels, results checked vs Primer
	es11 <- edsurveyTable(composite ~ dsex + b017451, lsdf, jrrIMax=1)
	es11c <- capture.output(es11)
	expect_equal(es11c,es11REF2)
	
	# check for just males (dsex is only occupied at one level)
	lsdfm <- subset(lsdf, dsex=="Male")
	es2l <- edsurveyTable(composite ~ dsex + b017451, lsdfm, jrrIMax=Inf)
	es2lc <- capture.output(es2l)
	expect_equal(es2lc, es2lREF)
	# test omittedLevels, here it should be ignored and es2 is the correct reference
	es2lb <- edsurveyTable(composite ~ dsex + b017451, lsdfm, jrrIMax=Inf, omittedLevels=FALSE)
	es2lbc <- capture.output(es2lb)
	expect_equal(es2lbc, es2lbREF)
})

context("LESDF lm.sdf correctly returns errors")
test_that("LESDF lm.sdf correctly returns errors",{
	sm1 <- getData(sdf, c(all.vars(composite ~ dsex + b017451), "origwt"), addAttributes=TRUE)
	sm1 <- subset(sm1, dsex == "Male")
	sm1 <- subset(sm1, dsex == "Female")
	expect_error(suppressWarnings(lm.sdf(composite ~ dsex + b017451,sm1, jrrIMax=Inf)))
  #LESDF lm.sdf function returns error with contradicting subset and relevel
  #skip_on_cran()
	sm1 <- getData(sdf, c(all.vars(composite ~ dsex + b017451), "origwt"), addAttributes=TRUE)
	# no error with relevel calls 
	expect_is(lm.sdf(composite ~ dsex + b017451, relevels = list(dsex="Male"),sm1, jrrIMax=Inf), "edsurveyLm")
	expect_is(lm.sdf(composite ~ dsex + b017451, relevels = list(b017451="Once every few weeks"),sm1, jrrIMax=Inf), "edsurveyLm")
	sm2 <- subset(sm1, dsex == "Male")
	sm2 <- subset(sm2, b017451 != "Once every few weeks")
	expect_error(lm.sdf(composite ~ dsex + b017451, relevels = list(dsex="Male"), sm2, jrrIMax=Inf))
	expect_error(lm.sdf(composite ~ dsex + b017451, relevels = list(b017451="Once every few weeks"), sm2, jrrIMax=Inf))
  #return error when variable not in getData call
	sm1 <- getData(sdf, c(all.vars(composite ~ dsex + b017451), "origwt"), addAttributes=TRUE)
	expect_error(lm.sdf(composite ~ dsex + b017451 + iep,sm1, jrrIMax=Inf))
})


context("LESDF updatePlausibleValue")
test_that("updatePlausibleValue",{
  lma <- lm.sdf(~ dsex, lsdf)
  lsdfb <- updatePlausibleValue("composite", "newname", lsdf)
  lmb <- lm.sdf(~ dsex, lsdfb)
  lmb$call <- lma$call <- NULL # the call is different
  lmb$formula <- lma$formula <- NULL # the formula has the default value substituted in and so is different
  expect_equal(lma, lmb)
})


context("LESDF percentile")
test_that("LESDF percentile",{
  # this is different from the test in main because lsdf has omitted levels of b017451 removed
  expect_known_value(pct2 <- percentile("composite", 50, lsdf), "pct2.rds", update=FALSE)
  pct1 <- readRDS("pct1.rds")
  pct1 <- pct1[pct1$percentile==50,]
  pct2B <- percentile("composite", 50, lsdf0)
  attr(pct1, "call") <- NULL
  attr(pct2B, "call") <- NULL
  expect_equal(pct1, pct2B)
})

context("LESDF same survey")
test_that("LESDF same survey",{
  expect_true(EdSurvey:::sameSurvey(sdf, lsdf))
  expect_true(EdSurvey:::sameSurvey(sdf, lsdf0))
  expect_true(EdSurvey:::sameSurvey(lsdf, lsdf0))
})

context('LESDF use returnNumberOfPSU=TRUE') 
test_that("use returnNumberOfPSU", {
  # percentile
  lsdf2 <- getData(sdf, c("composite","dsex","origwt",getAttributes(sdf,'psuVar'), getAttributes(sdf,'stratumVar')), addAttributes = TRUE)
  pctPSU <- percentile("composite", percentiles = c(10,50), data = lsdf2, returnNumberOfPSU = TRUE)
  expect_equal(attr(pctPSU,'nPSU'), 124)
  
  # lm.sdf
  lmPSU <- lm.sdf(composite ~ dsex, data=lsdf2, returnNumberOfPSU = TRUE)
  expect_equal(lmPSU$nPSU,124)
  
  # gap
  gapPSU <- gap("composite",data=lsdf2, groupA = dsex %in% "Male", groupB = dsex %in% "Female", returnNumberOfPSU = TRUE)
  expect_equal(gapPSU$labels$nPSUA,124)
  
})
