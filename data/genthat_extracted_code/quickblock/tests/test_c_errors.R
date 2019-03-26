# ==============================================================================
# quickblock -- Quick Threshold Blocking
# https://github.com/fsavje/quickblock
#
# Copyright (C) 2017  Fredrik Savje, Jasjeet Sekhon, Michael Higgins
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see http://www.gnu.org/licenses/
# ==============================================================================

library(quickblock)
context("Input checking in C code")

# ==============================================================================
# assign_treatment.c
# ==============================================================================

t_qbc_assign_treatments <- function(blocking = qb_blocking(c("A", "A", "B", "C", "B", "C", "C", "A", "B", "B", "C")),
                                    num_treatments = 2L) {
  .Call(qbc_assign_treatments, blocking, num_treatments)
}

test_that("`qbc_assign_treatments` checks input.", {
  expect_silent(t_qbc_assign_treatments())
  expect_error(t_qbc_assign_treatments(blocking = letters[1:11]),
               regexp = "`R_blocking` must be integer.")
  expect_error(t_qbc_assign_treatments(blocking = 1:11),
               regexp = "`R_blocking` is not valid `scclust` object.")
  expect_error(t_qbc_assign_treatments(blocking = structure(1:11, "cluster_count" = 0L, class = c("qb_blocking", "scclust"))),
               regexp = "`R_blocking` is empty.")
  expect_error(t_qbc_assign_treatments(num_treatments = "a"),
               regexp = "`R_num_treatments` must be integer.")
  expect_error(t_qbc_assign_treatments(num_treatments = 1L),
               regexp = "Must be at least two treatment conditions.")
  expect_error(t_qbc_assign_treatments(blocking = structure(c(0L, 1L, 1L, 0L, 2L), "cluster_count" = 2L, class = c("qb_blocking", "scclust"))),
               regexp = "Blocking out of bounds.")
  expect_error(t_qbc_assign_treatments(blocking = structure(c(0L, 1L, -1L, 0L, 1L), "cluster_count" = 2L, class = c("qb_blocking", "scclust"))),
               regexp = "Blocking out of bounds.")
  expect_warning(t_qbc_assign_treatments(num_treatments = 4L),
                 regexp = "Some blocks contain fewer units than the number of treatment conditions.")
})


# ==============================================================================
# estimator.c
# ==============================================================================

t_qbc_est_potential_outcomes <- function(outcomes = as.numeric(1:10),
                                         blocking = qb_blocking(c("A", "A", "A", "A", "B", "B", "B", "A", "B", "B")),
                                         treatments = rep(1:2, 5L),
                                         num_treatments = 2L) {
  .Call(qbc_est_potential_outcomes, outcomes, blocking, treatments, num_treatments)
}

test_that("`qbc_est_potential_outcomes` checks input.", {
  expect_silent(t_qbc_est_potential_outcomes())
  expect_silent(t_qbc_est_potential_outcomes(blocking = qb_blocking(c("A", "A", "A", "A", "B", "B", "B", "B", NA, "B")),
                                             treatments = c(rep(1:2, 4L), NA, 1L)))
  expect_error(t_qbc_est_potential_outcomes(outcomes = 1:10),
               regexp = "`R_outcomes` must be numeric.")
  expect_error(t_qbc_est_potential_outcomes(blocking = letters[1:10]),
               regexp = "`R_blocking` must be integer.")
  expect_error(t_qbc_est_potential_outcomes(blocking = 1:10),
               regexp = "`R_blocking` is not valid `scclust` object.")
  expect_error(t_qbc_est_potential_outcomes(blocking = structure(1:10, "cluster_count" = 0L, class = c("qb_blocking", "scclust"))),
               regexp = "`R_blocking` is empty.")
  expect_error(t_qbc_est_potential_outcomes(blocking = qb_blocking(c("A", "A", "A", "A", "B", "B", "A", "B", "B"))),
               regexp = "`R_blocking` and `R_outcomes` must be same length.")
  expect_error(t_qbc_est_potential_outcomes(treatments = letters[1:10]),
               regexp = "`R_treatments` must be integer.")
  expect_error(t_qbc_est_potential_outcomes(treatments = rep(1:2, 4L)),
               regexp = "`R_treatments` and `R_outcomes` must be same length.")
  expect_error(t_qbc_est_potential_outcomes(num_treatments = "a"),
               regexp = "`R_num_treatments` must be integer.")
  expect_error(t_qbc_est_potential_outcomes(num_treatments = 1L),
               regexp = "Must be at least two treatment conditions.")
  expect_error(t_qbc_est_potential_outcomes(blocking = structure(c(0L, 1L, 1L, 0L, 2L, 0L, 1L, 1L, 0L, 1L), "cluster_count" = 2L, class = c("qb_blocking", "scclust"))),
               regexp = "Blocking out of bounds.")
  expect_error(t_qbc_est_potential_outcomes(blocking = structure(c(0L, 1L, -1L, 0L, 1L, 0L, 1L, 1L, 0L, 1L), "cluster_count" = 2L, class = c("qb_blocking", "scclust"))),
               regexp = "Blocking out of bounds.")
  expect_error(t_qbc_est_potential_outcomes(treatments = c(rep(1:2, 4L), 0L, 1L)),
               regexp = "Treatment out of bounds.")
  expect_error(t_qbc_est_potential_outcomes(treatments = c(rep(1:2, 4L), 3L, 1L)),
               regexp = "Treatment out of bounds.")
  expect_error(t_qbc_est_potential_outcomes(treatments = c(rep(1:2, 4L), NA, 1L)),
               regexp = "All units assigned to blocks must be assigned treatments.")
  expect_error(t_qbc_est_potential_outcomes(treatments = c(rep(1:2, 2L), rep(1L, 6L))),
               regexp = "All treatments must be respresented in each block.")
  expect_warning(t_qbc_est_potential_outcomes(treatments = c(rep(1:2, 3L), rep(1L, 4L))),
                 regexp = "Variance estimation requires that all blocks contain at least two units assigned to each treatment condition.")
  expect_warning(t_qbc_est_potential_outcomes(blocking = qb_blocking(c("A", "A", "A", "A", "B", "B", "B", "B", "B", "B")),
                                              treatments = c(1L, 1L, 2L, 2L, 1L, 1L, 1L, 1L, 2L, 2L)),
                 regexp = "Treatment assignment is unbalanced, variance cannot be estimated.")
})
