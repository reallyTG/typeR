# Copyright (C) 2019 Johannes Ranke
# Contact: jranke@uni-bremen.de

# This file is part of the R package mkin

# mkin is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.

# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.

# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>

context("Special cases of mkinfit calls")

SFO_SFO.ff.nosink <- mkinmod(
  parent = mkinsub("SFO", "m1", sink = FALSE),
  m1 = mkinsub("SFO"), quiet = TRUE, use_of_ff = "max")

SFO_SFO.ff <- mkinmod(
  parent = mkinsub("SFO", "m1"),
  m1 = mkinsub("SFO"), quiet = TRUE, use_of_ff = "max")

test_that("mkinfit stops to prevent and/or explain user errors", {
  expect_error(mkinfit("foo", FOCUS_2006_A))
  expect_error(mkinfit(3, FOCUS_2006_A))

  # We get a warning if we use transform_fractions = FALSE with formation fractions
  # and an error if any pathway to sink is turned off as well
  expect_warning(
    expect_error(
      mkinfit(SFO_SFO.ff.nosink, FOCUS_2006_D, transform_fractions = FALSE, quiet = TRUE),
      "turn off pathways to sink"
      ),
    "sum of formation fractions")

  expect_error(mkinfit(SFO_SFO.ff, FOCUS_2006_D, transform_fractions = TRUE,
                       parms.ini = c(f_parent_to_m1 = 0.5), fixed_parms = "f_parent_to_m1", quiet = TRUE),
   "not supported")

  expect_error(mkinfit(SFO_SFO.ff, FOCUS_2006_D,
                       parms.ini = c(f_parent_to_m1 = 1.1), quiet = TRUE),
   "sum up to more than 1")

  expect_error(mkinfit(SFO_SFO.ff, FOCUS_2006_D, solution_type = "analytical"), "not implemented")

  expect_error(mkinfit("FOMC", FOCUS_2006_A, solution_type = "eigen"), "coefficient matrix not present")

  # We suppress a message stemming from the interrupted call to system.time()
  expect_error(suppressMessages(mkinfit("SFO", FOCUS_2006_A, reweight.method =
                                        "foo", quiet = TRUE), "implemented"))

})

test_that("mkinfit stops early when a low maximum number of iterations is specified", {
  expect_warning(mkinfit("SFO", FOCUS_2006_A, maxit.modFit = 1, quiet = TRUE))
  expect_warning(mkinfit("SFO", FOCUS_2006_A, maxit.modFit = 1, quiet = TRUE, method.modFit = "Marq"))
})

test_that("mkinfit warns if the user chooses the SANN method", {
  expect_warning(mkinfit("SFO", FOCUS_2006_A, method.modFit = "SANN", maxit.modFit = 10, quiet = TRUE))
  skip("The SANN algorithm takes very long with the default maximum number of iterations of 10000")
  expect_warning(mkinfit("SFO", FOCUS_2006_A, method.modFit = "SANN"))
})

test_that("mkinfit warns if a specified initial parameter value is not in the model", {
  expect_warning(mkinfit("SFO", FOCUS_2006_A, parms.ini = c(k_xy = 0.1), quiet = TRUE))
})

test_that("We get reproducible output if quiet = FALSE", {
  # We cannot expect parameter and sum of squares traces to be the same across platforms
  skip_on_cran()
  skip_on_travis()
  expect_known_output(mkinfit("DFOP", FOCUS_2006_C, reweight.method = "tc", trace_parms = TRUE),
    file = "DFOP_FOCUS_C_messages.txt")
})

test_that("We get warnings in case of overparameterisation", {
  skip_on_cran() # On winbuilder the following fit does not give a warning
  expect_warning(f <- mkinfit("FOMC", FOCUS_2006_A, quiet = TRUE), "not converge")
  s2 <- expect_warning(summary(mkinfit("DFOP", FOCUS_2006_A, quiet = TRUE)), "singular system")
})
