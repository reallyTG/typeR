# ==============================================================================
# quickmatch -- Quick Generalized Full Matching
# https://github.com/fsavje/quickmatch
#
# Copyright (C) 2017 Fredrik Savje -- http://fredriksavje.com
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see http://www.gnu.org/licenses/
# ==============================================================================

library(quickmatch)
context("get_target_indicators")

treatments <- factor(c("A", "C", "B", "A", "A", "C", "B", "A", "B", "A"))

test_that("`get_target_indicators` checks input.", {
  expect_silent(get_target_indicators(c("A", "B", "C"), treatments))
  expect_silent(get_target_indicators(c("A", "C"), treatments))
  expect_error(get_target_indicators(1:3, treatments))
  expect_error(get_target_indicators(c("A", "B", "A"), treatments))
  expect_error(get_target_indicators(c("A", "B", "C"), c("A", "C", "B", "A", "A", "C", "B", "A", "B", "A")))
  expect_error(get_target_indicators(c("A", "E", "C"), treatments))
})

test_that("`get_target_indicators` returns correct output", {
  expect_identical(get_target_indicators(c("A", "B", "C"), treatments),
                   NULL)
  expect_identical(get_target_indicators(c("A", "B"), treatments),
                   which(treatments %in% c("A", "B")))
  expect_identical(get_target_indicators(c("A"), treatments),
                   which(treatments %in% c("A")))
})
