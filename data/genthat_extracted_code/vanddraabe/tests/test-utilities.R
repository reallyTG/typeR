## test-utilities.R
##
## feb-01-2017 (exe) created
## feb-02-2017 (exe) mostly complete
## feb-07-2017 (exe) alphabetized tests
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


context("utilities")

## load data file --------------------------------------------------------------
load(file="vanddraabe_DataForTesting.rda")

## aaStandardizeNames ----------------------------------------------------------
test_that("standardize amino acid names", {
  residue.names <- c("HIS", "HID", "HIE", "HIP", "HSD", "HSE", "HSP",
                     "CYS", "CYM", "CYX", "ASP", "ASH", "GLU", "GLH",
                     "LYS", "LYN")
  aaName.answers <- c("HIS", "HIS", "HIS", "HIS", "HIS", "HIS", "HIS",
                      "CYS", "CYS", "CYS", "ASP", "ASP", "GLU", "GLU",
                      "LYS", "LYS")
  expect_equal(aaStandardizeNames(residue.names), aaName.answers)

  residue.names <- c(residue.names, 1, 2, 3)
  aaName.answers <- c(aaName.answers, 1, 2, 3)
  expect_equal(aaStandardizeNames(residue.names), aaName.answers)
})


## ConservationSet -------------------------------------------------------------
test_that("assignment to conservation set works", {
  pct.conserved <- c(100, 95, 90, 85, 80, 75, 70, 65, 60, 55,
                      50, 45, 40, 35, 30, 25, 20, 15, 10, 10)
  conservation.set <- c("set5", "set4", "set4", "set3", "set3", "set2", "set2",
                        "set1", "set1", "set1", "set1", "set0", "set0", "set0",
                        "set0", "set0", "set0", "set0", "set0", "set0")
  expect_equal(ConservationSet(pct.conserved), conservation.set)
})

## ExtractPDBids ---------------------------------------------------------------
test_that("extraction of PDBid works", {
  expect_equal(ExtractPDBids("1hai.pdb"), "1hai")
  expect_equal(ExtractPDBids("/home/someuser/pdbs/1hai.pdb"), "1hai")
})


## ExtractFileTimeStamp --------------------------------------------------------
test_that("ExtractFileTimeStamp returns the correct formatted date and time", {
  filename <- "ConservedWaters_PASSED_may042016_1234.pdb"
  expect_equal(ExtractFileTimeStamp(filename), "may042016_1234")
})


## FileTimeStamp ---------------------------------------------------------------
test_that("FileTimeStamp returns the correct formatted date and time", {
  current.time <- as.POSIXct("2016-05-04 12:34:56.78", tz = "UTC")
  expect_equal(FileTimeStamp(current.time), "may042016_1234")
})


## getAtomTypeCounts -----------------------------------------------------------
test_that("counting AtomTypes works", {
  set.seed(13)
  num.AtomTypes <- sample(1:10, 30, replace = TRUE)
  atom.types <- rep(sample(names.res.AtomTypes, 30), num.AtomTypes)
  ATCounts.answer <- c(0,0,0,1,0,0,0,0,8,0,7,0,0,1,0,0,0,1,0,0,1,0,4,0,0,0,0,0,
                       0,0,0,0,4,0,0,9,0,0,0,0,0,0,0,0,0,0,0,5,0,6,0,0,0,0,0,0,
                       0,0,6,0,0,0,0,0,7,0,0,3,0,0,8,0,0,6,0,0,0,0,0,0,0,0,2,0,
                       0,0,0,0,10,0,0,0,0,6,7,0,0,6,0,0,7,0,0,0,0,0,0,0,0,9,0,
                       0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,
                       4,0,0,0,6,0,0,0,0,0,9,0,4,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0)
  expect_equal(getAtomTypeCounts(atom.types), ATCounts.answer)
})


## getResTypeCounts ------------------------------------------------------------
test_that("counting residue types works", {
  set.seed(13)
  num.ResTypes <- sample(1:10, 20, replace = TRUE)
  res.types <- rep(names.residues, num.ResTypes)
  expect_equal(getResTypeCounts(res.types), num.ResTypes)
})


## HasXWaters ------------------------------------------------------------------
test_that("the number of waters are correctly counted", {
  resids <- c("ALA", "HOH", "WAT", "ALA", "HOH", "DOD", "ALA", "HOH")
  expect_equal(HasXWaters(resids, min.num.h2o=4),
               list(has.h2o.tf=TRUE, num.water=5) )
  expect_equal(HasXWaters(resids, min.num.h2o=6),
               list(has.h2o.tf=FALSE, num.water=5) )
})


## Nearby ----------------------------------------------------------------------
test_that("nearby returns atoms near the set of interest", {
  nearby.prot.idc.ans <- c(11, 12, 13)
  expect_equal(Nearby(distances = PDB.1hai.aoi.clean.dist[2, ],
                      set.idc = prot.idc,
                      radius = 3.6),
               nearby.prot.idc.ans)
  ## formatC(PDB.1hai.aoi.clean.dist[h2o.idc[1], nearby.prot.idc.ans], digits=10)
  nearby.prot.idc.value.ans <- c(3.590038718, 3.204152462, 3.55045307)
  expect_equal(as.vector(PDB.1hai.aoi.clean.dist[2, nearby.prot.idc.ans]),
               nearby.prot.idc.value.ans)
})


## ProtHetWatIndices -----------------------------------------------------------
test_that("protein, hetam, water indices are correctly determined", {
  expect_equal(ProtHetWatIndices(thrombin.1hai$atom[c(1:10, 2341:2350, 2385:2394), ]),
               list(prot.idc=c(1:10), het.idc=c(11:20), h2o.idc=c(21:30)) )
})


## res2xyz ---------------------------------------------------------------------
test_that("residue indices are converted to XYZ coordinates", {
  expect_equal(res2xyz(5:10), 13:30)
  expect_equal(res2xyz(5), 13:15)
})

## resAtomType2AtomClass -------------------------------------------------------
test_that("the AtomType classification conversion works", {
  expect_equal(resAtomType2AtomClass(resAT="GLU N"), "Nitrogen")
  expect_equal(resAtomType2AtomClass(resAT="LYS NZ"), "Nitrogen (+)")
  expect_equal(resAtomType2AtomClass(resAT="UNK N"), "Nitrogen")
  expect_equal(resAtomType2AtomClass(resAT="VAL O"), "Oxygen")
  expect_equal(resAtomType2AtomClass(resAT="ASP OD2"), "Oxygen (-)")
  expect_equal(resAtomType2AtomClass(resAT="UNK O"), "Oxygen")
  expect_equal(resAtomType2AtomClass(resAT="GLN CA"), "Carbon")
  expect_equal(resAtomType2AtomClass(resAT="UNK CB"), "Carbon")
  expect_equal(resAtomType2AtomClass(resAT="CYS SG"), "Sulfur")
  expect_equal(resAtomType2AtomClass(resAT="UNK SG"), "Sulfur")
})

## RescaleValues ---------------------------------------------------------------
test_that("rescaling data values works", {
  expect_equal(RescaleValues(0:10, newMin = 0, newMax = 1),
               seq(from = 0, to = 1, by = 0.1))
})

test_that("rescaling data values stops when newMin is greater than newMax", {
  expect_error(RescaleValues(0:10, newMin = 10, newMax = 1))
})

test_that("rescaling data values stops when newMin is equal to newMax", {
  expect_error(RescaleValues(0:10, newMin = 1, newMax = 1))
})


## TimeSpan --------------------------------------------------------------------
test_that("time span works", {
  time.start <- Sys.time() - 25
  expect_equal(TimeSpan(time.start), "00:00:25")
})


## UniqueAtomHashes ------------------------------------------------------------
test_that("unique atom hashes works", {
  atoms.oi <- thrombin.1hai$atom[1:10, ]
  cols.oi <- c("elety", "resid", "chain", "resno")
  UniqAtomHash.answer <- c("N_THR_L_1","CA_THR_L_1","C_THR_L_1","O_THR_L_1",
                           "CB_THR_L_1","OG1_THR_L_1","CG2_THR_L_1","N_PHE_L_1",
                           "CA_PHE_L_1","C_PHE_L_1")
  expect_equal(UniqueAtomHashes(atoms.oi, cols.oi, separator = "_"),
               UniqAtomHash.answer)
})

test_that("unique atom hashes identifies inappropriate separators", {
  atoms.oi <- thrombin.1hai$atom[1:10, ]
  cols.oi <- c("elety", "resid", "chain", "resno")
  expect_message(UniqueAtomHashes(atoms.oi, cols.oi, separator = "!"),
                 "is not acceptable. The default separator")
})
