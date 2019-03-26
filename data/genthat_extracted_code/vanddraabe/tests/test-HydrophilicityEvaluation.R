## test-HydrophilicityEvaluation.R
##
## feb-23-2017 (exe) created
## feb-27-2017 (exe) working
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


context("HydrophilicityEvaluation")

## load data file --------------------------------------------------------------
load(file="vanddraabe_DataForTesting.rda")


## getResidueData ------------------------------------------------------------
test_that("the residue counts and SASA values are correct", {
  expect_equal_to_reference(getResidueData(atoms.oi.prot = PDB.1hai.aoi.clean.SASA.prot,
                                           SurExp.res.atoms.tf = PDB.1hai.SurExp.res.atoms.tf),
                            file = "getResidueData_1hai.rds")
})


## getProtAtomsNearWater ------------------------------------------------------------
test_that("the residue counts and SASA values are correct", {
  expect_equal_to_reference(getProtAtomsNearWater(h2o.oi = PDB.1hai.h2o.oi,
                                                  h2o.idc = PDB.1hai.clean.h2o.idc,
                                                  atoms.oi = PDB.1hai.aoi.clean.SASA,
                                                  h2o.prot.dists = PDB.1hai.h2o.prot.dists,
                                                  h2o.prot.dists.tf = PDB.1hai.h2o.prot.dists.tf),
                            file = "getProtAtomsNearWater_1hai.rds")
})


## calcAtomClassHydrophilicity ------------------------------------------------------------
test_that("the calculate atom type classes hydrophilicity values are correct", {
  expect_equal_to_reference(calcAtomClassHydrophilicity(HydrophilicityTable),
                            file = "calcAtomClassHydrophilicity.rds")
})


