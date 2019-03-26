# ==============================================================================
# quickmatch -- Quick Generalized Full Matching
# https://github.com/fsavje/quickmatch
#
# Copyright (C) 2017  Fredrik Savje -- http://fredriksavje.com
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

library(quickmatch)
context("Input checking in C code")

# ==============================================================================
# matching_weights.c
# ==============================================================================

t_qmc_matching_weights <- function(treatments = c(1L, 1L, 2L, 3L, 2L, 1L, 3L),
                                   num_treatments = 3L,
                                   matching = qm_matching(c("A", "B", "A", "A", "B", "B", "B")),
                                   target = NULL,
                                   unassigned_as_NA = TRUE) {
  .Call(qmc_matching_weights,
        treatments,
        num_treatments,
        matching,
        target,
        unassigned_as_NA)
}

test_that("`qmc_matching_weights` checks input.", {
  expect_silent(t_qmc_matching_weights())
  expect_silent(t_qmc_matching_weights(matching = qm_matching(c("A", "B", "A", "A", "B", NA, "B")),
                                       target = c(1L, 4L)))
  expect_silent(t_qmc_matching_weights(target = c(1L, 4L, 7L)))
  expect_silent(t_qmc_matching_weights(target = c(FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE)))
  expect_silent(t_qmc_matching_weights(unassigned_as_NA = FALSE))

  expect_error(t_qmc_matching_weights(treatments = letters[1:7]),
               regexp = "`R_treatments` must be integer.")
  expect_error(t_qmc_matching_weights(num_treatments = "a"),
               regexp = "`R_num_treatments` must be integer.")
  expect_error(t_qmc_matching_weights(num_treatments = 1L),
               regexp = "Must be at least two treatment conditions.")
  expect_error(t_qmc_matching_weights(matching = structure(c("A", "B", "A", "A", "B", "B", "B"), "cluster_count" = 2L, class = c("qm_matching", "scclust"))),
               regexp = "`R_matching` must be integer.")
  expect_error(t_qmc_matching_weights(matching = structure(c(0L, 1L, 0L, 0L, 1L, 1L, 1L), class = c("qm_matching", "scclust"))),
               regexp = "`R_matching` is not valid `scclust` object.")
  expect_error(t_qmc_matching_weights(matching = structure(c(0L, 1L, 0L, 0L, 1L, 1L, 1L), "cluster_count" = 0L, class = c("qm_matching", "scclust"))),
               regexp = "`R_matching` is empty.")
  expect_error(t_qmc_matching_weights(matching = structure(c(0L, 1L, 0L, 0L, 1L, 1L), "cluster_count" = 2L, class = c("qm_matching", "scclust"))),
               regexp = "`R_matching` and `R_treatments` must be same length.")
  expect_error(t_qmc_matching_weights(target = "X"),
               regexp = "`R_target` must be NULL, integer or logical.")
  expect_error(t_qmc_matching_weights(target = c(FALSE, TRUE, FALSE, TRUE, FALSE, FALSE)),
               regexp = "`R_target` and `R_treatments` must be same length when `R_target` is logical.")
  expect_error(t_qmc_matching_weights(treatments = c(1L, 0L, 2L, 3L, 2L, 1L, 3L)),
               regexp = "Treatment out of bounds.")
  expect_error(t_qmc_matching_weights(treatments = c(1L, 1L, 2L, 3L, 2L, -1L, 3L)),
               regexp = "Treatment out of bounds.")
  expect_error(t_qmc_matching_weights(treatments = c(1L, 1L, 2L, 3L, 2L, 4L, 3L)),
               regexp = "Treatment out of bounds.")
  expect_error(t_qmc_matching_weights(treatments = c(1L, 1L, 2L, 3L, 2L, NA, 3L)),
               regexp = "Treatment out of bounds.")
  expect_error(t_qmc_matching_weights(matching = structure(c(0L, -1L, 0L, 0L, 1L, 1L, 1L), "cluster_count" = 2L, class = c("qm_matching", "scclust"))),
               regexp = "Matching out of bounds.")
  expect_error(t_qmc_matching_weights(matching = structure(c(0L, 1L, 0L, 0L, 2L, 1L, 1L), "cluster_count" = 2L, class = c("qm_matching", "scclust"))),
               regexp = "Matching out of bounds.")
  expect_error(t_qmc_matching_weights(target = c(1L, 0L)),
               regexp = "Target out of bounds.")
  expect_error(t_qmc_matching_weights(target = c(1L, -1L)),
               regexp = "Target out of bounds.")
  expect_error(t_qmc_matching_weights(target = c(1L, 8L)),
               regexp = "Target out of bounds.")
  expect_error(t_qmc_matching_weights(unassigned_as_NA = "Test"),
               regexp = "`R_unassigned_as_NA` must be logical.")
  expect_warning(t_qmc_matching_weights(matching = qm_matching(c("A", "B", "A", "A", "B", NA, "B"))),
                 regexp = "Some units in target are unmatched. They will be ignored.")
})


# ==============================================================================
# utilities.c
# ==============================================================================

t_qmc_get_target_indicators <- function(target_indicators = c(TRUE, FALSE, TRUE),
                                        treatments = c(0L, 0L, 1L, 2L, 1L, 0L)) {
  .Call(qmc_get_target_indicators,
        target_indicators,
        treatments)
}

test_that("`qmc_get_target_indicators` checks input.", {
  expect_silent(t_qmc_get_target_indicators())
  expect_error(t_qmc_get_target_indicators(target_indicators = letters[1:3]),
               regexp = "`R_target` must be logical.")
  expect_error(t_qmc_get_target_indicators(treatments = letters[1:6]),
               regexp = "`R_treatments` must be integer.")
  expect_error(t_qmc_get_target_indicators(treatments = c(0L, 0L, -1L, 2L, 1L, 0L)),
               regexp = "Treatment out of bounds.")
  expect_error(t_qmc_get_target_indicators(treatments = c(0L, 0L, 1L, 3L, 1L, 0L)),
               regexp = "Treatment out of bounds.")
})
