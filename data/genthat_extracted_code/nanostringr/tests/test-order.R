
context("Orderings")

library(dplyr)
set.seed(1)
logXpr <- replicate(5, rnorm(6))
dim(logXpr)

logHK <- apply(logXpr[, 4:5], 1, mean)
logref <- apply(logXpr[5:6, ], 2, mean)

normtoHK <- sweep(logXpr, 1, logHK) %>% sweep(., 2, logref)
normtoPool <- sweep(logXpr, 2, logref) %>% sweep(., 1, logHK)

test_that("Same Order", {
  expect_equal(normtoHK, normtoPool)
})
