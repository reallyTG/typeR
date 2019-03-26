library(QCApro)
context("truthTable")

# clean dataset
dat <- data.frame(A = c(0,0,0,0,1,1),
                  B = c(0,1,1,1,1,1),
                  C = c(0,0,0,1,0,0),
                  D = c(0,0,1,1,0,1),
                  Y = c(0,0,0,0,1,1))

# dataset with missing values
dat.na <- data.frame(A = c(NA,0,0,0,1,1),
                     B = c(0,1,1,1,1,1),
                     C = c(0,0,0,1,0,0),
                     D = c(0,0,1,1,0,1),
                     Y = c(0,0,0,0,1,1))

# uncalibrated data
dat.uc <- data.frame(A = c(-5,0,0,0,1,1),  # -5 not allowed
                     B = c(1.2,1,1,1,1,1), # 1.2 not allowed
                     C = c(0,0,0,1,0,0),
                     D = c(0,0,1,1,0,1),
                     Y = c(0,0,0,0,1,1))

# multi-value data outcome
dat.mv <- data.frame(A = c(0,0,0,0,1,1),
                     B = c(0,1,1,1,1,1),
                     C = c(0,0,0,1,0,0),
                     D = c(0,0,1,1,0,1),
                     Y = c(0,2,0,0,1,1))

# exo.facs lower case
dat.exo.low <- data.frame(a = c(0,1,0,0,1,1),
                          B = c(0,1,1,1,1,1),
                          C = c(0,0,0,1,0,0),
                          D = c(0,0,1,1,0,1),
                          Y = c(0,1,0,0,1,1))

# outcome lower case
dat.out.low <- data.frame(A = c(0,1,0,0,1,1),
                          B = c(0,1,1,1,1,1),
                          C = c(0,0,0,1,0,0),
                          D = c(0,0,1,1,0,1),
                          y = c(0,1,0,0,1,1))

data(d.jobsecurity)
dat.EMM <- d.jobsecurity

# error messages

test_that("truthTable builds the truth table", {
  
  # 'data', 'outcome', 'exo.facs'
  #-----------------------------------------------------------------------------
  expect_error(truthTable(dat, outcome = ""), 
               "No outcome is specified")
 
  expect_error(truthTable(dat, outcome = "Z"), 
               "The name of the outcome is incorrect")
  
  expect_error(truthTable(dat.mv, outcome = "Z{3}"), 
               "The endogenous factor")
  
  expect_error(truthTable(dat.mv, outcome = "Y{3}"), 
               "The endogenous factor")
  
  expect_error(truthTable(dat.na, outcome = "Y"), 
               "Included factors must not contain missing values")
 
  expect_error(truthTable(dat, outcome = "Y", exo.facs = c("A","B","C","D", "Y")), 
               "The factor of the outcome")

  expect_error(truthTable(dat, outcome = "Y", exo.facs = c("A","B","C","X")), 
               "The following exogenous factors")
  
  expect_error(truthTable(dat, outcome = "Y", exo.facs = c("A")), 
               "At least two exogenous")
  
  expect_error(truthTable(dat.na, outcome = "Y", exo.facs = c("A","B","C","D")), 
               "Included factors must not contain missing values")
  
  # uncalibrated data
  #-----------------------------------------------------------------------------
  expect_error(truthTable(dat.uc, outcome = "Y"), 
               "Uncalibrated data have been found")
  
  # 'incl.cut1' and 'incl.cut0'
  #-----------------------------------------------------------------------------
  expect_error(truthTable(dat, outcome = "Y", incl.cut1 = 1.8), 
               "The argument 'incl.cut1' has to be")
  
  expect_error(truthTable(dat, outcome = "Y", incl.cut0 = 1.8), 
               "The argument 'incl.cut0' has to be")
  
  expect_error(truthTable(dat, outcome = "Y", incl.cut1 = 1.8, incl.cut0 = -0.8), 
               "The arguments 'incl.cut1' and 'incl.cut0'")
  
  expect_error(truthTable(dat, outcome = "Y", incl.cut1 = 0.8, incl.cut0 = 0.9), 
               "The value of the argument 'incl.cut0'")
  
  # 'inf.test'
  #-----------------------------------------------------------------------------
  expect_error(truthTable(dat, outcome = "Y", inf.test = c("somethingelse")), 
               "Please check the first value")
  
  expect_error(truthTable(dat.EMM, outcome = "JSR", inf.test = c("binom", 0.1)), 
               "The binomial test is unsuitable")
  
  expect_error(truthTable(dat, outcome = "Y", inf.test = c("binom", 1.5)), 
               "The critical significance level")  
  
  
  # warnings
  #-----------------------------------------------------------------------------
  expect_warning(truthTable(dat.out.low, outcome = "y"), 
                 "The outcome")

  expect_warning(truthTable(dat.out.low, outcome = "y", exo.facs = c("A","B","C","D")), 
                 "The outcome")  
  
  expect_warning(truthTable(dat.exo.low, outcome = "Y"), 
                 "The label of at least")
  
  expect_warning(truthTable(dat.exo.low, outcome = "Y", exo.facs = c("a","B","C","D")), 
                 "The label of at least")
  
  expect_warning(truthTable(dat, outcome = "Y", incl.cut1 = 0.4), 
                 "The minimum sufficiency inclusion score")
  
  expect_warning(truthTable(dat, outcome = "Y", incl.cut0 = 0.6), 
                 "The maximum sufficiency inclusion score")
  
})

