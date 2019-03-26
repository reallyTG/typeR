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

context("Test dataset class mkinds used in gmkin")

test_that("An mkinds object can be created and printed", {
  testdata <- mkinds$new("FOCUS C", data = FOCUS_2006_C, time_unit = "days", unit = "%AR")
  expect_known_output(print(testdata), "FOCUS_2006_C_mkinds.txt")
})
