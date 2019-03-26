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

context("Fitting the logistic model")

logistic <- mkinmod(parent = mkinsub("logistic"))

sampling_times = c(0, 1, 3, 7, 14, 28, 60, 90, 120)
parms_logistic <- c(kmax = 0.08, k0 = 0.0001, r = 0.2)
d_logistic <- mkinpredict(logistic,
  parms_logistic, c(parent = 100),
  sampling_times)
d_2_1 <- add_err(d_logistic,
  sdfunc = function(x) sigma_twocomp(x, 0.5, 0.07),
  n = 1, reps = 2, digits = 5, LOD = 0.1, seed = 123456)

test_that("The logistic model fit is reproducible", {
  m <- mkinfit("logistic", d_2_1[[1]], quiet = TRUE)
  dtx <- endpoints(m)$distimes["parent", ]
  expect_equivalent(dtx, c(36.865, 62.415, 4297.854, 10.833), tolerance = 0.001)
})

test_that("The logistic fit can be done via differential equation", {
  # This is slow as we did not implement conversion to C
  # because it is unlikely we will use the logistic model with metabolites
  skip("Skip slow fit of logistic model using deSolve without compilation")
  m_2 <- mkinfit("logistic", d_2_1[[1]], solution_type = "deSolve", 
                 quiet = TRUE)
  dtx_2 <- endpoints(m_2)$distimes["parent", ]
  expect_equivalent(dtx_2, c(36.865, 62.415, 4297.854, 10.833), tolerance = 0.001)
})
