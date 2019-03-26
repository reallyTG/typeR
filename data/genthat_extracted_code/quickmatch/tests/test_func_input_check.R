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
context("Input checking in exported functions")


# ==============================================================================
# Shared objects
# ==============================================================================

sound_covariates <- matrix(c(1, 4, 3, 2, 45, 6, 3, 2, 6, 5,
                             34, 2, 4, 6, 4, 6, 4, 2, 7, 8,
                             5, 6, 4, 6, 4, 25, 2, 1, 7, 5,
                             4, 8, 7, 6, 78, 6, 4, 6, 5, 6), nrow = 20)
unsound_covariates <- letters[1:20]
sound_distances <- distances(sound_covariates)
unsound_distances <- letters[1:20]
sound_treatments <- rep(1:2, 10)
unsound_treatments <- dist(1:10)
sound_treatment_constraints <- c("1" = 2L, "2" = 0L)
unsound_treatment_constraints <- c(2L, 0L)
sound_size_constraint <- 3L
unsound_size_constraint <- 100L
sound_target <- NULL
unsound_target <- "a"
sound_caliper <- NULL
unsound_caliper <- "a"
sound_group_labels <- letters[1:10]
unsound_group_labels <- dist(1:10)
sound_unassigned_labels <- c("a", "c")
unsound_unassigned_labels <- dist(1:10)
sound_ids <- letters[1:10]
unsound_ids <- letters[1:5]
sound_outcomes <- as.numeric(1:20)
unsound_outcomes <- letters[1:20]
sound_matching <- quickmatch(sound_distances, sound_treatments)
unsound_matching <- dist(1:10)


# ==============================================================================
# qm_matching
# ==============================================================================

t_qm_matching <- function(group_labels = sound_group_labels,
                          unassigned_labels = sound_unassigned_labels,
                          ids = sound_ids) {
  qm_matching(group_labels = group_labels,
              unassigned_labels = unassigned_labels,
              ids = ids)
}

test_that("`qm_matching` checks input.", {
  expect_silent(t_qm_matching())
  expect_error(t_qm_matching(group_labels = unsound_group_labels))
  expect_error(t_qm_matching(unassigned_labels = unsound_unassigned_labels))
  expect_error(t_qm_matching(ids = unsound_ids))
})


# ==============================================================================
# quickmatch
# ==============================================================================

t_quickmatch <- function(distances = sound_distances,
                         treatments = sound_treatments,
                         treatment_constraints = sound_treatment_constraints,
                         size_constraint = sound_size_constraint,
                         target = sound_target,
                         caliper = sound_caliper,
                         ...) {
  quickmatch(distances = distances,
             treatments = treatments,
             treatment_constraints = treatment_constraints,
             size_constraint = size_constraint,
             target = target,
             caliper = caliper,
             ...)
}

test_that("`quickmatch` checks input.", {
  expect_silent(t_quickmatch())
  expect_silent(t_quickmatch(caliper = 10))
  expect_error(t_quickmatch(distances = unsound_distances))
  expect_error(t_quickmatch(treatments = unsound_treatments))
  expect_error(t_quickmatch(treatment_constraints = unsound_treatment_constraints))
  expect_error(t_quickmatch(size_constraint = unsound_size_constraint))
  expect_error(t_quickmatch(target = unsound_target))
  expect_error(t_quickmatch(caliper = unsound_caliper))

  expect_silent(t_quickmatch(distances = sound_covariates))
  expect_error(t_quickmatch(distances = unsound_covariates))
  expect_silent(t_quickmatch(distances = sound_covariates, normalize = "mahalanobize"))
  expect_error(t_quickmatch(distances = sound_covariates, normalize = "non-exist"))
  expect_silent(t_quickmatch(treatment_constraints = NULL))
  expect_error(t_quickmatch(type_labels = sound_treatments),
               regexp = "`type_labels` is ignored, please use the `treatments` parameter instead.")
  expect_error(t_quickmatch(type_constraints = sound_treatment_constraints),
               regexp = "`type_constraints` is ignored, please use the `treatment_constraints` parameter instead.")
  expect_error(t_quickmatch(primary_data_points = 1:20),
               regexp = "`primary_data_points` is ignored, please use the `target` parameter instead.")

  expect_silent(t_quickmatch(seed_radius = 10))
  expect_silent(t_quickmatch(primary_unassigned_method = "ignore"))
  expect_error(t_quickmatch(primary_unassigned_method = "non-exist"))
  expect_silent(t_quickmatch(secondary_unassigned_method = "ignore"))
  expect_error(t_quickmatch(secondary_unassigned_method = "non-exist"))
  expect_silent(t_quickmatch(primary_radius = "no_radius"))
  expect_error(t_quickmatch(primary_radius = "non-exist"))
  expect_silent(t_quickmatch(secondary_radius = "no_radius"))
  expect_error(t_quickmatch(secondary_radius = "non-exist"))

  expect_warning(t_quickmatch(caliper = 10, primary_unassigned_method = "any_neighbor"),
                 regexp = "Caliper might perform poorly unless `primary_unassigned_method`==\"closest_seed\".")
  expect_warning(t_quickmatch(caliper = 10, secondary_unassigned_method = "closest_assigned"),
                 regexp = "Caliper is not properly enforced when `secondary_unassigned_method`==\"closest_assigned\".")
  expect_warning(t_quickmatch(caliper = 10, primary_radius = "no_radius"),
                 regexp = "Caliper is not properly enforced unless `primary_radius`==\"seed_radius\".")
  expect_warning(t_quickmatch(caliper = 10, secondary_radius = "no_radius"),
                 regexp = "Caliper is not properly enforced unless `secondary_radius`==\"seed_radius\".")
  expect_warning(t_quickmatch(caliper = 10, seed_radius = 10),
                 regexp = "`caliper` is ignored when `seed_radius` is specified.")
})


# ==============================================================================
# matching_weights
# ==============================================================================

t_matching_weights <- function(treatments = sound_treatments,
                               matching = sound_matching,
                               target = sound_target) {
  matching_weights(treatments = treatments,
                   matching = matching,
                   target = target)
}

test_that("`matching_weights` checks input.", {
  expect_silent(t_matching_weights())
  expect_silent(t_matching_weights(target = "1"))
  expect_silent(t_matching_weights(target = rep(c(TRUE, FALSE), each = 10)))
  expect_error(t_matching_weights(treatments = unsound_treatments))
  expect_error(t_matching_weights(matching = unsound_matching))
  expect_error(t_matching_weights(target = unsound_target))

  expect_warning(t_matching_weights(treatments = c("A", "B", "A", "B"), matching = qm_matching(c("1", "1", "1", "2"))),
                 regexp = "Some matched groups are missing treatment conditions. No weights exist for corresponding units.")
})


# ==============================================================================
# covariate_averages
# ==============================================================================

t_covariate_averages <- function(treatments = sound_treatments,
                                 covariates = sound_covariates,
                                 matching = sound_matching,
                                 target = sound_target) {
  covariate_averages(treatments = treatments,
                     covariates = covariates,
                     matching = matching,
                     target = target)
}

test_that("`covariate_averages` checks input.", {
  expect_silent(t_covariate_averages())
  expect_error(t_covariate_averages(treatments = unsound_treatments))
  expect_error(t_covariate_averages(covariates = unsound_covariates))
  expect_error(t_covariate_averages(matching = unsound_matching))
  expect_error(t_covariate_averages(target = unsound_target))

  expect_error(t_covariate_averages(covariates = NULL),
               regexp = "`covariates` is NULL.")
})


# ==============================================================================
# covariate_balance
# ==============================================================================

t_covariate_balance <- function(treatments = sound_treatments,
                                covariates = sound_covariates,
                                matching = sound_matching,
                                target = sound_target,
                                normalize = TRUE,
                                all_differences = FALSE) {
  covariate_balance(treatments = treatments,
                    covariates = covariates,
                    matching = matching,
                    target = target,
                    normalize = normalize,
                    all_differences = all_differences)
}

test_that("`covariate_balance` checks input.", {
  expect_silent(t_covariate_balance())
  expect_error(t_covariate_balance(treatments = unsound_treatments))
  expect_error(t_covariate_balance(covariates = unsound_covariates))
  expect_error(t_covariate_balance(matching = unsound_matching))
  expect_error(t_covariate_balance(target = unsound_target))
  expect_error(t_covariate_balance(normalize = "A"))
  expect_error(t_covariate_balance(all_differences = "A"))

  expect_error(t_covariate_balance(covariates = NULL),
               regexp = "`covariates` is NULL.")
})


# ==============================================================================
# lm_match
# ==============================================================================

t_lm_match <- function(outcomes = sound_outcomes,
                       treatments = sound_treatments,
                       matching = sound_matching,
                       covariates = sound_covariates,
                       target = sound_target) {
  lm_match(outcomes = outcomes,
           treatments = treatments,
           matching = matching,
           covariates = covariates,
           target = target)
}

test_that("`lm_match` checks input.", {
  expect_silent(t_lm_match())
  expect_silent(t_lm_match(covariates = NULL))
  expect_silent(t_lm_match(target = "1"))
  expect_silent(t_lm_match(target = rep(c(TRUE, FALSE), each = 10)))
  expect_error(t_lm_match(treatments = rep(1:2, each = 10), target = "1"),
               regexp = "Less than two potential outcomes can be estimated.")
  expect_warning(t_lm_match(outcomes = 1:6,
                            matching = qm_matching(c("A", "A", "A", "B", "B", "B")),
                            treatments = c("T1", "T2", "T3", "T1", "T2", "T2"),
                            covariates = NULL),
                 regexp = "Some matched groups are missing treatment conditions. Corresponding potential outcomes cannot be estimated.")
  expect_error(t_lm_match(outcomes = unsound_outcomes))
  expect_error(t_lm_match(treatments = unsound_treatments))
  expect_error(t_lm_match(matching = unsound_matching))
  expect_error(t_lm_match(covariates = unsound_covariates))
  expect_error(t_lm_match(target = unsound_target))
})
