# LIBS
library(treeman)
library(testthat)

# RUNNING
context('Testing \'set-methods\'')
test_that('setTxnyms() works', {
  tree <- randTree(100, wndmtrx=sample(c(TRUE, FALSE), 1))
  txnyms <- paste0('txnym_', 1:tree['nall'])
  names(txnyms) <- tree['all']
  tree <- setTxnyms(tree, txnyms)
  expect_true(tree['wtxnyms'])
})
test_that('set_ID() works', {
  tree <- randTree(100, wndmtrx=sample(c(TRUE, FALSE), 1))
  vals <- paste0('new_id_', 1:100)
  ids <- tree['tips']
  tree <- setNdsID(tree, ids=ids, vals=vals)
  expect_true(all(tree['tips'] %in% vals))
  expect_true(all(getNdKids(tree, 'n1') %in% vals))
  tree <- setNdID(tree, id='new_id_1', val='t1')
  expect_false('new_id_1' %in% tree@tips)
})
test_that('setNdSpn() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  before_pd <- tree['pd']
  ids <- tree['all'][tree['all'] != tree['root']]
  id <- sample(ids, 1)
  before_prdst <- getNdPrdst(tree, id)
  val <- getNdSlt(tree, slt_nm='spn', id=id)/2
  tree <- setNdSpn(tree, id=id, val=val)
  expect_that(getNdPD(tree, tree['root']) + val, equals(before_pd))
  expect_that(getNdPrdst(tree, id) + val, equals(before_prdst))
})
test_that('setNdsSpn() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  before_pd <- tree['pd']
  before_age <- getAge(tree)
  ids <- tree['all'][tree['all'] != tree['root']]
  vals <- getNdsSlt(tree, slt_nm='spn', ids=ids)
  vals <- vals/2
  tree <- setNdsSpn(tree, ids=ids, vals=vals)
  expect_that(tree['pd']*2, equals(before_pd))
  expect_that(getAge(tree)*2, equals(before_age))
  tree <- setNdsSpn(tree, ids=ids, vals=0)
  expect_false(tree['wspn'])
})
test_that('setPD() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  tree <- setPD(tree, val=1)
  expect_that(tree['pd'], equals(1))
})
test_that('setAge() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  tree <- setAge(tree, val=1)
  tree_age <- getAge(tree)
  expect_that(tree_age, equals(1))
})
test_that('setNdOther() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  val <- sample(0:1, size=1)
  tree <- setNdOther(tree, id='t1', val, 'binary_val')
  res <- getNdSlt(tree, id='t1', slt_nm='binary_val')
  expect_that(val, equals(res))
})
test_that('setNdsOther() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  vals <- sample(0:1, size=tree['nall'], replace=TRUE)
  tree <- setNdsOther(tree, tree['all'], vals, 'binary_val')
  tree <- updateSlts(tree)
  summary(tree)
  res <- getNdsSlt(tree, ids=tree['all'], slt_nm='binary_val')
  names(res) <- NULL
  expect_equal(vals, res)
})
test_that('rmOtherSlt() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  vals <- sample(0:1, size=tree['nall'], replace=TRUE)
  tree <- setNdsOther(tree, tree['all'], vals, 'binary_val')
  tree <- updateSlts(tree)
  tree <- rmOtherSlt(tree, 'binary_val')
  tree <- updateSlts(tree)
  summary(tree)
  res <- getNdsSlt(tree, ids=tree['all'], slt_nm='binary_val')
  expect_true(is.na(res[[1]]))
})