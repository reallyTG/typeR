library(QCApro)
context("eQMC")

# clean dataset
dat <- data.frame(A = c(0,0,0,0,1,1),
                  B = c(0,1,1,1,1,1),
                  C = c(0,0,0,1,0,0),
                  D = c(0,0,1,1,0,1),
                  Y = c(0,0,0,0,1,1))

# error messages

test_that("eQMC performs the minimization", {

 expect_error(eQMC(dat, outcome = "Y", sol.type = "psm"), 
              "The specified solution type")
 
 expect_error(eQMC(dat, outcome = "Y", sol.type = "cs", dir.exp = c(rep(1,4))), 
              "Directional expectations cannot be specified")
 
 expect_error(eQMC(dat, outcome = "Y", minimize = ""), 
              "You have not specified any minterms")
 
 expect_error(eQMC(dat, outcome = "Y", minimize = c("2")), 
              "The specified value to the argument 'minimize'")
 
 expect_error(eQMC(dat, outcome = "Y", minimize = c("1", "0")), 
              "The specified value to the argument 'minimize'")
})

