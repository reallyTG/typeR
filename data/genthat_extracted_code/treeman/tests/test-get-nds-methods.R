# LIBS
library(treeman)
library(testthat)

# PARAMETERS
n <- 10  # number of tips in test trees

# FUNCTIONS
getTestTree <- function(n) {
  # test 'wndmtrx'
  wndmtrx <- sample(c(TRUE, FALSE), 1)
  randTree(n, wndmtrx)
}

# RUNNING
context('Testing \'get-methods\'')
test_that('getNdsLng() works', {
  data(mammals)
  rndm_tps <- sample(mammals['tips'], 10)
  res <- getNdsLng(mammals, rndm_tps)
  test <- all(sapply(res, function(x) 'Mammalia' %in% x))
  expect_true(test)
})
test_that('getNdsPD() works', {
  tree <- getTestTree(n)
  tot_pd <- sum(getNdsSlt(tree, 'spn', tree['all']))
  pds <- getNdsPD(tree, tree['all'])
  expect_true(all(pds[tree['tips']] == 0))
  expect_true(all(pds[tree['tips']] <= tot_pd))
})
test_that('getNdsPrdst() works', {
  tree <- getTestTree(n)
  ids <- tree['all']
  tree_age <- getAge(tree)
  prdsts <- getNdsPrdst(tree, ids)
  expect_true(all(prdsts <= tree_age))
})
test_that('getNdsSstr() works', {
  tree <- getTestTree(n)
  tips <- tree['tips']
  fwrd <- getNdsSstr(tree, tips)
  rvrse <- getNdsSstr(tree, fwrd)
  expect_that(rvrse, equals(tips))
})
test_that('getNdsSlt() works', {
  tree <- getTestTree(n)
  tot_pd <- sum(getNdsSlt(tree, 'spn', tree['all']))
  nd_spns <- getNdsSlt(tree, slt_nm="spn",
                       ids=tree['all'])
  expect_that(sum(nd_spns), equals(tot_pd))
  ptids <- getNdsSlt(tree, slt_nm='ptid', ids=tree['all'])
  expect_true(length(ptids[[sample(tree['tips'], 1)]]) == 0)
})
test_that('getNdsKids() works', {
  tree <- getTestTree(n)
  kids <- getNdsKids(tree, tree['nds'])
  expect_true(all(kids$n1 %in% paste0("t", 1:10)))
})
test_that('getNdsAge() works', {
  tree <- getTestTree(n)
  root_age <- getAge(tree)
  nd_ages <- getNdsAge(tree, tree['nds'], tree_age=root_age)
  expect_true(all(nd_ages <= root_age))
})
test_that('getSpnsAge() works', {
  tree <- getTestTree(n)
  tree_age <- getAge(tree)
  tip_ages <- getSpnsAge(tree, tree['tips'], tree_age=tree_age)
  res <- all(tip_ages[ ,'start'] > tip_ages[ ,'end'])
  expect_true(res)
})
test_that("getNdsPrids() works", {
  tree <- getTestTree(n)
  prids <- getNdsPrids(tree, tree['nds'])
  tests <- sapply(prids, function(n) 'n1' %in% n)
  expect_true(all(tests))
  # ordrd
  prids <- getNdsPrids(tree, tree['nds'], ordrd=TRUE)
  lst_ns <- sapply(prids, function(n) n[length(n)])
  expect_true(all(lst_ns == "n1"))
})
test_that("getNdsPtids() works", {
  tree <- getTestTree(n)
  ptids <- getNdsPtids(tree, tree['nds'])
  n1_ptids <- tree['all'][tree['all'] != 'n1']
  expect_true(all(n1_ptids %in% ptids[['n1']]))
  expect_null(ptids[['t1']])
})
test_that("getNdsLng() works", {
  tree <- getTestTree(n)
  txnyms <- paste0('txnymns_', 1:tree['nall'])
  names(txnyms) <- tree['all']
  txnyms[tree['root']] <- 'this_is_the_root'
  tree <- setTxnyms(tree, txnyms)
  lngs <- getNdsLng(tree, tree['tips'])
  test <- all(sapply(lngs, function(x) x[[1]] == 'this_is_the_root'))
  expect_true(test)
})