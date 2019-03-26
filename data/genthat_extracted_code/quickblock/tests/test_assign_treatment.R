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
context("assign_treatment")


draw <- function(from, k = length(from)) {
  if (k == 0L) return(integer())
  if (length(from) == 1L) return(from)
  pick <- as.integer(floor(runif(1L) * length(from))) + 1L
  c(from[pick], draw(replace(from, pick, from[1L])[-1L], k - 1L))
}

replica_qbc_assign_treatments <- function(blocking, num_treatments) {
  treatment <- rep(NA, length(blocking))
  for(b in sort(unique(blocking))) {
    block_size <- as.integer(sum(blocking == b, na.rm = TRUE))
    treatment[which(blocking == b)] <- draw(c(
      rep(1:num_treatments, block_size %/% num_treatments),
      draw(1:num_treatments, block_size %% num_treatments)
    ))
  }
  treatment
}

wrapper_qbc_assign_treatments <- function(blocking, num_treatments) {
  .Call(qbc_assign_treatments, blocking, num_treatments)
}

example_blocking1 <- qb_blocking(c("I", "P", "B", "H", "P", "M", "T", "D", "F", "C", "J", "B", "N", "N", "C", "K", "K", "F", "I", "D", "T", "R",
                                   "L", "E", "H", "J", "H", "G", "O", "G", "S", "D", "F", "A", "M", "H", "O", "L", "R", "R", "A", "Q", "B", "E",
                                   "E", "M", "L", "P", "S", "G", "L", "Q", "D", "J", "Q", "E", "P", "A", "N", "I", "C", "J", "K", "F", "T", "R",
                                   "S", "I", "S", "T", "O", "B", "C", "M", "O", "A", "K", "N", "Q", "G"))
example_blocking2 <- qb_blocking(c("I", "P", "B", "H", "P", "M", "T", "D", "F", "C", "J", "B", "N", "N", "C", "K", "K", "F", "I", "D", "T", "R",
                                   "L", "E", "H", "J", "H", "G", "O", "G", "S", "D", "F", "A", "M", "H", "O", "L", "R", "R", "A", "Q", "B", "E",
                                   "E", "M", "L", "P", "S", "G", "L", "Q", "D", "J", "Q", "E", "P", "A", "N", "I", "C", "J", "K", "F", "T", "R",
                                   "S", "I", "S", "T", "O", "B", "C", "M", "O", "A", "K", "N", "Q", "G"), unassigned_labels = c("T", "Q"))

set.seed(12345678)
b1t1 <- replicate(100, wrapper_qbc_assign_treatments(example_blocking1, 2L))
b1t2 <- replicate(100, wrapper_qbc_assign_treatments(example_blocking1, 3L))
suppressWarnings(b1t3 <- replicate(100, wrapper_qbc_assign_treatments(example_blocking1, 5L)))
b2t1 <- replicate(100, wrapper_qbc_assign_treatments(example_blocking2, 2L))
b2t2 <- replicate(100, wrapper_qbc_assign_treatments(example_blocking2, 3L))
suppressWarnings(b2t3 <- replicate(100, wrapper_qbc_assign_treatments(example_blocking2, 5L)))

set.seed(12345678)
replica_b1t1 <- replicate(100, replica_qbc_assign_treatments(example_blocking1, 2L))
replica_b1t2 <- replicate(100, replica_qbc_assign_treatments(example_blocking1, 3L))
replica_b1t3 <- replicate(100, replica_qbc_assign_treatments(example_blocking1, 5L))
replica_b2t1 <- replicate(100, replica_qbc_assign_treatments(example_blocking2, 2L))
replica_b2t2 <- replicate(100, replica_qbc_assign_treatments(example_blocking2, 3L))
replica_b2t3 <- replicate(100, replica_qbc_assign_treatments(example_blocking2, 5L))

test_that("`qbc_assign_treatments` returns same as replica", {
  expect_identical(b1t1, replica_b1t1)
  expect_identical(b1t2, replica_b1t2)
  expect_identical(b1t3, replica_b1t3)
  expect_identical(b2t1, replica_b2t1)
  expect_identical(b2t2, replica_b2t2)
  expect_identical(b2t3, replica_b2t3)
})


example_blocking1 <- qb_blocking(c("D", "C", "A", "A", "A", "B", "A", "B", "C", "C", "B", "A", "B", "D"))
example_blocking2 <- qb_blocking(c("D", "C", "A", NA, "A", "A", "B", NA, NA, "A", "B", NA, "C", "C", "B", "A", "B", "D"))

b1t1 <- replicate(2000, assign_treatment(example_blocking1), simplify = FALSE)
suppressWarnings(b1t2 <- replicate(2000, assign_treatment(example_blocking1, c("T1", "T2", "C")), simplify = FALSE))
b2t1 <- replicate(2000, assign_treatment(example_blocking2), simplify = FALSE)
suppressWarnings(b2t2 <- replicate(2000, assign_treatment(example_blocking2, c("T1", "T2", "C")), simplify = FALSE))

test_that("`assign_treatment` b1t1", {
  expect_true(all(sapply(b1t1, class) == "factor"))
  expect_true(all(sapply(b1t1, function(x) { all(levels(x) == c("Treated", "Control")) })))
  expect_true(all(sapply(b1t1, function(x) { all(as.integer(x) %in% 1:2) })))
  expect_true(all(sapply(b1t1, function(x) { all(sort(as.integer(x)[example_blocking1 == 0L])[1:2] == c(1L, 1L)) })))
  expect_true(all(sapply(b1t1, function(x) { all(sort(as.integer(x)[example_blocking1 == 0L])[4:5] == c(2L, 2L)) })))
  expect_true(all(sapply(b1t1, function(x) { all(sort(as.integer(x)[example_blocking1 == 1L]) == c(1L, 1L, 2L, 2L)) })))
  expect_true(all(sapply(b1t1, function(x) { all(sort(as.integer(x)[example_blocking1 == 2L])[1] == 1L) })))
  expect_true(all(sapply(b1t1, function(x) { all(sort(as.integer(x)[example_blocking1 == 2L])[3] == 2L) })))
  expect_true(all(sapply(b1t1, function(x) { all(sort(as.integer(x)[example_blocking1 == 3L]) == c(1L, 2L)) })))
})

test_that("`assign_treatment` b1t2", {
  expect_true(all(sapply(b1t2, class) == "factor"))
  expect_true(all(sapply(b1t2, function(x) { all(levels(x) == c("T1", "T2", "C")) })))
  expect_true(all(sapply(b1t2, function(x) { all(as.integer(x) %in% 1:3) })))
  expect_true(all(sapply(b1t2, function(x) { all(sort(as.integer(x)[example_blocking1 == 0L])[1] == 1L) })))
  expect_true(all(sapply(b1t2, function(x) { any(as.integer(x)[example_blocking1 == 0L] == 2L) })))
  expect_true(all(sapply(b1t2, function(x) { all(sort(as.integer(x)[example_blocking1 == 0L])[5] == 3L) })))
  expect_true(all(sapply(b1t2, function(x) { all(sort(as.integer(x)[example_blocking1 == 1L])[1] == 1L) })))
  expect_true(all(sapply(b1t2, function(x) { any(as.integer(x)[example_blocking1 == 1L] == 2L) })))
  expect_true(all(sapply(b1t2, function(x) { all(sort(as.integer(x)[example_blocking1 == 1L])[4] == 3L) })))
  expect_true(all(sapply(b1t2, function(x) { all(sort(as.integer(x)[example_blocking1 == 2L]) == c(1L, 2L, 3L)) })))
})

test_that("`assign_treatment` b2t1", {
  expect_true(all(sapply(b2t1, class) == "factor"))
  expect_true(all(sapply(b2t1, function(x) { all(levels(x) == c("Treated", "Control")) })))
  expect_true(all(sapply(b2t1, function(x) { all(as.integer(x[!is.na(example_blocking2)]) %in% 1:2) })))
  expect_true(all(sapply(b2t1, function(x) { all(is.na(x[is.na(example_blocking2)])) })))
  expect_true(all(sapply(b2t1, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 0L)])[1:2] == c(1L, 1L)) })))
  expect_true(all(sapply(b2t1, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 0L)])[4:5] == c(2L, 2L)) })))
  expect_true(all(sapply(b2t1, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 1L)]) == c(1L, 1L, 2L, 2L)) })))
  expect_true(all(sapply(b2t1, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 2L)])[1] == 1L) })))
  expect_true(all(sapply(b2t1, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 2L)])[3] == 2L) })))
  expect_true(all(sapply(b2t1, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 3L)]) == c(1L, 2L)) })))
})

test_that("`assign_treatment` b2t2", {
  expect_true(all(sapply(b2t2, class) == "factor"))
  expect_true(all(sapply(b2t2, function(x) { all(levels(x) == c("T1", "T2", "C")) })))
  expect_true(all(sapply(b2t2, function(x) { all(as.integer(x[!is.na(example_blocking2)]) %in% 1:3) })))
  expect_true(all(sapply(b2t2, function(x) { all(is.na(x[is.na(example_blocking2)])) })))
  expect_true(all(sapply(b2t2, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 0L)])[1] == 1L) })))
  expect_true(all(sapply(b2t2, function(x) { any(as.integer(x)[which(example_blocking2 == 0L)] == 2L) })))
  expect_true(all(sapply(b2t2, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 0L)])[5] == 3L) })))
  expect_true(all(sapply(b2t2, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 1L)])[1] == 1L) })))
  expect_true(all(sapply(b2t2, function(x) { any(as.integer(x)[which(example_blocking2 == 1L)] == 2L) })))
  expect_true(all(sapply(b2t2, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 1L)])[4] == 3L) })))
  expect_true(all(sapply(b2t2, function(x) { all(sort(as.integer(x)[which(example_blocking2 == 2L)]) == c(1L, 2L, 3L)) })))
})


suppressWarnings(stat_test1 <- t(replicate(30000, as.integer(assign_treatment(example_blocking1, c("T1", "T2", "C"))))))

test_that("`assign_treatment` has right treatment probabilities", {
  b1m11 <- t(stat_test1 == 1L) %*% (stat_test1 == 1L) / 30000
  expect_true(all(abs(diag(b1m11) - 1/3) < 0.01))
  diag(b1m11) <- 1/15
  expect_true(all(abs(b1m11[example_blocking1 == 0L, example_blocking1 == 0L] - 1/15) < 0.01))
  diag(b1m11) <- 1/18
  expect_true(all(abs(b1m11[example_blocking1 == 1L, example_blocking1 == 1L] - 1/18) < 0.01))
  diag(b1m11) <- 0
  expect_true(all(b1m11[example_blocking1 == 2L, example_blocking1 == 2L] == 0.0))
  expect_true(all(b1m11[example_blocking1 == 3L, example_blocking1 == 3L] == 0.0))
  expect_true(all(abs(b1m11[example_blocking1 == 0L, example_blocking1 == 1L] - 1/9) < 0.01))
  expect_true(all(abs(b1m11[example_blocking1 == 0L, example_blocking1 == 2L] - 1/9) < 0.01))
  expect_true(all(abs(b1m11[example_blocking1 == 0L, example_blocking1 == 3L] - 1/9) < 0.01))
  expect_true(all(abs(b1m11[example_blocking1 == 1L, example_blocking1 == 2L] - 1/9) < 0.01))
  expect_true(all(abs(b1m11[example_blocking1 == 1L, example_blocking1 == 3L] - 1/9) < 0.01))
  expect_true(all(abs(b1m11[example_blocking1 == 2L, example_blocking1 == 3L] - 1/9) < 0.01))

  b1m23 <- t(stat_test1 == 2L) %*% (stat_test1 == 3L) / 30000
  expect_true(all(diag(b1m23) == 0.0))
  diag(b1m23) <- 5/36
  expect_true(all(abs(b1m23[example_blocking1 == 1L, example_blocking1 == 1L] - 5/36) < 0.01))
  diag(b1m23) <- 1/6
  expect_true(all(abs(b1m23[example_blocking1 == 2L, example_blocking1 == 2L] - 1/6) < 0.01))
  expect_true(all(abs(b1m23[example_blocking1 == 3L, example_blocking1 == 3L] - 1/6) < 0.01))
  expect_true(all(abs(b1m23[example_blocking1 == 0L, example_blocking1 == 1L] - 1/9) < 0.01))
  expect_true(all(abs(b1m23[example_blocking1 == 0L, example_blocking1 == 2L] - 1/9) < 0.01))
  expect_true(all(abs(b1m23[example_blocking1 == 0L, example_blocking1 == 3L] - 1/9) < 0.01))
  expect_true(all(abs(b1m23[example_blocking1 == 1L, example_blocking1 == 2L] - 1/9) < 0.01))
  expect_true(all(abs(b1m23[example_blocking1 == 1L, example_blocking1 == 3L] - 1/9) < 0.01))
  expect_true(all(abs(b1m23[example_blocking1 == 2L, example_blocking1 == 3L] - 1/9) < 0.01))
})
