library(testthat)
library(Rpolyhedra)
library(stringr)
library(futile.logger)
library(rgl)


#Change threshold to ERROR. Comment out/change if verbosity required for development
futile.logger::flog.threshold(futile.logger::ERROR)

#' getDataDirMockedTest mocked function for a temp dest folder for testing proposes



testthat::test_check("Rpolyhedra")
