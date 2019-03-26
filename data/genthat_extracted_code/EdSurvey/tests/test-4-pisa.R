skip_on_cran()
require(testthat)
require(EdSurvey)
require(WeMix)
options(width = 500)
options(useFancyQuotes=FALSE)
context("PISA data reads in correctly")
#source("REF-4-pisa.R") # has REF output in it

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

# Test =================
# Check multiple-path read-in
test_that("PISA multiple path read-in", {
  multiESDFL <- readPISA(paste0(edsurveyHome,c("PISA/2009","PISA/2012")), countries="usa",verbose=FALSE)
  expect_is(multiESDFL,"edsurvey.data.frame.list")
  expect_equal(colnames(multiESDFL$covs), c("subject","year","country"))
  expect_equal(length(multiESDFL$datalist),2)
})
 
# 1. Check data read-in
test_that("PISA data reads in correctly", {
  expect_silent(downloadPISA(root=edsurveyHome, year=c(2006, 2009, 2012), cache=FALSE, verbose = FALSE))
  expect_silent(downloadPISA(root=edsurveyHome, year=2012, database="CBA", cache=FALSE, verbose = FALSE))
  expect_silent(suppressWarnings(usaINT2012 <<- readPISA(paste0(edsurveyHome, "PISA/2012"), countries = "usa", verbose = FALSE)))
  expect_silent(suppressWarnings(qcnCBA2012 <<- readPISA(paste0(edsurveyHome, "PISA/2012"), database = "CBA", countries = "qcn", verbose = FALSE))) # Shanghai
  expect_silent(suppressWarnings(jpn2009 <<- readPISA(paste0(edsurveyHome, "PISA/2009"), countries = "jpn", verbose = FALSE)))
  expect_silent(suppressWarnings(aus2006 <<- readPISA(paste0(edsurveyHome, "PISA/2006"), countries = "aus", verbose = FALSE)))


  expect_is(usaINT2012,"edsurvey.data.frame")
  expect_is(qcnCBA2012,"edsurvey.data.frame")
  expect_is(jpn2009,"edsurvey.data.frame")
  expect_is(aus2006,"edsurvey.data.frame")
  expect_equal(dim(usaINT2012),c(4978,1262))
  expect_equal(dim(qcnCBA2012),c(5177,1345))
  expect_equal(dim(jpn2009),c(6088,981))
  expect_equal(dim(aus2006),c(14170,1019))
})

context("PISA showPlausibleValues and showWeights verbose output agrees")
test_that("PISA showPlausibleValues and showWeights verbose output agrees", {
  spv <- c("There are 10 subject scale(s) or subscale(s) in this edsurvey.data.frame",           
            "  'math' subject scale or subscale with 5 plausible values (the default). They are:",
            "    'pv1math' 'pv2math' 'pv3math' 'pv4math' 'pv5math'",                              
            "  'macc' subject scale or subscale with 5 plausible values. They are:",              
            "    'pv1macc' 'pv2macc' 'pv3macc' 'pv4macc' 'pv5macc'",                              
            "  'macq' subject scale or subscale with 5 plausible values. They are:",              
            "    'pv1macq' 'pv2macq' 'pv3macq' 'pv4macq' 'pv5macq'",             
            "  'macs' subject scale or subscale with 5 plausible values. They are:",            
            "    'pv1macs' 'pv2macs' 'pv3macs' 'pv4macs' 'pv5macs'",           
            "  'macu' subject scale or subscale with 5 plausible values. They are:",          
            "    'pv1macu' 'pv2macu' 'pv3macu' 'pv4macu' 'pv5macu'",         
            "  'mape' subject scale or subscale with 5 plausible values. They are:",              
            "    'pv1mape' 'pv2mape' 'pv3mape' 'pv4mape' 'pv5mape'",                              
            "  'mapf' subject scale or subscale with 5 plausible values. They are:",              
            "    'pv1mapf' 'pv2mapf' 'pv3mapf' 'pv4mapf' 'pv5mapf'",                              
            "  'mapi' subject scale or subscale with 5 plausible values. They are:",              
            "    'pv1mapi' 'pv2mapi' 'pv3mapi' 'pv4mapi' 'pv5mapi'",                              
            "  'read' subject scale or subscale with 5 plausible values. They are:",              
            "    'pv1read' 'pv2read' 'pv3read' 'pv4read' 'pv5read'",                              
            "  'scie' subject scale or subscale with 5 plausible values. They are:",              
            "    'pv1scie' 'pv2scie' 'pv3scie' 'pv4scie' 'pv5scie'"                              
  )
  co <- capture.output(showPlausibleValues(usaINT2012, verbose = TRUE))
  expect_equal(co,spv)
  
  sw <- c("There are 1 full sample weight(s) in this edsurvey.data.frame", 
          "  'w_fstuwt' with 80 JK replicate weights (the default). Jackknife replicate weight variables:",
          " [1] \"w_fstr1\"  \"w_fstr2\"  \"w_fstr3\"  \"w_fstr4\"  \"w_fstr5\"  \"w_fstr6\"  \"w_fstr7\"  \"w_fstr8\"  \"w_fstr9\"  \"w_fstr10\" \"w_fstr11\" \"w_fstr12\" \"w_fstr13\" \"w_fstr14\" \"w_fstr15\" \"w_fstr16\" \"w_fstr17\" \"w_fstr18\" \"w_fstr19\" \"w_fstr20\" \"w_fstr21\" \"w_fstr22\" \"w_fstr23\" \"w_fstr24\" \"w_fstr25\" \"w_fstr26\" \"w_fstr27\" \"w_fstr28\" \"w_fstr29\" \"w_fstr30\" \"w_fstr31\" \"w_fstr32\" \"w_fstr33\" \"w_fstr34\" \"w_fstr35\" \"w_fstr36\" \"w_fstr37\" \"w_fstr38\" \"w_fstr39\" \"w_fstr40\" \"w_fstr41\" \"w_fstr42\" \"w_fstr43\" \"w_fstr44\" \"w_fstr45\"",
          "[46] \"w_fstr46\" \"w_fstr47\" \"w_fstr48\" \"w_fstr49\" \"w_fstr50\" \"w_fstr51\" \"w_fstr52\" \"w_fstr53\" \"w_fstr54\" \"w_fstr55\" \"w_fstr56\" \"w_fstr57\" \"w_fstr58\" \"w_fstr59\" \"w_fstr60\" \"w_fstr61\" \"w_fstr62\" \"w_fstr63\" \"w_fstr64\" \"w_fstr65\" \"w_fstr66\" \"w_fstr67\" \"w_fstr68\" \"w_fstr69\" \"w_fstr70\" \"w_fstr71\" \"w_fstr72\" \"w_fstr73\" \"w_fstr74\" \"w_fstr75\" \"w_fstr76\" \"w_fstr77\" \"w_fstr78\" \"w_fstr79\" \"w_fstr80\"",
          "")
  co <- capture.output(showWeights(usaINT2012, verbose = TRUE))
  expect_equal(co, sw)
})

context("PISA getData")
test_that("PISA getData", {
  expect_known_value(gd1 <- getData(usaINT2012,c("st04q01","st20q01")), file = "PISAgd1.rds", update = FALSE)
  expect_known_value(gd2 <- getData(qcnCBA2012,c("st04q01","st20q01")), file = "PISAgd2.rds", update = FALSE)
  expect_known_value(gd3 <- getData(jpn2009,c("s514q03","bookid")), file = "PISAgd3.rds", update = FALSE)
  expect_known_value(gd4 <- getData(aus2006,c("isi")), file = "PISAgd4.rds", update = FALSE)
})

context("PISA subset data")
test_that("PISA subset data", {
  usa12_female <- subset(usaINT2012, st04q01 == "Female", verbose = FALSE)
  expect_equal(dim(usa12_female),c(2453,1262))
})

context("PISA showCutPoints")
test_that("PISA showCutPoints", {
  sc <- c("Achievement Levels:",
          "  Mathematics:  357.77, 420.07, 482.38, 544.68, 606.99, 669.3", 
          "  Problem Solving:  358.49, 423.42, 488.35, 553.28, 618.21, 683.14", 
          "  Reading:  262.04, 334.75, 407.47, 480.18, 552.89, 625.61, 698.32")
  co <- capture.output(showCutPoints(qcnCBA2012))
  expect_equal(co,sc)
})

# 2. Check analytical functions
context("PISA edsurveyTable")
test_that("PISA edsurveyTable", {
  edTable1 <- edsurveyTable(math ~ st04q01 + st20q01, data = usaINT2012)
  withr::with_options(list(digits=7),
                      edTable1c <- capture.output(edTable1)
                     )
  expect_equal(edTable1c, pisaedTable1REF)
})


context("PISA lm.sdf")
test_that("PISA lm.sdf", {
  plm1 <- lm.sdf(macq ~ st29q06 + sc01q01, data = usaINT2012)
  withr::with_options(list(digits=7),
                      plm1c <- capture.output(plm1)
                      )
  expect_equal(plm1c,plm1REF)
})

context("PISA gap")
test_that("PISA gap", {
  pgap1 <- gap(variable = "math", data = usaINT2012,
      groupA = st04q01 == "Male" , groupB = st04q01 == "Female", weightVar = 'w_fstuwt')
  withr::with_options(list(digits=7),
                      pgap1c <- capture.output(pgap1)
                      )
  expect_equal(pgap1c,pgap1REF)
  
  pgap2 <- gap(variable = "math", data = usaINT2012,
               groupA = st04q01 == "Male" , groupB = st04q01 == "Female", weightVar = 'w_fstuwt', percentiles = c(50,90))
  withr::with_options(list(digits=7), pgap2c <- capture.output(pgap2))
  expect_equal(pgap2c,pgap2REF)
})

context("PISA achievementLevels")
test_that("PISA achievementLevels", {
  al1 <- achievementLevels(achievementVars = "cpro", aggregateBy = "st04q01", data = qcnCBA2012)
  withr::with_options(list(digits=7), al1c <- capture.output(al1))
  expect_equal(al1c,al1REF)
})

context("PISA glm")
test_that("PISA glm", {
  logit1 <- logit.sdf(I(st04q01=="Male") ~ st20q01 + st48q01 + st87q01, data=qcnCBA2012)
  coefREF <- c("(Intercept)"         =  0.898510256928794,
            "st20q01Other country"= -0.637039679070128,
            "st48q01Courses after school Test Language" =  0.0570384010137383,
            "st87q01Agree"        = -1.02420699129252,
            "st87q01Disagree"     = -0.984759761693152,
            "st87q01Strongly disagree" = -0.896205635267306)
  expect_equal(coef(logit1), coefREF)
  se <- c("(Intercept)"         = 0.383392563610423,
          "st20q01Other country"= 0.481575743890542,
          "st48q01Courses after school Test Language" = 0.1112482333064,
          "st87q01Agree"        = 0.418721001158844,
          "st87q01Disagree"     = 0.38157294795411,
          "st87q01Strongly disagree" = 0.400877207648506)
  expect_equal(logit1$se, se)
})
