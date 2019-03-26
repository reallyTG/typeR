#! /usr/bin/env Rscript

# jvcoords - implement various coordinate transforms (e.g. PCA, whitening).
# https://github.com/seehuhn/jvcoords
#
# Copyright (C) 2018  Jochen Voss <voss@seehuhn.de>
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
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


library(jvcoords)

set.seed(1)
X1 <- matrix(rnorm(990), nrow = 33, ncol = 3)
X2 <- matrix(rnorm(990), nrow = 3, ncol = 33)
X3 <- matrix(rnorm(999), nrow = 999, ncol = 1)
X4 <- matrix(1:6, 3, 2)

for (x in list(X1, X2, X3, X4)) {
  s <- standardize(x)

  stopifnot(max(abs(colMeans(s$y))) < 1e-10)
  stopifnot(max(abs(apply(s$y, 2, var) - 1)) < 1e-10)

  stopifnot(max(abs(toCoords(s, x) - s$y)) < 1e-10)
  cat(dim(x), "to mat OK\n")

  stopifnot(max(abs(toCoords(s, x[1, ]) - s$y[1, ])) < 1e-10)
  cat(dim(x), "to vec OK\n")

  stopifnot(max(abs(fromCoords(s, s$y) - x)) < 1e-10)
  cat(dim(x), "from mat OK\n")

  stopifnot(max(abs(fromCoords(s, s$y[1, ]) - x[1, ])) < 1e-10)
  cat(dim(x), "from vec OK\n")

  Y <- matrix(rnorm(100 * s$q), 100, s$q)

  stopifnot(max(abs(Y - toCoords(s, fromCoords(s, Y)))) < 1e-10)
  cat(dim(x), "from&to mat OK\n")

  stopifnot(max(abs(Y[1, ] - toCoords(s, fromCoords(s, Y[1, ])))) < 1e-10)
  cat(dim(x), "from&to vec OK\n")
}
