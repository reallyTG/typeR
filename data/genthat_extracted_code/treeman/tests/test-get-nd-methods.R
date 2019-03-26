# LIBS
library(treeman)
library(testthat)

# PARAMETERS
n <- 10  # number of tips in test trees

# FUNCTIONS
getTestTree <- function(n) {
  # test 'update'
  wndmtrx <- sample(c(TRUE, FALSE), 1)
  randTree(n, wndmtrx)
}

# RUNNING
context('Testing \'get-nd-methods\'')
test_that('getNdLng() works', {
  data(mammals)
  rndm_tp <- sample(mammals['tips'], 1)
  res <- getNdLng(mammals, rndm_tp)
  expect_true('Mammalia' %in% res)
})
test_that('getNdPD() works', {
  tree <- getTestTree(n)
  tot_pd <- sum(getNdsSlt(tree, "spn", tree['all']))
  id <- sample(tree['tips'], 1)
  pd <- getNdPD(tree, id)
  expect_equal(pd, 0)
  pd <- getNdPD(tree, tree['root'])
  expect_equal(pd, tot_pd)
})
test_that('getNdAge() works', {
  tree <- getTestTree(n)
  id <- sample(tree['all'], 1)
  tree_age <- getAge(tree)
  nd_age <- getNdAge(tree, id, tree_age=tree_age)
  expect_true(nd_age >= 0)
})
test_that('getNdPrdst() works', {
  tree <- getTestTree(n)
  id <- sample(tree['all'], 1)
  prdst <- getNdPrdst(tree, id)
  expect_true(prdst >= 0)
})
test_that('getNdSstr() works', {
  tree <- getTestTree(n)
  ids <- tree['all'][tree['all'] != tree['root']]
  id <- sample(ids, 1)
  res <- getNdSstr(tree, id)
  expect_true(res %in% tree['all'])
  res <- getNdSstr(tree, tree['root'])
  expect_null(res)
})
test_that('getNdSlt() works', {
  tree <- getTestTree(n)
  id <- sample(tree['all'], 1)
  nd_spn <- getNdSlt(tree, slt_nm="spn", id=id)
  nd_prid <- getNdSlt(tree, slt_nm="prid", id=id)
  nd_ptid <- getNdSlt(tree, slt_nm="ptid", id=id)
  expect_that(class(nd_spn), equals('numeric'))
  expect_that(class(nd_prid), equals('character'))
  expect_that(class(nd_ptid), equals('character'))
})
test_that('getNdKids() works', {
  tree <- getTestTree(n)
  id <- sample(tree['nds'], 1)
  kids <- getNdKids(tree, id)
  expect_true(all(kids %in% tree['tips']))
})
test_that('getSpnAge() works', {
  tree <- getTestTree(n)
  tree_age <- getAge(tree)
  tip_age <- getSpnAge(tree, sample(tree['tips'], 1), tree_age=tree_age)
  expect_true(tip_age[['start']] > tip_age[['end']])
})
test_that("getNdPrids() works", {
  tree <- getTestTree(n)
  prid <- getNdPrids(tree, id='n1')
  expect_that(prid, equals('n1'))  # root nodes are recursive
  id <- sample(tree['all'], 1)
  prids <- getNdPrids(tree, id=id)
  expect_true(all(prids %in% tree['all']))
})
test_that("getNdPtids() works", {
  tree <- getTestTree(n)
  id <- sample(tree['nds'], 1)
  ptids <- getNdPtids(tree, id)
  expect_true(all(ptids %in% tree['all']))
})
test_that("getNdLng() works", {
  tree <- getTestTree(n)
  txnyms <- paste0('txnymns_', 1:tree['nall'])
  names(txnyms) <- tree['all']
  txnyms[tree['root']] <- 'this_is_the_root'
  tree <- setTxnyms(tree, txnyms)
  lng <- getNdLng(tree, sample(tree['tips'], 1))
  expect_true(lng[[1]] == 'this_is_the_root')
})