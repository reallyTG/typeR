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
colnames(X1) <- c("first", "second", "third")
X2 <- matrix(rnorm(990), nrow = 3, ncol = 33)
X3 <- matrix(rnorm(999), nrow = 999, ncol = 1)
X4 <- matrix(1:6, 3, 2)

for (x in list(X1, X2, X3, X4)) {
  for (scale in c(TRUE, FALSE)) {
    pc <- PCA(x, scale = scale)
    # check that the dimensions match
    stopifnot(pc$p == ncol(x))
    stopifnot(pc$q == ncol(pc$y))
    # check that transformed data in centred
    stopifnot(max(abs(colMeans(pc$y))) < 1e-14)
    # check that the variances are computed correctly
    stopifnot(ncol(pc$loadings) == length(pc$var))
    stopifnot(isTRUE(all.equal(pc$var, apply(pc$y, 2, var))))
    # check that the variances are in decreasing order
    stopifnot(!is.unsorted(-pc$var))

    # check that the coordinate transforms work
    stopifnot(isTRUE(all.equal(toCoords(pc, x), pc$y)))
    stopifnot(isTRUE(all.equal(x, fromCoords(pc, pc$y))))

    # check some aspects of the printed representation
    lines <- capture.output(pc)
    stopifnot(startsWith(lines[1], "PCA"))
    stopifnot(grepl(paste0("p = ", pc$p), lines[1]))
    stopifnot(grepl(paste0("q = ", pc$q), lines[1]))
  }
}

# check that n.comp works
pc <- PCA(X1, n.comp = 2)
stopifnot(pc$q == 2)
stopifnot(ncol(pc$loadings) == 2)
stopifnot(isTRUE(all.equal(rownames(pc$loadings), colnames(X1))))

# check that invalid n.comp is detected
err <- NULL
tryCatch(PCA(X1, n.comp = 4), error=function(e) err <<- e)
stopifnot(is(err, "simpleError"))
