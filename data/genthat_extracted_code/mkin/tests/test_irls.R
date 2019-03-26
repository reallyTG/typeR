# Copyright (C) 2018 Johannes Ranke
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

context("Iteratively reweighted least squares (IRLS) fitting")


m_synth_SFO_lin <- mkinmod(parent = mkinsub("SFO", "M1"),
                           M1 = mkinsub("SFO", "M2"),
                           M2 = mkinsub("SFO"),
                           use_of_ff = "max", quiet = TRUE)

m_synth_DFOP_par <- mkinmod(parent = mkinsub("DFOP", c("M1", "M2")),
                           M1 = mkinsub("SFO"),
                           M2 = mkinsub("SFO"),
                           use_of_ff = "max", quiet = TRUE)

SFO_lin_a <- synthetic_data_for_UBA_2014[[1]]$data

DFOP_par_c <- synthetic_data_for_UBA_2014[[12]]$data

test_that("Reweighting method 'obs' works", {
  skip_on_cran()
  fit_irls_1 <- mkinfit(m_synth_SFO_lin, SFO_lin_a, reweight.method = "obs", quiet = TRUE)
  parms_1 <- round(fit_irls_1$bparms.optim, c(1, 4, 4, 4, 4, 4))
  expect_equivalent(parms_1, c(102.1, 0.7389, 0.2982, 0.0203, 0.7677, 0.7246))
})

test_that("Reweighting method 'tc' works", {
  fit_irls_2 <- mkinfit(m_synth_SFO_lin, SFO_lin_a, reweight.method = "tc", quiet = TRUE)
  parms_2 <- round(fit_irls_2$bparms.optim, c(1, 4, 4, 4, 4, 4))
  expect_equivalent(parms_2, c(102.1, 0.7393, 0.2992, 0.0202, 0.7687, 0.7229))

  skip("Too much trouble with datasets that are randomly generated")
  # I need to make the tc method more robust against that
  # skip_on_cran()

  # Check if we can approximately obtain the parameters and the error model
  # components that were used in the data generation

  # Parent only
  DFOP <- mkinmod(parent = mkinsub("DFOP"))
  sampling_times = c(0, 1, 3, 7, 14, 28, 60, 90, 120)
  parms_DFOP <- c(k1 = 0.2, k2 = 0.02, g = 0.5)
  parms_DFOP_optim <- c(parent_0 = 100, parms_DFOP)
  d_DFOP <- mkinpredict(DFOP,
     parms_DFOP, c(parent = 100),
     sampling_times)
  d_2_10 <- add_err(d_DFOP,
    sdfunc = function(x) sigma_twocomp(x, 0.5, 0.07),
    n = 10, reps = 2, digits = 5, LOD = -Inf)
  d_100_1 <- add_err(d_DFOP,
    sdfunc = function(x) sigma_twocomp(x, 0.5, 0.07),
    n = 1, reps = 100, digits = 5, LOD = -Inf)

  f_2_10 <- mmkin("DFOP", d_2_10, quiet = TRUE,
    cores = if (Sys.getenv("TRAVIS") != "") 1 else 15)
  parms_2_10 <- apply(sapply(f_2_10, function(x) x$bparms.optim), 1, mean)
  parm_errors_2_10 <- (parms_2_10 - parms_DFOP_optim) / parms_DFOP_optim
  expect_true(all(abs(parm_errors_2_10) < 0.45))

  f_2_10_tc <- mmkin("DFOP", d_2_10, reweight.method = "tc", quiet = TRUE,
    cores = if (Sys.getenv("TRAVIS") != "") 1 else 15)
  parms_2_10_tc <- apply(sapply(f_2_10_tc, function(x) x$bparms.optim), 1, mean)
  parm_errors_2_10_tc <- (parms_2_10_tc - parms_DFOP_optim) / parms_DFOP_optim
  expect_true(all(abs(parm_errors_2_10_tc) < 0.25))

  tcf_2_10_tc <- apply(sapply(f_2_10_tc, function(x) x$tc_fitted), 1, mean, na.rm = TRUE)

  tcf_2_10_error_model_errors <- (tcf_2_10_tc - c(0.5, 0.07)) / c(0.5, 0.07)
  expect_true(all(abs(tcf_2_10_error_model_errors) < 0.5))

  f_tc_100_1 <- suppressWarnings(mkinfit(DFOP, d_100_1[[1]], reweight.method = "tc", quiet = TRUE))
  parm_errors_100_1 <- (f_tc_100_1$bparms.optim - parms_DFOP_optim) / parms_DFOP_optim
  expect_true(all(abs(parm_errors_100_1) < 0.1))

  tcf_100_1_error_model_errors <- (f_tc_100_1$tc_fitted - c(0.5, 0.07)) /
    c(0.5, 0.07)
  # Even with 100 (or even 1000, not shown) replicates at each observation time
  # we only get a precision of 15% to 30% for the error model components
  expect_true(all(abs(tcf_100_1_error_model_errors) < 0.3))

  # Parent and two metabolites
  m_synth_DFOP_lin <- mkinmod(parent = list(type = "DFOP", to = "M1"),
                             M1 = list(type = "SFO", to = "M2"),
                             M2 = list(type = "SFO"), use_of_ff = "max",
                             quiet = TRUE)
  sampling_times = c(0, 1, 3, 7, 14, 28, 60, 90, 120)
  parms_DFOP_lin <- c(k1 = 0.2, k2 = 0.02, g = 0.5,
     f_parent_to_M1 = 0.5, k_M1 = 0.3,
     f_M1_to_M2 = 0.7, k_M2 = 0.02)
  d_synth_DFOP_lin <- mkinpredict(m_synth_DFOP_lin,
     parms_DFOP_lin,
     c(parent = 100, M1 = 0, M2 = 0),
     sampling_times)
  parms_DFOP_lin_optim = c(parent_0 = 100, parms_DFOP_lin)

  d_met_2_15 <- add_err(d_synth_DFOP_lin,
    sdfunc = function(x) sigma_twocomp(x, 0.5, 0.07),
    n = 15, reps = 1000, digits = 5, LOD = -Inf)

  # For a single fit, we get a relative error of less than 30%  in the error
  # model components
  f_met_2_tc_e4 <- mkinfit(m_synth_DFOP_lin, d_met_2_15[[1]], quiet = TRUE,
                          reweight.method = "tc", reweight.tol = 1e-4)
  parm_errors_met_2_tc_e4 <- (f_met_2_tc_e4$tc_fitted - c(0.5, 0.07)) / c(0.5, 0.07)
  expect_true(all(abs(parm_errors_met_2_tc_e4) < 0.3))

  # Doing more takes a lot of computing power
  skip_on_travis()
  f_met_2_15_tc_e4 <- mmkin(list(m_synth_DFOP_lin), d_met_2_15, quiet = TRUE,
                            reweight.method = "tc", reweight.tol = 1e-4,
                            cores = 14)

  parms_met_2_15_tc_e4 <- apply(sapply(f_met_2_15_tc_e4, function(x) x$bparms.optim), 1, mean)
  parm_errors_met_2_15_tc_e4 <- (parms_met_2_15_tc_e4[names(parms_DFOP_lin_optim)] -
                                 parms_DFOP_lin_optim) / parms_DFOP_lin_optim
  expect_true(all(abs(parm_errors_met_2_15_tc_e4) < 0.01))

  tcf_met_2_15_tc <- apply(sapply(f_met_2_15_tc_e4, function(x) x$tc_fitted), 1, mean, na.rm = TRUE)

  tcf_met_2_15_tc_error_model_errors <- (tcf_met_2_15_tc - c(0.5, 0.07)) /
    c(0.5, 0.07)

  # Here we only get a precision < 30% for retrieving the original error model components
  # from 15 datasets
  expect_true(all(abs(tcf_met_2_15_tc_error_model_errors) < 0.3))
})
