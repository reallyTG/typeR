## Tests for find_optimal(), get_characteristic(), merge_clusters() functions

# Load packages
library(testthat)
library(optimus)

context("Testing functionality of visible functions")

# set up
cutreeLevels = 2:10


# mixed data
mixed <- data.frame(a = rpois(n = 42, lambda = 10),
                     b = rpois(n = 42, lambda = 11),
                     c = rpois(n = 42, lambda = 12),
                     d = rpois(n = 42, lambda = 13),
                     e = rep("char", 42),
                     f = as.factor(rep("char", 42)),
                    stringsAsFactors = FALSE)

# dummy counts for tests
counts <- data.frame(a = rpois(n = 42, lambda = 10),
                     b = rpois(n = 42, lambda = 11),
                     c = rpois(n = 42, lambda = 12),
                     d = rpois(n = 42, lambda = 13),
                     e = rpois(n = 42, lambda = 14),
                     f = rpois(n = 42, lambda = 15))
# cluster object that cutree works with
counts_cutree <- hclust(dist(counts))
# list of cluster solutions
counts_list <- lapply(2:10, FUN = function(x, data){cutree(tree = data, k = x)}, data=counts_cutree)


## generic input tests

test_that("find_optimal() stops with wrong data or arguments", {
  # wrong family spec
  expect_error(optimus::find_optimal(data = mixed, clustering = counts_cutree, family = "fam"), "family.*")
  # mixed data
  expect_error(optimus::find_optimal(data = mixed, clustering = counts_cutree, family = "poisson"), "some.*")
  # not cutree with cutree=T
  # not list with cutree=F
  # uneven cluster list lengths
  # nrow data matches length clustering labels
  # non numeric vector supplied to cutreeLevels
})

test_that("get_characteristic() stops with wrong data or arguments", {
  # wrong family spec
  expect_error(optimus::get_characteristic(data = mixed,
                                           clustering = stats::cutree(counts_cutree, 5),
                                           family = "fam"), "family.*")
  # mixed data
  expect_error(optimus::get_characteristic(data = mixed,
                                           clustering = stats::cutree(counts_cutree, 5),
                                           family = "poisson"), "some.*")
})

test_that("merge_clusters() stops with wrong data or arguments", {
  # wrong family spec
  expect_error(optimus::merge_clusters(data = mixed,
                                           clustering = stats::cutree(counts_cutree, 5),
                                           family = "fam"), "family.*")
  # mixed data
  expect_error(optimus::merge_clusters(data = mixed,
                                           clustering = stats::cutree(counts_cutree, 5),
                                           family = "poisson"), "some.*")
})


## count tests
counts_optimal <- optimus::find_optimal(data = counts, clustering = counts_cutree, family = "poisson", cutreeLevels = cutreeLevels)
counts_char_glob <- optimus::get_characteristic(data = counts, clustering = stats::cutree(counts_cutree, 5),
                                           family = "poisson", type = "global")
counts_char_perclust <- optimus::get_characteristic(data = counts, clustering = stats::cutree(counts_cutree, 5),
                                                family = "poisson", type = "per.cluster")
counts_merge <- optimus::merge_clusters(data = counts, clustering = stats::cutree(counts_cutree, 5),
                                            family = "poisson", n.iter = 2)

test_that("find_optimal() returns correct class", {
  expect_equal(class(counts_optimal)[1], "aicsums")
  expect_equal(class(counts_optimal)[2], "data.frame")
})

test_that("get_characteristic() returns correct class", {
  expect_equal(class(counts_char_glob)[1], "globalchar")
  expect_equal(class(counts_char_glob)[2], "data.frame")
  expect_equal(class(counts_char_perclust)[1], "perclustchar")
  expect_equal(class(counts_char_perclust)[2], "list")
})

test_that("merge_clusters() returns correct class", {
  expect_equal(class(counts_merge)[1], "dsumaic")
  expect_equal(class(counts_merge)[2], "list")
})

test_that("find_optimal() returns correct number of rows and columns", {
  expect_equal(ncol(counts_optimal), 2)
  expect_equal(nrow(counts_optimal), length(cutreeLevels))
})

test_that("get_characteristic() returns correct number elements", {
  expect_equal(ncol(counts_char_glob), 2)
  expect_equal(nrow(counts_char_glob), ncol(counts))
  expect_equal(length(counts_char_perclust), 5)
  expect_equal(nrow(counts_char_perclust[[1]]), ncol(counts))

})

test_that("find_optimal() returns correctly named columns", {
  expect_equal(all(names(counts_optimal) %in% c("sum_aic", "nclusters")), TRUE)
})

# test AIC results are the same if cutree=T and cutree=F generating the same clustering?

