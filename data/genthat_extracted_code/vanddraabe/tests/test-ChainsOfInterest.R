## test-ChainsOfInterest.R
##
## feb-28-2017 (exe) created
## feb-28-2017 (exe) working
## jul-25-2017 (exe) updated documentation
##
## Please direct all questions to Emilio Xavier Esposito, PhD
## exeResearch LLC, East Lansing, Michigan 48823 USA
## http://www.exeResearch.com
## emilio AT exeResearch DOT com
## emilio DOT esposito AT gmail DOT com
##
## Copyright (c) 2017, Emilio Xavier Esposito
##
## Permission is hereby granted, free of charge, to any person obtaining
## a copy of this software and associated documentation files (the
## "Software"), to deal in the Software without restriction, including
## without limitation the rights to use, copy, modify, merge, publish,
## distribute, sublicense, and/or sell copies of the Software, and to
## permit persons to whom the Software is furnished to do so, subject to
## the following conditions:
##
## The above copyright notice and this permission notice shall be
## included in all copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
## EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
## MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
## NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
## LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
## OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
## WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
##
## Based on http://opensource.org/licenses/MIT
##


context("Chains Of Interest")

## load data file --------------------------------------------------------------
load(file="vanddraabe_DataForTesting.rda")


## DetermineChainsOfInterest ---------------------------------------------------
test_that("the determination of the user provided chain of interest works", {
  expect_equal(DetermineChainsOfInterest("first"), "first")
  expect_equal(DetermineChainsOfInterest("ALL"), "all")
  expect_equal(DetermineChainsOfInterest("D"), "user")
  expect_equal(DetermineChainsOfInterest(c("H", "L")), "user")
  expect_equal(DetermineChainsOfInterest("vanddraabe"), "first")
  expect_message(DetermineChainsOfInterest("vanddraabe"),
                 "The provided chain ID")
})


## RetainChainsOfInterest ------------------------------------------------------
test_that("the determination of the user provided chain of interest works", {
  expect_equal_to_reference(RetainChainsOfInterest(PDB.4dfr$atom,
                                                   "B", "user"),
                            file = "RetainChainsOfInterest_4dfr_Bchain.rds")
  expect_equal_to_reference(RetainChainsOfInterest(PDB.1hai$atom,
                                                   c("H", "L"), "user"),
                            file = "RetainChainsOfInterest_1hai_LHchains.rds")
  expect_equal_to_reference(RetainChainsOfInterest(PDB.4dfr$atom,
                                                   "A", "first"),
                            file = "RetainChainsOfInterest_4dfr_Achain.rds")
  expect_message(RetainChainsOfInterest(PDB.1hai$atom, "J", "user"),
                 "Some of the requested chains are NOT present")
})

#'   RetainChainsOfInterest(PDB.4dfr$atom, "B", "user")
#'
#'










