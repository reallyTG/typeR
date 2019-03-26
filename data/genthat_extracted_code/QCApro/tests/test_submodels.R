library(QCApro)
context("submodels")

data(d.represent)
sol <- eQMC(d.represent, outcome = "WNP")

# error messages

test_that("submodels generates correctness-preserving submodels", {

 expect_error(submodels("a*B + Bc + D"), 
              "The conjunction operator is not used consistently")
 
 expect_error(submodels("aB + Bc + D <- Z"), 
              "The form of the expression was not as expected")
 
 expect_error(submodels("abC + AcD  <-> d"), 
              "The same factor")
 
 expect_error(submodels("aB + CDC"), 
              "Check the expression")
 
 expect_error(submodels("aB + cC"), 
              "Check the expression")
 
 expect_error(submodels("aB + c + C"), 
              "The provided model")
 
 expect_error(submodels("cC"), 
              "The provided model")
 
 expect_error(submodels("FG + fH + GH"), 
              "The provided model")
 
 expect_error(submodels(sol), 
              "If an object of class 'qca'")
})

