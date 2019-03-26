## test-BoundWaterEnvironments.R
##
## feb-03-2017 (exe) created
## feb-03-2017 (exe) mostly complete
## apr-26-2017 (exe) added calcNearbyHydrationFraction() test
## apr-26-2017 (exe) added calcNumHydrogenBonds() test
## apr-26-2017 (exe) added BoundWaterEnvironment.quality() test
## jul-25-2017 (exe) updated documentation
## jul-31-2017 (exe) added calcBvalue() test
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


context("Bound Water Environments")

## load data file --------------------------------------------------------------
load(file="vanddraabe_DataForTesting.rda")


## NormalizedBvalue ------------------------------------------------------------
test_that("the correct normalized Bvalues are returned", {
  Bvalues <- seq(from = 10, to = 75, by = 5)
  ## formatC(NormalizedBvalue(seq(from = 10, to = 75, by = 5)), digits = 10)
  nBvalues.answer <- c(-1.553797192,  -1.31475147,   -1.075705748,
                       -0.8366600265, -0.5976143047, -0.3585685828,
                       -0.1195228609,  0.1195228609,  0.3585685828,
                        0.5976143047,  0.8366600265,  1.075705748,
                        1.31475147, 1.553797192)
  expect_equal(NormalizedBvalue(Bvalues), nBvalues.answer)
})


## Mobility --------------------------------------------------------------------
test_that("the correct mobility values are returned", {
  Bvalues <- seq(from=10, to=75, by=5)
  set.seed(13)
  occupancy <- sample(c(0.90, 0.95, 1.0), 14, replace = TRUE)
  mobility.answer <- c(0.225210084,  0.3753501401, 0.4741264927,
                       0.6255835668, 0.6756302521, 0.8758169935,
                       0.9482529854, 1.013445378, 1.12605042,
                       1.376283847,  1.422379478, 1.463865546,
                       1.576470588,  1.777974348)
  expect_equal(Mobility(Bvalues, occupancy), mobility.answer)
})


## calcBvalue ------------------------------------------------------------------
test_that("the correct calculated Bvalues are returned", {
  expect_equal(calcBvalue(rmsfValue=0.25), 4.9348022005446789962)
  expect_equal(calcBvalue(rmsfValue=0.50), 19.739208802178715985)
  expect_equal(calcBvalue(rmsfValue=0.75), 44.413219804902112742)
  expect_equal(calcBvalue(rmsfValue=1.00), 78.956835208714863938)
  expect_equal(calcBvalue(rmsfValue=1.25), 123.37005501361697668)
})


## calcNearbyHydrationFraction -------------------------------------------------
test_that("the correct nearby hydration fraction values (sum, mean, sd) are returned", {
  names.res.nearby.atoms <- c("ARG CA", "PRO CB", "SER C", "PHE CB", "PHE CG",
                              "PHE CZ", "CYS CA", "CYS O", "GLY C", "ALA C")
  cNHF.answer <- list(ahp.sum = 0.852,
                      ahp.mu = 0.0852,
                      ahp.sd = 0.1518550478)
  expect_equal(calcNearbyHydrationFraction(names.res.nearby.atoms), cNHF.answer)
})


## calcNumHydrogenBonds --------------------------------------------------------
test_that("the correct number of hydrogen bonds are returned", {
  distances <- PDB.1hai.h2o.prot.dists[3, ]
  set.oi.idc <- prot.idc
  nearby.atoms.idc <- Nearby(distances, set.idc = prot.idc, radius = 3.6)
  names.atoms <- PDB.1hai.aoi.clean$elety[prot.idc]
  numHydroBonds.answer <- 4
  expect_equal(calcNumHydrogenBonds(distances,
                                    nearby.atoms.idc,
                                    names.atoms,
                                    set.oi.idc),
               numHydroBonds.answer)
})


## BoundWaterEnvironment.quality -----------------------------------------------
test_that("the correct environment quality values are returned", {
  distances <- PDB.1hai.h2o.prot.dists[3, ]
  set.oi.idc <- prot.idc
  structure <- PDB.1hai.aoi.clean
  quality.answer <- list(o.sum = 9,
                         o.mu = 1,
                         o.sd = 0,
                         b.exp.sum = 273.5600000000,
                         b.exp.mu = 30.3955555556,
                         b.exp.sd = 12.7242466487,
                         mobility.sum = 0,
                         mobility.mu = as.numeric(NA),
                         mobility.sd = as.numeric(NA),
                         nBvalue.sum = 0,
                         nBvalue.mu = as.numeric(NA),
                         nBvalue.sd = as.numeric(NA))
  expect_equal(BoundWaterEnvironment.quality(distances,
                                             set.oi.idc,
                                             structure,
                                             radius = 3.6),
               quality.answer)
})

