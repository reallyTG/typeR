library(QCApro)
context("ambiguity")

# dataset
data(d.tumorscreen)

# error messages

test_that("ambiguity analyzes design variations", {
 
  expect_error(ambiguity(d.tumorscreen, outcome = ""), 
               "No outcome/s is/are specified")
  
  expect_error(ambiguity(d.tumorscreen, outcome = "HPF", neg.out = c(TRUE, FALSE, TRUE)), 
                "The argument 'neg.out' must be")
  
  expect_error(ambiguity(d.tumorscreen, outcome = "HPF", neg.out = c(TRUE, TRUE)), 
               "The argument 'neg.out' must be")
  
  expect_error(ambiguity(d.tumorscreen, outcome = "HPF", neg.out = c(TRUE, "F")), 
               "The argument 'neg.out' must be")
  
  expect_error(ambiguity(d.tumorscreen, outcome = "HPF", tuples = c()), 
               "At least one tuple")
  
  expect_error(ambiguity(d.tumorscreen, outcome = "HPF", exo.facs = c("CA","AR","RR","DR","DC","PR"),
                         tuples = 1:5), 
               "The minimum tuple size is two")
  
  expect_error(ambiguity(d.tumorscreen, outcome = "HPF", exo.facs = c("CA","AR","RR","DR","DC","PR"),
                         tuples = 3:7), 
               "The minimum tuple size is two")
  
  expect_error(ambiguity(d.tumorscreen, outcome = "HPF", exo.facs = c("CA","AR","RR","DR","DC","PR"),
                         tuples = 3:5, incl.cut1 = c(1), incl.cut0 = c(1,0.8)), 
               "The vectors of inclusion cut-offs")
  
  expect_error(ambiguity(d.tumorscreen, outcome = "HPF", exo.facs = c("CA","AR","RR","DR","DC","PR"),
                         tuples = 3:5, row.dom = c(TRUE), min.dis = c(TRUE, FALSE)), 
               "The vectors of the arguments")
})

