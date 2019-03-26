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
context("qb_blocking")

# ==============================================================================
# qb_blocking
# ==============================================================================

raw_labels <- c(0L, 0L, 1L, 2L, 1L, 2L, 2L, 0L, 1L, 1L)
raw_labelsNA <- c(0L, 0L, 1L, 2L, NA, 2L, 2L, NA, 1L, 1L)

cl_obj_simple <- structure(raw_labels,
                           cluster_count = 3L,
                           ids = NULL,
                           class = c("qb_blocking", "scclust"))

cl_obj_wNA <- structure(raw_labelsNA,
                        cluster_count = 3L,
                        ids = NULL,
                        class = c("qb_blocking", "scclust"))

cl_obj_wID <- structure(raw_labels,
                        cluster_count = 3L,
                        ids = letters[1:10],
                        class = c("qb_blocking", "scclust"))

cl_obj_wIDnNA <- structure(raw_labelsNA,
                           cluster_count = 3L,
                           ids = letters[1:10],
                           class = c("qb_blocking", "scclust"))

test_that("`qb_blocking` returns correct output", {
  expect_identical(qb_blocking(c("A", "A", "B", "C", "B", "C", "C", "A", "B", "B")),
                   cl_obj_simple)
  expect_identical(qb_blocking(c(1, 1, 2, 3, 2, 3, 3, 1, 2, 2)),
                   cl_obj_simple)
  expect_identical(qb_blocking(c("A", "A", "B", "C", "NONE", "C", "C", "NONE", "B", "B"), "NONE"),
                   cl_obj_wNA)
  expect_identical(qb_blocking(c("A", "A", "B", "C", "NONE", "C", "C", "0", "B", "B"), c("NONE", "0")),
                   cl_obj_wNA)
  expect_identical(qb_blocking(c(1, 1, 2, 3, 0, 3, 3, 0, 2, 2), 0),
                   cl_obj_wNA)
  expect_identical(qb_blocking(c("A", "A", "B", "C", "B", "C", "C", "A", "B", "B"), ids = letters[1:10]),
                   cl_obj_wID)
  expect_identical(qb_blocking(c("A", "A", "B", "C", "NONE", "C", "C", "0", "B", "B"), c("NONE", "0"), ids = letters[1:10]),
                   cl_obj_wIDnNA)
})


# ==============================================================================
# is.qb_blocking
# ==============================================================================

test_that("`is.qb_blocking` returns correct output", {
  expect_true(is.qb_blocking(structure(raw_labels,
                                       cluster_count = 3L,
                                       ids = NULL,
                                       class = c("qb_blocking", "scclust"))))
  expect_false(is.qb_blocking(structure(raw_labels,
                                        cluster_count = 3L,
                                        ids = NULL,
                                        class = c("qb_blocking"))))
  expect_false(is.qb_blocking(structure(raw_labels,
                                        cluster_count = 3L,
                                        ids = NULL,
                                        class = c("scclust"))))
  expect_false(is.qb_blocking(structure(letters[1:10],
                                        cluster_count = 3L,
                                        ids = NULL,
                                        class = c("qb_blocking", "scclust"))))
})
