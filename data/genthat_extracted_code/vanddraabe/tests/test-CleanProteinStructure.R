## test-CleanProteinStructures.R
##
## feb-03-2017 (exe) created
## feb-03-2017 (exe) mostly complete
## feb-09-2017 (exe) added RemoveOoR.b and RemoveOoR.o tests
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


context("Clean Protein Structures")

## load data file --------------------------------------------------------------
load(file="vanddraabe_DataForTesting.rda")


## RemoveHydrogenAtoms ---------------------------------------------------------
test_that("hydrogen atoms are really removed", {
  expect_equal_to_reference(RemoveHydrogenAtoms(PDB.5rxn$atom),
                            file = "PDB_5rxn_noHydrogenAtoms.rds")
})


## RemoveModeledAtoms ---------------------------------------------------------
test_that("modeled atoms are really removed", {
  expect_equal_to_reference(RemoveModeledAtoms(PDB.1ecd$atom),
                            file = "PDB_1ecd_noModeledAtoms.rds")
})


## RemoveOoR.o ----------------------------------------------------------------
test_that("atoms with occupancy values out of range are really removed", {
  expect_equal_to_reference(RemoveOoR.o(PDB.4dfr$atom),
                            file = "PDB_4dfr_OoR_occupancy.rds")
})


## RemoveOoR.b ----------------------------------------------------------------
test_that("atoms with B-values out of range are really removed", {
  expect_equal_to_reference(RemoveOoR.b(PDB.4ape$atom),
                            file = "PDB_4ape_OoR_Bvalue.rds")
})
