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

context("Export dataset for reading into CAKE")

test_that("Exporting is reproducible", {
  CAKE_export(list("FOCUS C" = FOCUS_2006_C,
                   "FOCUS D" = FOCUS_2006_D),
    map = c(parent = "Parent", m1 = "M1"),
    links = c(parent = "m1"),
    filename = "FOCUS_2006_D.csf", overwrite = TRUE, 
    study = "FOCUS 2006 D")
  csf <- readLines(con = "FOCUS_2006_D.csf")
  csf[8] <- "Date: Dummy date 0000-00-00"
  expect_known_value(csf, file = "FOCUS_2006_D.rds")
})
