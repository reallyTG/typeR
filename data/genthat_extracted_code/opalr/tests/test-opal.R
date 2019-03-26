#-------------------------------------------------------------------------------
# Copyright (c) 2017 OBiBa. All rights reserved.
#
# This program and the accompanying materials
# are made available under the terms of the GNU Public License v3.0.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#-------------------------------------------------------------------------------

#
# Set up
#

library(opalr)
library(testthat)

#
# Tests
#

context("opalr::opal.version_compare")

test_that("opal version compare 2.8.0>2.6", {
  expect_equal(opal.version_compare(list(version="2.8.0"), "2.6"), 1)
})

test_that("opal version compare 2.8.0-b1234>2.6", {
  expect_equal(opal.version_compare(list(version="2.8.0-b1234"), "2.6"), 1)
})

test_that("opal version compare 2.6.0==2.6", {
  expect_equal(opal.version_compare(list(version="2.6.0"), "2.6"), 0)
})

test_that("opal version compare 2.6.0==2.6.0", {
  expect_equal(opal.version_compare(list(version="2.6.0"), "2.6.0"), 0)
})

test_that("opal version compare 2.6.1==2.6", {
  expect_equal(opal.version_compare(list(version="2.6.1"), "2.6"), 1)
})

test_that("opal version compare 2.6.0==2.6.1", {
  expect_equal(opal.version_compare(list(version="2.6.0"), "2.6.1"), -1)
})

test_that("opal version compare 2.4.0<2.6", {
  expect_equal(opal.version_compare(list(version="2.4.0"), "2.6"), -1)
})

test_that("opal version compare 2.10.0>2.6", {
  expect_equal(opal.version_compare(list(version="2.10.0"), "2.6"), 1)
})
