require(testthat)
require(EdSurvey)
options(width = 500)
options(useFancyQuotes=FALSE)
options(digits=7)

sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
#source("REF-0-main.R") # has REF output in it

context("wd is set correctly") #When this fails all regression tests are invalid.
test_that("wd is set correctly",{
  expect_is(es1_ <- readRDS("regression.rds"), "data.frame")
})

context("Primer reads in correctly")
test_that("Primer reads in correctly", {
  expect_is(sdf, "edsurvey.data.frame")
  expect_equal(dim(sdf), c(17606, 302))
  expect_equal(c(nrow(sdf), ncol(sdf)), c(17606, 302))
})

context("showPlausibleValues and showWeights verbose output agrees")
test_that("showPlausibleValues and showWeights verbose output agrees",{
  spv <- c("There are 6 subject scale(s) or subscale(s) in this edsurvey.data.frame", 
           "  'num_oper' subject scale or subscale with 5 plausible values. They are:", 
           "    'mrps11' 'mrps12' 'mrps13' 'mrps14' 'mrps15'", 
           "  'measurement' subject scale or subscale with 5 plausible values. They are:", 
           "    'mrps21' 'mrps22' 'mrps23' 'mrps24' 'mrps25'", 
           "  'geometry' subject scale or subscale with 5 plausible values. They are:", 
           "    'mrps31' 'mrps32' 'mrps33' 'mrps34' 'mrps35'", 
           "  'data_anal_prob' subject scale or subscale with 5 plausible values. They are:", 
           "    'mrps41' 'mrps42' 'mrps43' 'mrps44' 'mrps45'", 
           "  'algebra' subject scale or subscale with 5 plausible values. They are:", 
           "    'mrps51' 'mrps52' 'mrps53' 'mrps54' 'mrps55'", 
           "  'composite' subject scale or subscale with 5 plausible values (the default). They are:", 
           "    'mrpcm1' 'mrpcm2' 'mrpcm3' 'mrpcm4' 'mrpcm5'")
  co <- capture.output(showPlausibleValues(sdf,verbose=TRUE))
  expect_equal(co, spv)
  skip_on_cran()
  sw <- c("There are 1 full sample weight(s) in this edsurvey.data.frame", 
          "  'origwt' with 62 JK replicate weights (the default). Jackknife replicate weight variables:", 
          " [1] \"srwt01\" \"srwt02\" \"srwt03\" \"srwt04\" \"srwt05\" \"srwt06\" \"srwt07\" \"srwt08\" \"srwt09\" \"srwt10\" \"srwt11\" \"srwt12\" \"srwt13\" \"srwt14\" \"srwt15\" \"srwt16\" \"srwt17\" \"srwt18\" \"srwt19\" \"srwt20\" \"srwt21\" \"srwt22\" \"srwt23\" \"srwt24\" \"srwt25\" \"srwt26\" \"srwt27\" \"srwt28\" \"srwt29\" \"srwt30\" \"srwt31\" \"srwt32\" \"srwt33\" \"srwt34\" \"srwt35\" \"srwt36\" \"srwt37\" \"srwt38\" \"srwt39\" \"srwt40\" \"srwt41\" \"srwt42\" \"srwt43\" \"srwt44\" \"srwt45\" \"srwt46\" \"srwt47\" \"srwt48\" \"srwt49\" \"srwt50\" \"srwt51\" \"srwt52\" \"srwt53\" \"srwt54\" \"srwt55\"",
          "[56] \"srwt56\" \"srwt57\" \"srwt58\" \"srwt59\" \"srwt60\" \"srwt61\" \"srwt62\"",
          "")
  co <- capture.output(showWeights(sdf,verbose=TRUE))
  expect_equal(co, sw)
})

context("getData")
test_that("getData", {
  expect_known_value(gd1 <- getData(sdf, c("dsex", "b017451")), file="gd1.rds", update=FALSE)
  expect_known_value(gd2 <- getData(sdf, c("dsex", "b017451"), defaultConditions=FALSE), file="gd2.rds", update=FALSE)
  expect_known_value(gd3 <- getData(sdf, c("dsex", "b017451"), dropUnusedLevels=FALSE), file="gd3.rds", update=FALSE)
  expect_known_value(gd4 <- getData(sdf, c("dsex", "b017451"), omittedLevels=TRUE, includeNaLabel=FALSE), file="gd4.rds", update=FALSE)
  expect_known_value(gd5 <- getData(sdf, c("dsex", "b017451"), omittedLevels=TRUE, includeNaLabel=TRUE), file="gd5.rds", update=FALSE)
  gd6 <- getData(sdf, formula=composite ~ dsex + b017451)
  gd6 <- gd6[c(1:50,(nrow(gd6)-50):nrow(gd6)),]   # this file was larger. slim down a bit.
  expect_known_value(gd6, file="gd6.rds", update=FALSE)
  gddat <- getData(sdf,
                   c('composite', 'geometry', 'dsex', 'sdracem', 'pared', 'b017451', 'origwt'),
                   addAttributes = TRUE, omittedLevels = FALSE)
  gddat <- gddat[c(1:50,(nrow(gddat)-50):nrow(gddat)),]   # this file was larger. slim down a bit.
  attributes(gddat)$dataSch <- NULL
  attributes(gddat)$validateFactorLabels <- NULL
  expect_known_value(gddat, file="gddat.rds", update=FALSE)
  
  expect_known_value(gd7 <- getData(sdf, c("dsex", "b017451")), file="gd7.rds", update=FALSE)
  expect_known_value(gd8 <- getData(sdf, c("dsex", "c052601"), dropUnusedLevels=FALSE), file="gd8.rds", update=FALSE) #schoolMergeVarStudent="scrpsu", schoolMergeVarSchool="sscrpsu"
  df2 <- getData(sdf, c("dsex", "b017451"),
                 recode=list(b017451=list(from=c("Never or hardly ever",
                                                 "Once every few weeks",
                                                 "About once a week"),
                                          to=c("Infrequently")),
                             b017451=list(from=c("2 or 3 times a week",
                                                 "Every day"),
                                          to=c("Frequently"))))
  expect_known_value(df2, file="df2.rds", update=FALSE)
  # use recode for both recodes
  df2B <- recode.sdf(sdf, recode=list(b017451=list(from=c("Never or hardly ever",
                                                          "Once every few weeks",
                                                          "About once a week"),
                                                   to=c("Infrequently")),
                                      b017451=list(from=c("2 or 3 times a week",
                                                          "Every day"),
                                                   to=c("Frequently"))))
  df2C <- getData(df2B, c("dsex", "b017451"))
  expect_equal(df2, df2C)
  # use recode for just one and get data for the other
  df2D <- recode.sdf(sdf, recode=list(b017451=list(from=c("Never or hardly ever",
                                                          "Once every few weeks",
                                                          "About once a week"),
                                                   to=c("Infrequently"))))
  df2E <- getData(df2D, c("dsex", "b017451"),
                  recode=list(b017451=list(from=c("2 or 3 times a week",
                                                  "Every day"),
                                           to=c("Frequently"))))
  expect_equal(df2, df2E)
  # numeric recodes
  df3 <- getData(sdf,
                 c("dsex", "b017451"),
                 recode=list(b017451=list(from=c(1, 2, 3),
                                          to=c("Infrequently")),
                             b017451=list(from=c(4, 5),
                                          to=c("Frequently"))
                 ))
  expect_equal(df2, df3) # recode by label and numeric agree
  
  sdf_males <- EdSurvey:::subset(sdf, dsex == "Male", verbose=FALSE)
  expect_equal(dim(sdf_males), c(8905, 302))
  
  sdf_males <- EdSurvey:::subset(sdf, dsex %in% "Male", verbose=FALSE)
  expect_equal(dim(sdf_males), c(8905, 302))
})

context("getData order of userConditions")
test_that("getData order of userConditions", {
  # subset first, then recode
  sdf_males <- subset(sdf, dsex %in% "Male")
  sdf_males <- recode.sdf(sdf_males, recode = list(dsex = list(from = "Male", to = "Boy")))
  gdat1 <- getData(sdf_males, c("dsex"))
  expect_equal(nrow(gdat1), 8486)
  expect_equal(unique(as.character(gdat1$dsex)), "Boy")
  
  # recode first then subset
  sdf_males <- recode.sdf(sdf, recode = list(dsex = list(from = "Male", to = "Boy")))
  sdf_males <- subset(sdf_males, dsex %in% "Boy")
  gdat2 <- getData(sdf_males, c("dsex"))
  expect_equal(gdat2, gdat1)
})

context("rename.sdf")
test_that("rename.sdf", {
  # check rename only
  sdf_rename <- rename.sdf(sdf, c("dsex","composite","origwt"), c("gender","composite0","totwgt"))
  expect_equal(attr(getAttributes(sdf_rename, "pvvars"),"default"),"composite0")
  expect_equal(attr(getAttributes(sdf_rename,"weights"),"default"), "totwgt")
  gDat1 <- getData(sdf,c("dsex","composite","origwt"))
  gDat2 <- getData(sdf_rename,c("gender","composite0","totwgt"))
  names(gDat1) <- NULL
  names(gDat2) <- NULL
  expect_equal(gDat1, gDat2)
  expect_equal(levelsSDF("dsex",sdf)$dsex, levelsSDF("gender",sdf_rename)$gender)
  
  # check rename along with subset and recode.sdf
  sdf_males <- subset(sdf,dsex %in% "Male")
  gDat1 <- getData(sdf_males,"dsex")
  sdf_males <- rename.sdf(sdf_males,"dsex","gender")
  sdf_males <- recode.sdf(sdf_males, list(gender = list(from = "Male",to = "Boy")))
  gDat2 <- getData(sdf_males,"gender")
  expect_equal(as.numeric(table(gDat1$dsex)), as.numeric(table(gDat2$gender)))
  
  # complicated order of operations
  sdf_rename <- rename.sdf(sdf,"sdracem","race")
  sdf_rename <- subset(sdf_rename, !race %in% c("Omitted"))
  sdf_rename <- rename.sdf(sdf_rename,"race","race_recode")
  sdf_rename <- recode.sdf(sdf_rename, recode = list(race_recode = list(from = c("Hispanic","Asian/Pacific Island","Amer Ind/Alaska Natv"),
                                                                        to = "Other")))
  sdf_rename <- subset(sdf_rename, race_recode %in% "Other")
  expect_equal(nrow(sdf_rename), nrow(subset(sdf, sdracem %in% c("Hispanic","Asian/Pacific Island","Amer Ind/Alaska Natv","Other"))))
})

context("subset throws an error")
test_that("subset throws an error", {
  expect_error(sdf_error <- subset(sdf, dsex1 %in% "Male"))
  expect_error(sdf_error <- subset(sdf, dsex == "Male" & dsex1 == "Male"))
})

context("lm.sdf")
test_that("lm.sdf",{
  lm1 <- lm.sdf( ~ dsex + b017451, sdf)
  slm1 <- summary(lm1, src=TRUE)
  slm1$formula <- NULL
  slm1$call <- NULL
  slm1$data <- NULL
  slm1$residuals <- head(lm1$residuals)
  slm1$PV.residuals <- head(lm1$PV.residuals)
  slm1$PV.fitted.values <- head(lm1$PV.fitted.values)
  slm1_read <- readRDS(file="lm1.rds")
  expect_equal(slm1, slm1_read)
  skip_on_cran()
  lm1S <- lm.sdf( ~ dsex + b017451, sdf, standardizeWithSamplingVar=TRUE)
  slm1Scoef <- capture.output(summary(lm1S, src=TRUE)$coefmat)
  expect_equal(slm1Scoef, stdCoefREF)
  lm10 <- lm.sdf(composite ~ dsex + b017451, sdf)
  lm10$data <- NULL
  lm10$residuals <- head(lm10$residuals)
  lm10$PV.residuals <- head(lm10$PV.residuals)
  lm10$PV.fitted.values <- head(lm10$PV.fitted.values)
  expect_known_value(lm10, "lm10.rds", update=FALSE)
  lm1f <- lm.sdf(composite ~ dsex + b017451, sdf, relevels=list(dsex="Female"))
  lm1f$data <- NULL
  lm1f$residuals <- head(lm1f$residuals)
  lm1f$PV.residuals <- head(lm1f$PV.residuals)
  lm1f$PV.fitted.values <- head(lm1f$PV.fitted.values)
  lm1f.ref <- readRDS("lm1f.rds")
  expect_equal(lm1f, lm1f.ref)
  lm1re <- lm.sdf(composite ~ dsex + b017451, sdf, recode=list(dsex=list(from="Male", to="MALE")))
  lm1re$data <- NULL
  lm1re$residuals <- head(lm1re$residuals)
  lm1re$PV.residuals <- head(lm1re$PV.residuals)
  lm1re$PV.fitted.values <- head(lm1re$PV.fitted.values)
  lm1re.ref <- readRDS("lm1re.rds")
  expect_equal(lm1re, lm1re.ref)
  # test that lfactor levels can be used in relevels argument
  lm1f2 <- lm.sdf(composite ~ dsex + b017451, sdf, jrrIMax=1, relevels=list(dsex=2))
  lm1f2$data <- NULL
  lm1f2$residuals <- head(lm1f2$residuals)
  lm1f2$PV.residuals <- head(lm1f2$PV.residuals)
  lm1f2$PV.fitted.values <- head(lm1f2$PV.fitted.values)
  # calls will not be equal
  lm1f$call <- lm1f2$call <- NULL
  expect_equal(lm1f, lm1f2)
  expect_equal(summary(lm1f), summary(lm1f2))
})

context("lm.sdf: Taylor series")
test_that("lm.sdf: Taylor series",{
  expect_is(sdf_taylor <- lm.sdf(composite ~ sdracem + dsex + pared,
                                 subset(sdf, pared == 1 | pared == 2, verbose=FALSE),
                                 weightVar="origwt",
                                 varMethod = "Taylor",
                                 jrrIMax=Inf),
            "edsurveyLm")
  lm1t <- lm.sdf(composite ~ dsex + b017451, sdf, varMethod="Taylor")
  lm1t$data <- NULL
  lm1t$residuals <- head(lm1t$residuals)
  
  lm1t$PV.residuals <- head(lm1t$PV.residuals)
  lm1t$PV.fitted.values <- head(lm1t$PV.fitted.values)
  lm1t.ref <- readRDS("lm1t.rds")
  expect_equal(lm1t, lm1t.ref)
  lm1jk <- lm.sdf(composite ~ dsex + b017451, sdf, varMethod="jackknife")
  expect_equal(coef(lm1t), coef(lm1jk))
  lm1jk$data <- NULL
  lm1jk$residuals <- head(lm1jk$residuals)
  lm1jk$PV.residuals <- head(lm1jk$PV.residuals)
  lm1jk$PV.fitted.values <- head(lm1jk$PV.fitted.values)
  lm1jk <- summary(lm1jk, src=TRUE)
  lm1jk.ref <- readRDS("lm1.rds")
  lm1jk$call <- lm1jk.ref$call <- NULL
  lm1jk$formula <- NULL
  expect_equal(lm1jk, lm1jk.ref)
  # estimates should agree too
  skip_on_cran()
  
  lm2ta <- lm.sdf(composite ~ dsex + sdracem + yrsmath, sdf, varMethod="Taylor")
  lm2jka <- lm.sdf(composite ~ dsex + sdracem + yrsmath, sdf, varMethod="jackknife")
  # check only estimates
  expect_equal(coef(lm2ta), coef(lm2jka))
  
  lm2t <- lm.sdf(composite ~ dsex + sdracem + yrsmath, sdf, varMethod="Taylor", relevel=list(dsex="Female"))
  lm2t$data <- NULL
  lm2t$residuals <- head(lm2t$residuals)
  lm2t$PV.residuals <- head(lm2t$PV.residuals)
  lm2t$PV.fitted.values <- head(lm2t$PV.fitted.values)
  lm2t.ref <- readRDS("lm2t.rds")
  expect_equal(lm2t, lm2t.ref)
  lm2jk <- lm.sdf(composite ~ dsex + sdracem + yrsmath, sdf, varMethod="jackknife", relevel=list(dsex="Female"), jrrIMax=1)
  lm2jk$data <- NULL
  lm2jk$residuals <- head(lm2jk$residuals)
  lm2jk$PV.residuals <- head(lm2jk$PV.residuals)
  lm2jk$PV.fitted.values <- head(lm2jk$PV.fitted.values)
  lm2.ref <- readRDS("lm2.rds")
  lm2.ref$call <- lm2jk$call <- NULL
  expect_equal(lm2jk, lm2.ref)
  expect_equal(coef(lm2t), coef(lm2jk))
})


context("edsurveyTable")
test_that("edsurveyTable",{
  skip_on_cran()
  # two levels, results checked vs Primer
  es1 <- edsurveyTable(composite ~ dsex + b017451, sdf, jrrIMax=1)
  es1c <- capture.output(es1)
  expect_equal(es1c, es1REF)
  # test no LHS variable
  es10 <- edsurveyTable( ~ dsex + b017451, sdf, jrrIMax=1)
  es10c <- capture.output(es10)
  expect_equal(es10c, es1REF)
  
  # check for just males (dsex is only occupied at one level)
  sdfm <- subset(sdf, dsex=="Male", verbose=FALSE)
  es2 <- edsurveyTable(composite ~ dsex + b017451, sdfm, jrrIMax=Inf)
  es2c <- capture.output(es2)
  expect_equal(es2c, es2REF)
  # test omittedLevels
  es2b <- edsurveyTable(composite ~ dsex + b017451, sdfm, jrrIMax=1, omittedLevels=FALSE)
  es2bc <- capture.output(es2b)
  expect_equal(es2bc, es2bREF)
  
  # test unbalanced tables, this check verified. See email from Ting on 10/1/2015 at 5:25 Eastern
  es3 <- edsurveyTable(composite ~ lep + ell3 , sdf, jrrIMax=1)
  es3c <- capture.output(es3)
  expect_equal(es3c, es3REF)
  # check return.means and return.sepct arguments
  es3b <- edsurveyTable(composite ~ lep + ell3 , sdf, jrrIMax=1, returnMeans =  FALSE)
  expect_equal(es3b$data,es3b$data[,c("lep", "ell3", "N", "WTD_N", "PCT", "SE(PCT)")])
  es3c <- edsurveyTable(composite ~ lep + ell3 , sdf, jrrIMax=1, returnMeans =  FALSE, returnSepct = FALSE)
  expect_equal(es3c$data, es3$data[,c("lep", "ell3", "N", "WTD_N", "PCT")])
  # test unbalanced tables, with three levels. This check verified. See email from Ting on 10/1/2015 at 5:25 Eastern
  es4 <- edsurveyTable(composite ~ lep + ell3 + dsex, sdf, jrrIMax=1)
  es4c <- capture.output(es4)
  expect_equal(es4c, es4REF)
  # test LHS variable that isn't composite
  es11 <- edsurveyTable(b017451 ~ dsex, sdf)
  es11c <- capture.output(es11)
  expect_equal(es11c, es11REF1)
  # recode
  es1r <- edsurveyTable(composite ~ dsex + b017451, sdf, jrrIMax=1, recode=list(dsex=list(from="Male", to="MALE")))
  es1rc <- capture.output(es1r)
  expect_equal(es1rc, es1rREF)
  # test omitted levels problematic sparseness case
  suppressWarnings(es5 <- edsurveyTable(composite ~ dsex + b017451 + b003501, data=sdf, omittedLevels=FALSE, pctAggregationLevel=2))
  es5c <- capture.output(es5)
  expect_equal(es5c, es5REF)
})

context("edsurveyTable with N=0")
test_that("edsurveyTable with N=0", {
  es0 <- edsurveyTable(~b003501 + m815401, data = sdf, omittedLevels = FALSE)
  esDF <- getData(sdf,c("b003501","m815401"), omittedLevels = FALSE)
  esDFtable <- as.data.frame(table(esDF))
  esDFtable <- esDFtable[order(esDFtable$b003501),]
  expect_equal(nrow(es0$data), nrow(expand.grid(levels(esDF$m815401),levels(esDF$b003501))))
  expect_equal(es0$data$N, esDFtable$Freq)
  skip_on_cran()
  expect_equal(capture.output(es0), estwith0REF)
  
  es1 <- edsurveyTable(~b003501 + m815401, data = sdf, omittedLevels = FALSE, pctAggregationLevel = 0)
  expect_equal(nrow(es1$data), nrow(esDFtable))

})

context("edsurveyTable with no rhs variable") 
test_that("edsurveyTable with no rhs variable", {
  skip_on_cran()
  es <- edsurveyTable(composite ~ 1, data = sdf, returnVarEstInputs = TRUE)
  esc <- capture.output(es)
  expect_equal(esc, es_norhsREF)
})


context("gap with N=0")
test_that("gap with N=0", {
  skip_on_cran()
  gap0 <- gap("b003501",data=sdf, groupA = m815401 %in% "Multiple", groupB = "default", omittedLevels = FALSE, targetLevel = "Multiple",
              returnSimpleDoF = TRUE, returnVarEstInputs = TRUE, returnSimpleN = TRUE)
  gap0c <- capture.output(gap0)
  expect_equal(gap0c,gap0REF)
})

context("edsurveyTable2pdf")
test_that("edsurveyTable2pdf",{
  est1 <- edsurveyTable(composite ~ dsex + b017451, sdf)
  expect_known_value(evaluate_promise(edsurveyTable2pdf(data = est1,
                                                        formula = b017451~dsex,
                                                        toCSV = "",
                                                        filename = "CONSOLE",
                                                        returnMeans = FALSE)),
                     file = "es_2pdf.rds", update=FALSE)
})

context("edsurveyTable: Taylor")
test_that("edsurveyTable: Taylor",{
  skip_on_cran()
  es1t <- edsurveyTable(composite ~ dsex + b017451, sdf, jrrIMax=1, varMethod="Taylor")
  es1tc <- capture.output(es1t)
  # compare Taylor to jackknife, only columns that should agree
  es1j <- edsurveyTable(composite ~ dsex + b017451, sdf, jrrIMax=1, varMethod="jackknife")
  es1t$njk <- NULL
  es1j$njk <- NULL
  es1t$varMethod <- NULL
  es1j$varMethod <- NULL
  es1j$data["SE(PCT)"] <- NULL
  es1t$data["SE(PCT)"] <- NULL
  es1j$data["SE(MEAN)"] <- NULL
  es1t$data["SE(MEAN)"] <- NULL
  expect_equal(es1j, es1t)
  
  # check Taylor output
  expect_equal(es1tc, es1tREF)
  # test unbalanced tables
  es3t <- edsurveyTable(composite ~ lep + ell3 , sdf, jrrIMax=Inf, varMethod="Taylor")
  es3tc <- capture.output(es3t)
  expect_equal(es3tc, es3tREF)
  # test unbalanced tables
  es4t <- edsurveyTable(composite ~ lep + ell3 +dsex, sdf, jrrIMax=1, varMethod="Taylor")
  es4tc <- capture.output(es4t)
  expect_equal(es4tc, es4tREF)
  
  # check for just males (dsex is only occupied at one level)
  sdfm <- subset(sdf, dsex=="Male", verbose=FALSE)
  es2t <- edsurveyTable(composite ~ dsex + b017451, sdfm, jrrIMax=1, varMethod="Taylor")
  es2tc <- capture.output(es2t)
  expect_equal(es2tc, es2tREF)
})

test_that("variable label stored as attributes", {
  est1 <- edsurveyTable(composite ~ dsex + b017451, sdf, jrrIMax=1)
  expect_equal(attr(est1$data$dsex, "label"), "Gender")
  expect_equal(attr(est1$data$b017451, "label"), "Talk about studies at home")
})

context("showPlausibleValues and showWeights verbose output agrees")
test_that("showPlausibleValues and showWeights verbose output agrees",{
  sw <- c("Achievement Levels:", 
          "  Basic:  262", 
          "  Proficient:  299" ,
          "  Advanced:  333")
  co <- capture.output(showCutPoints(sdf))
  expect_equal(sw, co)
})

context("updatePlausibleValue")
test_that("updatePlausibleValue",{
  lma <- lm.sdf(~ dsex, sdf, varMethod="Taylor")
  sdfb <- updatePlausibleValue("composite", "newname", sdf)
  lmb <- lm.sdf(~ dsex, sdfb, varMethod="Taylor")
  lmb$call <- lma$call <- NULL # the call is different
  lmb$formula <- lma$formula <- NULL # the formula has the default value substituted in and so is different
  lmb$data <- lma$data <- NULL
  expect_equal(lma, lmb)
})

context("percentile")
test_that("percentile",{
  expect_known_value(pct1 <- percentile("composite", c(0,1,25,50,75,99,100), sdf), "pct1.rds", update=FALSE)
})

context("return VarEstInputs")
test_that("return VarEstInputs",{
  lm1 <- lm.sdf( ~ dsex + b017451, sdf, returnVarEstInputs=TRUE)
  expect_known_value(lm1$varEstInputs, "lm_varest.rds", update=FALSE)
  skip_on_cran()
  es1 <- edsurveyTable(composite ~ dsex + b017451, sdf, jrrIMax=1, returnVarEstInputs=TRUE)
  expect_known_value(list(es1$meanVarEstInputs, es1$pctVarEstInputs), file="est_varest.rds", update=FALSE)
  g1 <- gap("composite", sdf, dsex=="Male", returnVarEstInputs=TRUE)
  expect_known_value(list(g1$varEstInputs, g1$pctVarEstInputs), file="gap1_varest.rds", update=FALSE)
  g2 <- gap("b017451", sdf, dsex=="Male", targetLevel="Once every few weeks", returnVarEstInputs=TRUE)
  expect_known_value(list(g2$varEstInputs, g2$pctVarEstInputs), file="gap2_varest.rds", update=FALSE)
  g3 <- gap("composite", sdf, dsex=="Male", returnVarEstInputs=TRUE, achievementLevel=c("At or aboVe Bas"))
  expect_known_value(list(g3$varEstInputs, g3$pctVarEstInputs), file="gap3_varest.rds", update=FALSE)
  g3d <- gap("composite", sdf, dsex=="Male", returnVarEstInputs=TRUE, achievementLevel=c("At Basic"), achievementDiscrete=TRUE)
  expect_known_value(list(g3d$varEstInputs, g3d$pctVarEstInputs), file="gap3d_varest.rds", update=FALSE)
  g4 <- gap("composite", sdf, dsex=="Male", percentiles=c(50), returnVarEstInputs=TRUE)
  expect_known_value(list(g4$varEstInputs, g4$pctVarEstInputs), file="gap4_varest.rds", update=FALSE)
  pct1 <- percentile("composite", c(2, 50), sdf, returnVarEstInputs=TRUE)
  expect_known_value(attributes(pct1)$varEstInputs, file="pct_varest.rds", update=FALSE)
  test1 <- achievementLevels(returnCumulative = TRUE, data=sdf, returnVarEstInputs=TRUE)
  expect_known_value(list(test1$discVarEstInputs, test1$cumVarEstInputs), file="aLevels_varest.rds", update=FALSE)
  es1re <- edsurveyTable(composite ~ dsex + b017451, sdf, jrrIMax=1, returnVarEstInputs=TRUE, recode=list(dsex=list(from="Male", to="MALE")))
  expect_known_value(list(es1re$meanVarEstInputs, es1re$pctVarEstInputs), file="est_varest_recode.rds", update=FALSE)
  # add test per issue 671
  glab <- gap("composite", sdf, dsex=="Male", dsex=="Female", achievementLevel=c("below Basic","At Bas"), achievementDiscrete=TRUE)
  expect_equal(glab$results$achievementLevel, c("below Basic", "At Basic"))
})

context("gap")
test_that("gap", {
  # gap means
  expect_known_value(g1 <- gap("composite", sdf, dsex=="Male", dsex=="Female", returnSimpleDoF=TRUE), "gap_main_mean.rds", update=FALSE)
  g1q <- gap("composite", sdf, "dsex==\"Male\"", "dsex==\"Female\"", returnSimpleDoF=TRUE)
  g1q$call <- g1$call # the call is different, so fix that
  expect_known_value(g1q, "gap_main_mean.rds", update=FALSE)
  skip_on_cran()
  # gap percentile
  expect_known_value(g2p <- gap("composite", sdf, dsex=="Male", dsex=="Female", percentile=c(0,50, 98), returnSimpleDoF=TRUE), "gap_main_percentile.rds", update=FALSE)
  g2pq <- gap("composite", sdf, "dsex==\"Male\"", "dsex==\"Female\"", percentile=c(0,50, 98), returnSimpleDoF=TRUE)
  g2pq$call <- g2p$call # the call is different, so fix that
  expect_known_value(g2pq, "gap_main_percentile.rds", update=FALSE)
  # gap achievement levels, discrete
  expect_known_value(g1al <- gap("composite", sdf, dsex=="Male", dsex=="Female", achievementLevel="Prof", achievementDiscrete=TRUE), "gap_AL1.rds", update=FALSE)
  
  # check use of achievementLevel in results, that results agree across discrete and cumulative
  ga1 <- gap("composite", sdf, dsex=="Male", dsex=="Female", achievementLevel="Advanced")
  ga2 <- gap("composite", sdf, dsex=="Male", dsex=="Female", achievementLevel="Adv", achievementDiscrete=TRUE)
  ga1$call <- NULL
  ga2$call <- NULL
  expect_equal(ga1, ga2)
  expect_equal(ga1$results$achievementLevel, "At Advanced")
  expect_equal(ga2$results$achievementLevel, "At Advanced")
  
  gp1 <- gap("composite", sdf, dsex=="Male", dsex=="Female", achievementLevel="Proficient")
  gp2 <- gap("composite", sdf, dsex=="Male", dsex=="Female", achievementLevel="Prof", achievementDiscrete=TRUE)
  
  # cumulative should equal sum of discrete
  expect_equal(gp2$results$estimateA + ga1$results$estimateA, gp1$results$estimateA)
  expect_equal(gp2$results$estimateB + ga1$results$estimateB, gp1$results$estimateB)
  expect_equal(gp1$results$achievementLevel, "At or Above Proficient")
  expect_equal(gp2$results$achievementLevel, "At Proficient")
  
  # and cumulative, with multiple levels
  expect_known_value(g2al <- gap("composite", sdf, dsex=="Male", dsex=="Female", achievementLevel=c("Proficient", "Basic")), "gap_AL2.rds", update=FALSE)
  # gap percentage with recode
  expect_known_value(g1eq <- gap("b017451", sdf, dsex=="Male", dsex=="Female", targetLevel="Never or hardly ever", returnSimpleDoF=TRUE), "gap_percentage1.rds", update=FALSE)
  expect_known_value(g2eq <- gap("b017451", sdf, dsex=="Male", dsex=="Female", targetLevel="Infrequently",
                                 recode=list(b017451=list(
                                   from=c("Never or hardly ever",
                                          "Once every few weeks",
                                          "About once a week"),
                                   to=c("Infrequently"))),
                                 returnSimpleDoF=TRUE), "gap_percentage2.rds", update=FALSE) 
})


context("achievementLevel basic")
test_that("achievementLevel basic", {
  expect_known_value(test1 <- achievementLevels(returnCumulative = TRUE, data=sdf), file="aLevels_test1.rds", update=FALSE)
})

context("achievementLevel, aggregated")
test_that("achievementLevel, aggregated", {
  expect_known_value(test2 <- achievementLevels(aggregateBy = "dsex",returnCumulative = TRUE, data=sdf), file="aLevels_test2.rds")
  expect_known_value(test3 <- achievementLevels(aggregateBy = "sdracem",returnCumulative = TRUE, data=sdf), file="aLevels_test3.rds")
  expect_known_value(test4 <- achievementLevels("sdracem",aggregateBy = c("composite"),data=sdf, returnCumulative = TRUE), file="aLevels_test4.rds")
  expect_known_value(test5 <- achievementLevels("dsex",aggregateBy = c("composite"),data=sdf, returnCumulative = TRUE), file="aLevels_test5.rds")
  # Use recode to change values for specified variables:
  expect_known_value(test6 <- achievementLevels(c("composite","dsex", "b017451"),
                                                aggregateBy = "dsex", sdf,
                                                recode=list(b017451=list(from=c("Never or hardly ever",
                                                                                "Once every few weeks",
                                                                                "About once a week"),
                                                                         to=c("Infrequently")),
                                                            b017451=list(from=c("2 or 3 times a week","Every day"),
                                                                         to=c("Frequently")))), file="aLevels_test6.rds")
})

context("achievementLevel many interactions")
test_that("achievementLevel many interactions", {
  skip_on_cran()
  expect_known_value(test7 <- achievementLevels(c("composite", "ell3", "lep", "pared", "b017451"), data=sdf, returnCumulative = TRUE), file="aLevels_test7.rds", update=FALSE)
})

context("achievementLevel with result of zero")
test_that("achievementLevel with result of zero", {
  sdfC <- subset(sdf, scrpsu %in% 100:200)
  expect_known_value(test9 <- achievementLevels(data=subset(sdfC, pared==1)), file="aLevels_test9.rds", update=FALSE)
})

# tests based on sdf
context("Test correlations on SDF")
test_that("sdf correlation", {
  expect_is(expect_c1_pear <- cor.sdf("b017451", "b003501", sdf, method="Pearson", weightVar="origwt"), "edsurveyCor")
  skip_on_cran()
  expect_is(c1_spear <- cor.sdf("b017451", "b003501", sdf, method="Spearman", weightVar="origwt"), "edsurveyCor")
  expect_is(c1_polyc <- cor.sdf("b017451", "b003501", sdf, method="Polychoric", weightVar="origwt"), "edsurveyCor") # takes awhile
  
  sdf_dnf <- EdSurvey:::subset(sdf, b003601 == 1,verbose=FALSE)
  expect_is(c2_pear <- cor.sdf("composite", "b017451", sdf_dnf, method="Pearson", weightVar="origwt"), "edsurveyCor")
  expect_is(c2_spear <- cor.sdf("composite", "b017451", sdf_dnf, method="Spearman", weightVar="origwt"), "edsurveyCor")
  expect_is(c2_polys <- cor.sdf("composite", "b017451", sdf_dnf, method="Polyserial", weightVar="origwt"), "edsurveyCor")
})

context("In cor, variables as class character return errors")
test_that("In cor, variables as class", {
  skip_on_cran()
  df <- getData(sdf, c("b017451", "sdracem","origwt"),addAttributes = TRUE)
  df$sdracem <- as.character(df$sdracem)
  expect_error(cor.sdf("b017451", "sdracem",df,method="Pearson"))
})

context("Reordering a variable manually vs through cor.sdf")
test_that("Reordering a variable manually vs through cor.sdf", {
  skip_on_cran()
  gddat <- getData(sdf, c("b017451", "sdracem","origwt"), addAttributes = TRUE)
  # cast sdracem as a character and then reorder based on that
  gddat$sdracem <- lfactor(as.character(gddat$sdracem), levels=c(1, 2, 3, 4, 5, 6), labels=c("White", "Hispanic", "Black", "Asian/Pacific Island", "Amer Ind/Alaska Natv", "Other"))
  cor3 <- cor.sdf("b017451", "sdracem", sdf, method="Pearson", weightVar="origwt", reorder=list(sdracem=c("White","Hispanic","Black","Asian/Pacific Island","Amer Ind/Alaska Natv","Other")))
  cor4 <- cor.sdf("b017451", "sdracem", gddat, method="Pearson", weightVar="origwt")
  expect_equal(cor3,cor4)
  
  gddat$sdracem[gddat$sdracem=="Hispanic"] <- "White"
  gddat$sdracem <- factor(gddat$sdracem,levels=c("White", "Black","Asian/Pacific Island", "Amer Ind/Alaska Natv", "Other"))
  cor1Pe <- cor.sdf("b017451","sdracem", sdf, method="Pearson", weightVar="origwt",recode = list(sdracem=list(from="Hispanic", to="White")))
  cor2Pe <- cor.sdf("b017451","sdracem", gddat, method="Pearson", weightVar="origwt")
  expect_equal(cor1Pe,cor2Pe)
  # here lfacor not condensed
  cor3Pe <- cor.sdf("b017451","sdracem", sdf, method="Pearson", weightVar="origwt",recode = list(sdracem=list(from="Hispanic", to="White")), condenseLevels=FALSE)
  expect_equal(cor3Pe$correlation, -0.00299202137069835)
  #
  cor4Pe <- cor.sdf("b017451","sdracem", gddat, method="Pearson", weightVar="origwt", condenseLevels=FALSE)
  expect_equal(cor4Pe$correlation, -0.00232480033396954)
  
  cor1Sp <- cor.sdf("b017451","sdracem", sdf, method="Spearman", weightVar="origwt",recode = list(sdracem=list(from="Hispanic", to="White")))
  cor2Sp <- cor.sdf("b017451","sdracem", gddat, method="Spearman", weightVar="origwt")
  expect_equal(cor1Sp,cor2Sp)
  
  cor1pc <- cor.sdf("b017451","sdracem", sdf, method="Polychoric", weightVar="origwt",recode = list(sdracem=list(from="Hispanic", to="White")))
  cor2pc <- cor.sdf("b017451","sdracem", gddat, method="Polychoric", weightVar="origwt")
  expect_equal(cor1pc,cor2pc)
  
  sdf_dnf <- EdSurvey:::subset(sdf, sdracem==5 | sdracem==3 | sdracem==1,verbose=FALSE)
  cc1_pear <- cor.sdf("b017451", "sdracem", sdf_dnf, method="Pearson", weightVar="origwt", recode = list(sdracem=list(from=3, to=1)))
  cc2_pear <- cor.sdf("b017451", "sdracem", sdf_dnf, method="Pearson", weightVar="origwt", recode = list(sdracem=list(from="Hispanic", to="White")))
  expect_equal(cc1_pear,cc2_pear)
  cc1_spear <- cor.sdf("b017451", "sdracem", sdf_dnf, method="Spearman", weightVar="origwt", recode = list(sdracem=list(from=3, to=1)))
  cc2_spear <- cor.sdf("b017451", "sdracem", sdf_dnf, method="Spearman", weightVar="origwt", recode = list(sdracem=list(from="Hispanic", to="White")))
  expect_equal(cc1_spear,cc2_spear)
  cc1_polyc <- cor.sdf("b017451", "sdracem", sdf_dnf, method="Polychoric", weightVar="origwt", recode = list(sdracem=list(from=3, to=1)))
  cc2_polyc <- cor.sdf("b017451", "sdracem", sdf_dnf, method="Polychoric", weightVar="origwt", recode = list(sdracem=list(from="Hispanic", to="White")))
  expect_equal(cc1_polyc,cc2_polyc)
})

context("cor.sdf no level condensation")
test_that("cor.sdf no level condensation", {
  skip_on_cran()
  cor_nocondense <- cor.sdf(x="c046501", y="c044006", data=sdf, condenseLevels = FALSE)
  cor_nocondenseC <- capture.output(cor_nocondense)
  expect_equal(cor_nocondenseC, cor_nocondenseREF)
})

context("unweighted cor works")
test_that("unweighted cor works", {
  skip_on_cran()
  b1a <- cor.sdf("m815401", "b017451",method="Pearson", sdf,weightVar = "origwt")
  b1b <- cor.sdf("m815401", "b017451",method="Pearson", sdf,weightVar = NULL)
  expect_equal(b1a$correlation,b1b$correlation, tolerance=0.02, scale=1)
  
  b2a <- cor.sdf("m815401", "b017451",method="Spearman", sdf,weightVar = "origwt")
  b2b <- cor.sdf("m815401", "b017451",method="Spearman", sdf,weightVar = NULL)
  expect_equal(b2a$correlation,b2b$correlation, tolerance=0.02, scale=1)
} )


context("glm")
test_that("glm", {
  skip_on_cran()
  # data to test against
  logitDat <- getData(data=sdf, varnames=c("iep", "b017451", "dsex", "b013801", "origwt", "composite", "geometry"), omittedLevels=FALSE, addAttributes=TRUE)
  
  # test logit with no PVs
  logit0 <- logit.sdf(I(iep %in% "Yes") ~ dsex + b013801, data=sdf)
  # run just coef
  logitDat0 <- getData(data=logitDat, varnames=c("iep", "dsex", "b013801", "origwt"), omittedLevels=TRUE)
  logitDat0$iepY <- ifelse(logitDat0$iep %in% "Yes", 1, 0)
  suppressWarnings(ccoef <- coef(glm(iepY ~ dsex + b013801, data=logitDat0, weights=logitDat0$origwt, family=binomial(link="logit"))))
  expect_equal(coef(logit0), ccoef)
  
  logit1 <- logit.sdf(I(composite > 300) ~ dsex + b013801, data=sdf)
  logitDat1 <- getData(data=logitDat, varnames=c("composite", "dsex", "b013801", "origwt"), omittedLevels=TRUE)
  ccoef <- sapply(getPlausibleValue("composite", sdf), function(ci) {
    logitDat1$outcome <- ifelse(logitDat1[,ci] > 300, 1, 0)
    suppressWarnings(coef(glm(outcome ~ dsex + b013801, data=logitDat1, weights=logitDat1$origwt, family=binomial(link="logit"))))
  })
  ccoef <- apply(ccoef,1,mean)
  expect_equal(coef(logit1), ccoef, tolerance=1E-6)
  
  # test logit with PVs, multiple tests on that PV
  logit1b <- logit.sdf(I(composite > 300 & composite < 350) ~ dsex + b013801, data=sdf)
  ccoef <- sapply(getPlausibleValue("composite", sdf), function(ci) {
    logitDat1$outcome <- ifelse(logitDat1[,ci] > 300 & logitDat1[,ci] < 350, 1, 0)
    suppressWarnings(coef(glm(outcome ~ dsex + b013801, data=logitDat1, weights=logitDat1$origwt, family=binomial(link="logit"))))
  })
  ccoef <- apply(ccoef,1,mean)
  expect_equal(coef(logit1b), ccoef, tolerance=1E-6)
  
  # two survey items
  logit2 <- logit.sdf(I(iep %in% "Yes" & b017451 %in% "Every day") ~ dsex + b013801, data=sdf)
  logitDat2 <- getData(data=logitDat, varnames=c("iep", "b017451", "dsex", "b013801", "origwt"), omittedLevels=TRUE)
  logitDat2$outcome = ifelse(logitDat2$iep %in% "Yes" & logitDat2$b017451 %in% "Every day", 1, 0)
  suppressWarnings(ccoef <- coef(glm(outcome ~ dsex + b013801, data=logitDat2, weights=logitDat2$origwt, family=binomial(link="logit"))))
  expect_equal(coef(logit2), ccoef, tolerance=1E-6)
  
  # a PV with a relation and a survey item
  logit3 <- logit.sdf(I(composite > 300 & b017451 %in% "Every day") ~ dsex + b013801, data=sdf)
  logitDat3 <- getData(data=logitDat, varnames=c("composite", "dsex", "b017451", "b013801", "origwt"), omittedLevels=TRUE)
  ccoef <- sapply(getPlausibleValue("composite", sdf), function(ci) {
    logitDat3$outcome <- ifelse(logitDat3[,ci] > 300 & logitDat3$b017451 %in% "Every day", 1, 0)
    suppressWarnings(coef(glm(outcome ~ dsex + b013801, data=logitDat3, weights=logitDat3$origwt, family=binomial(link="logit"))))
  })
  ccoef <- apply(ccoef,1,mean)
  expect_equal(coef(logit3), ccoef, tolerance=1E-6)
  
  # a relation between two PVs
  logit4 <- logit.sdf(I(composite > geometry) ~ dsex + b013801, data=sdf)
  logitDat4 <- getData(data=logitDat, varnames=c("composite", "geometry", "dsex", "b013801", "origwt"), omittedLevels=TRUE)
  ccoef <- sapply(1:5, function(ii) {
    ci <- getPlausibleValue("composite", sdf)[ii]
    gi <- getPlausibleValue("geometry", sdf)[ii]
    logitDat4$outcome <- ifelse(logitDat4[,ci] > logitDat4[,gi], 1, 0)
    suppressWarnings(coef(glm(outcome ~ dsex + b013801, data=logitDat4, weights=logitDat4$origwt, family=binomial(link="logit"))))
  })
  ccoef <- apply(ccoef,1,mean)
  expect_equal(coef(logit4), ccoef, tolerance=1E-6)
  
  # two PVs with seperate relations
  logit4b <- logit.sdf(I(composite > 300 & geometry < 350) ~ dsex + b013801, data=sdf)
  ccoef <- sapply(1:5, function(ii) {
    ci <- getPlausibleValue("composite", sdf)[ii]
    gi <- getPlausibleValue("geometry", sdf)[ii]
    logitDat4$outcome <- ifelse(logitDat4[,ci] > 300 & logitDat4[,gi] < 350, 1, 0)
    suppressWarnings(coef(glm(outcome ~ dsex + b013801, data=logitDat4, weights=logitDat4$origwt, family=binomial(link="logit"))))
  })
  ccoef <- apply(ccoef,1,mean)
  expect_equal(coef(logit4b), ccoef, tolerance=1E-6)
  
  skip_on_cran()
  # test logit with PVs
  co <- capture.output(summary(logit1))
  expect_equal(co, logit1REF)
  
})

context("wald test")
test_that("wald test works", {
  # glm example
  skip_on_cran()
  myLogit <- logit.sdf(dsex ~ b017451 + b003501, data = sdf, returnNumberOfPSU=TRUE)
  wt_glm <- waldTest(model = myLogit, coefficients = 2:5)
  wt1 <- capture.output(wt_glm)
  expect_equal(wt1, wt1REF)
  
  # lm example
  fit <- lm.sdf(composite ~ dsex + b017451, data = sdf, returnNumberOfPSU=TRUE)
  wt_lm <- waldTest(model = fit, coefficients = "b017451")
  wt2 <- capture.output(wt_lm)
  expect_equal(wt2, wt2REF)

  # lm example with Taylor
  fit <- lm.sdf(composite ~ dsex + b017451, data = sdf, varMethod="Taylor", returnNumberOfPSU=TRUE)
  wt_lm <- waldTest(model = fit, coefficients = "b017451")
  wt3 <- capture.output(wt_lm)
  expect_equal(wt3, wt3REF)
  
  # lesdf example should return error for waldTest because strata and PSU vars needed
  gddat <- getData(data=sdf,
                   varnames=c("composite", "dsex", "b017451","b003501", "origwt"),
                   addAttributes = TRUE)
  myLogit2 <- logit.sdf(dsex ~ b017451 + b003501, data = gddat, returnVarEstInputs = T)
  expect_error(waldTest(myLogit2, coefficients = 2:5))

  # lesdf this example should work, including the PSU and stratum vars
  gddat <- getData(data=sdf,
                   varnames=c("composite", "dsex", "b017451","b003501", "origwt", getPSUVar(sdf), getStratumVar(sdf)),
                   addAttributes = TRUE)
  myLogit <- logit.sdf(dsex ~ b017451 + b003501, data = gddat, returnVarEstInputs = T)
  wt_lesdf <- waldTest(myLogit, coefficients = 2:5)
  wt4 <- capture.output(wt_lesdf)
  expect_equal(wt4, wt4REF)
  
})

context('edsurvey with $ method')
test_that("edsurvey with $ method",{
  # $ method work for existing attributes
  expect_equal(sdf$country,"USA")
  # $ method return a vector
  expect_equal(class(sdf$dsex), c("lfactor","factor"))
  # that vector has data
  dsexTab <- structure(c(Male = 8486L, Female = 8429L), .Dim = 2L,
                       .Dimnames = structure(list(c("Male", "Female")), .Names = ""),
                       class = "table")
  expect_equal(table(sdf$dsex), dsexTab)
  
  # $ method return a data.frame
  expect_equal(class(sdf$composite),"data.frame")
})

context('levelsSDF with multiple recodes')
test_that("levelsSDF with multiple recodes",{
  # $ method work for existing attributes
  df <- recode.sdf(sdf, recode = list(t088301=list(from=c("Yes, available","Yes, I have access"),
                                                   to=c("Yes")),
                                    t088301=list(from=c("No, have no access"),
                                                 to=c("No"))))
  df <- recode.sdf(df, recode = list(pared=list(from=c("Did not finish H.S.","Graduated H.S."),
                                                to=c("Graduated High School"))))

  levelsSDFoutput <- c("Levels for Variable 't088301' (Lowest level first):", "    8. Omitted", 
  "    0. Multiple", "    9. Yes", "    10. No")
  colsdf <- capture.output(levelsSDF("t088301",df))
  expect_equal(levelsSDFoutput, colsdf)
})

context('dplyr integration')
test_that("dplyr integration",{
  skip_on_cran()
  skip_if_not_installed("dplyr")
  require(dplyr)
  x <- sdf %>%
     getData(varnames=c("composite", "geometry", "dsex", "b017451","c052601", "origwt"), addAttributes = TRUE) %>% 
     mutate(avg_5 = (as.numeric(mrpcm1) + as.numeric(mrpcm2) + as.numeric(mrpcm3) + as.numeric(mrpcm4) + as.numeric(mrpcm5))/5) %>%
     rebindAttributes(sdf) %>%
     lm.sdf(composite - geometry ~ avg_5, data=.)
  co <- capture.output(summary(x))
  expect_equal(co, dplO)
})

context('use returnNumberOfPSU=TRUE') 
test_that("use returnNumberOfPSU", {
  skip_on_cran()
  # percentile
  pctPSU <- percentile("composite", percentiles = c(10,50), data = sdf, returnNumberOfPSU = TRUE)
  expect_equal(attr(pctPSU,'nPSU'), 124)
  
  # lm.sdf
  lmPSU <- lm.sdf(composite ~ dsex, data=sdf, returnNumberOfPSU = TRUE)
  expect_equal(lmPSU$nPSU,124)
  
  # gap
  gapPSU <- gap("composite",data=sdf, groupA = dsex %in% "Male", groupB = dsex %in% "Female", returnNumberOfPSU = TRUE)
  expect_equal(capture.output(gapPSU), gapPSUREF)
})


context('summary2')
test_that('summary2', {
  skip_on_cran()
  # Weighted with PV
  sPV_w <- capture.output(summary2(sdf,'composite'))
  expect_equal(sPV_w, sPV_wREF)
  
  # Unweighted
  sPV <- capture.output(summary2(sdf,'composite', weightVar = NULL))
  expect_equal(sPV, sPVREF)
  
  # Weighted discrete
  sDiscrete_w <- capture.output(summary2(sdf,'dsex'))
  expect_equal(sDiscrete_w, sDiscrete_wREF)
  
  # Unweighted discrete
  withr::with_options(list(digits=4),
               sDiscrete <- capture.output(summary2(sdf,'dsex', weightVar = NULL))
               )
  expect_equal(sDiscrete, sDiscreteREF)

})
