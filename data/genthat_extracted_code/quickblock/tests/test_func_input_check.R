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
context("Input checking in exported functions")

# ==============================================================================
# Shared objects
# ==============================================================================

sound_blocking <- qb_blocking(c("A", "A", "B", "C", "B", "C", "C", "A", "B", "B"))
unsound_blocking <- letters[1:10]
sound_treatments <- c("T", "C")
unsound_treatments <- 1L

sound_block_labels <- letters[1:10]
unsound_block_labels <- dist(1:10)
sound_unassigned_labels <- c("a", "c")
unsound_unassigned_labels <- dist(1:10)
sound_ids <- letters[1:10]
unsound_ids <- letters[1:5]

sound_covariates <- matrix(c(1, 4, 3, 2, 45, 6, 3, 2, 6, 5,
                             34, 2, 4, 6, 4, 6, 4, 2, 7, 8,
                             5, 6, 4, 6, 4, 25, 2, 1, 7, 5,
                             4, 8, 7, 6, 78, 6, 4, 6, 5, 6), nrow = 20)
unsound_covariates <- letters[1:20]
sound_distances <- distances(sound_covariates)
unsound_distances <- letters[1:20]
sound_size_constraint <- 3L
unsound_size_constraint <- 100L
sound_caliper <- NULL
unsound_caliper <- "a"

sound_outcomes <- 1:10
unsound_outcomes <- letters[1:10]
sound_blocking2 <- qb_blocking(c("A", "A", "A", "A", "B", "B", "B", "A", "B", "B"))
unsound_blocking2 <- letters[1:10]
sound_as_treatments <- rep(1:2, 5)
unsound_as_treatments <- rep("A", 10)


# ==============================================================================
# assign_treatment
# ==============================================================================

t_assign_treatment <- function(t_blocking = sound_blocking,
                               t_treatments = sound_treatments) {
  assign_treatment(blocking = t_blocking,
                   treatments = t_treatments)
}

test_that("`assign_treatment` checks input.", {
  expect_silent(t_assign_treatment())
  expect_error(t_assign_treatment(t_blocking = unsound_blocking))
  expect_error(t_assign_treatment(t_treatments = unsound_treatments))
})


# ==============================================================================
# blocking_estimator
# ==============================================================================

t_blocking_estimator <- function(t_outcomes = sound_outcomes,
                                 t_blocking = sound_blocking2,
                                 t_treatments = sound_as_treatments) {
  blocking_estimator(outcomes = t_outcomes,
                     blocking = t_blocking,
                     treatments = t_treatments)
}

test_that("`blocking_estimator` checks input.", {
  expect_silent(t_assign_treatment())
  expect_error(t_assign_treatment(t_outcomes = unsound_outcomes))
  expect_error(t_assign_treatment(t_blocking = unsound_blocking2))
  expect_error(t_assign_treatment(t_treatments = unsound_as_treatments))
})


# ==============================================================================
# qb_blocking
# ==============================================================================

t_qb_blocking <- function(block_labels = sound_block_labels,
                          unassigned_labels = sound_unassigned_labels,
                          ids = sound_ids) {
  qb_blocking(block_labels = block_labels,
              unassigned_labels = unassigned_labels,
              ids = ids)
}

test_that("`qb_blocking` checks input.", {
  expect_silent(t_qb_blocking())
  expect_error(t_qb_blocking(block_labels = unsound_block_labels))
  expect_error(t_qb_blocking(unassigned_labels = unsound_unassigned_labels))
  expect_error(t_qb_blocking(ids = unsound_ids))
})


# ==============================================================================
# quickblock
# ==============================================================================

t_quickblock <- function(distances = sound_distances,
                         size_constraint = sound_size_constraint,
                         caliper = sound_caliper,
                         ...) {
  quickblock(distances = distances,
             size_constraint = size_constraint,
             caliper = caliper,
             ...)
}

test_that("`quickblock` checks input.", {
  expect_silent(t_quickblock())
  expect_silent(t_quickblock(caliper = 10))
  expect_error(t_quickblock(distances = unsound_distances))
  expect_error(t_quickblock(size_constraint = unsound_size_constraint))
  expect_error(t_quickblock(caliper = unsound_caliper))

  expect_silent(t_quickblock(distances = sound_covariates))
  expect_error(t_quickblock(distances = unsound_covariates))
  expect_silent(t_quickblock(distances = sound_covariates, normalize = "mahalanobize"))
  expect_error(t_quickblock(distances = sound_covariates, normalize = "non-exist"))
  expect_error(t_quickblock(type_labels = "a"),
               regexp = "`type_labels` is ignored, please use the `scclust` package instead.")
  expect_error(t_quickblock(type_constraints = "a"),
               regexp = "`type_constraints` is ignored, please use the `scclust` package instead.")

  expect_silent(t_quickblock(seed_radius = 10))
  expect_silent(t_quickblock(primary_unassigned_method = "ignore"))
  expect_error(t_quickblock(primary_unassigned_method = "non-exist"))
  expect_silent(t_quickblock(secondary_unassigned_method = "ignore"))
  expect_error(t_quickblock(secondary_unassigned_method = "non-exist"))
  expect_silent(t_quickblock(primary_radius = "no_radius"))
  expect_error(t_quickblock(primary_radius = "non-exist"))
  expect_silent(t_quickblock(secondary_radius = "no_radius"))
  expect_error(t_quickblock(secondary_radius = "non-exist"))

  expect_warning(t_quickblock(caliper = 10, primary_unassigned_method = "any_neighbor"),
                 regexp = "Caliper might perform poorly unless `primary_unassigned_method`==\"closest_seed\".")
  expect_warning(t_quickblock(caliper = 10, primary_radius = "no_radius"),
                 regexp = "Caliper is not properly enforced unless `primary_radius`==\"seed_radius\".")
  expect_warning(t_quickblock(caliper = 10, seed_radius = 10),
                 regexp = "`caliper` is ignored when `seed_radius` is specified.")
})
