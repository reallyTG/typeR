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

context("mkinmod model generation and printing")

test_that("mkinmod stops to prevent and/or explain user errors", {
  expect_error(mkinmod(compound_x = mkinsub("SFO", to = "compound_x_y"),
                       compound_x_y = mkinsub("SFO")), 
               "variable names can not contain each other")
  expect_error(mkinmod(compound_to_x = mkinsub("SFO")),
               "can not contain _to_")
  expect_error(mkinmod(sink = mkinsub("SFO")),
               "Naming")

  expect_error(mkinmod(parent = mkinsub("SFO"), use_of_ff = "foo"))

  expect_error(mkinmod(parent = mkinsub("foo")))

  expect_error(mkinmod(parent = mkinsub("SFO", "m1"),
                       m1 = mkinsub("FOMC")),
               "only implemented for the first compartment")

  expect_error(mkinmod(parent = mkinsub("IORE", "m1"),
                       m1 = mkinsub("SFO"), use_of_ff = "min"),
               "only supported with formation fractions")

  expect_error(mkinmod(parent = mkinsub("SFORB", "m1"),
                       m1 = mkinsub("SFO"), use_of_ff = "max"),
               "not supported")
})

test_that("Printing mkinmod models is reproducible", {
  m_test <- mkinmod(parent = mkinsub("SFO", "m1"), 
                    m1 = mkinsub("SFO"),
                    quiet = TRUE)
  m_test$cf <- NULL # Remove to make test robust against missing gcc
  expect_known_output(print(m_test),
                      file = "SFO_SFO_printed.txt")
})
