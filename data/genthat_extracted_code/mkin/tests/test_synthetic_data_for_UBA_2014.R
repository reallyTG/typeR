# Copyright (C) 2015, 2018 Johannes Ranke
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

context("Results for synthetic data established in expertise for UBA (Ranke 2014)")


test_that("Results are correct for SFO_lin_a", {
  skip_on_cran()
  m_synth_SFO_lin <- mkinmod(parent = mkinsub("SFO", "M1"),
                             M1 = mkinsub("SFO", "M2"),
                             M2 = mkinsub("SFO"),
                             use_of_ff = "max", quiet = TRUE)
  fit_SFO_lin_a <- mkinfit(m_synth_SFO_lin, 
                           synthetic_data_for_UBA_2014[[1]]$data, 
                           quiet = TRUE)
  # Results for SFO_lin_a from p. 48

  parms <- round(fit_SFO_lin_a$bparms.optim, c(1, 4, 4, 4, 4, 4))
  expect_equivalent(parms, c(102.1, 0.7393, 0.2992, 0.0202, 0.7687, 0.7229))
  errmin <- round(100 * mkinerrmin(fit_SFO_lin_a)$err.min, 2)
  expect_equivalent(errmin, c(8.45, 8.66, 10.58, 3.59))
})

# Results for DFOP_par_c from p. 54

test_that("Results are correct for DFOP_par_c", {
  skip_on_cran()          
  m_synth_DFOP_par <- mkinmod(parent = mkinsub("DFOP", c("M1", "M2")),
                             M1 = mkinsub("SFO"),
                             M2 = mkinsub("SFO"),
                             use_of_ff = "max", quiet = TRUE)


  fit_DFOP_par_c <- mkinfit(m_synth_DFOP_par, 
                            synthetic_data_for_UBA_2014[[12]]$data,
                            quiet = TRUE)

  parms <- round(fit_DFOP_par_c$bparms.optim, c(1, 4, 4, 4, 4, 4, 4, 4))
  expect_equal(parms, c(parent_0 = 103.0, 
                        k_M1 = 0.0389, k_M2 = 0.0095,
                        f_parent_to_M1 = 0.5565, f_parent_to_M2 = 0.3784,
                        k1 = 0.3263, k2 = 0.0202, g = 0.7130))
  errmin <- round(100 * mkinerrmin(fit_DFOP_par_c)$err.min, 2)
  expect_equivalent(errmin, c(4.03, 3.05, 5.07, 3.17))
})

# References:
# Ranke (2014) Prüfung und Validierung von Modellierungssoftware als Alternative
# zu ModelMaker 4.0, Umweltbundesamt Projektnummer 27452
