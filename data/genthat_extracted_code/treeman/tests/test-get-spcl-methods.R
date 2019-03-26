# LIBS
library(treeman)
library(testthat)

# RUNNING
context('Testing \'get-spcl-methods\'')
test_that('getBiprts() works',{
  tree <- randTree(10, wndmtrx = sample(c(TRUE, FALSE), 1))
  # tip list
  biprts <- getBiprts(tree = tree)
  expect_true(all(tree@tips %in% unique(unlist(biprts))))
  # partial list
  subsample <- sample(tree@tips, 5)
  biprts <- getBiprts(tree = tree, tips = subsample)
  expect_true(all(subsample %in% unique(unlist(biprts))))
  # unrooted
  biprts <- getBiprts(tree = tree, root = FALSE)
  expect_true(length(biprts) %in% c(8, 7))
  # universal
  biprts <- getBiprts(tree = tree, universal = TRUE, root = TRUE)
  expect_true("1111111111" %in% biprts)
  biprts <- getBiprts(tree = tree, universal = TRUE, root = FALSE)
  expect_false("1111111111" %in% biprts)
  expect_true(all(grepl(pattern = "^1", x = biprts)))
})
test_that('isUltrmtrc() works',{
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  expect_false(isUltrmtrc(tree))
  tree <- ultrTree(tree)
  expect_true(isUltrmtrc(tree))
})
test_that('getDcsd() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  dead <- getDcsd(tree)
  expect_true(all(dead %in% tree['tips']))
})
test_that('getLvng() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  living <- getLvng(tree)
  expect_true(all(living %in% tree['tips']))
})
test_that('getUnqNds() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  tids <- sample(tree['tips'], 2)
  unqnds <- getUnqNds(tree, tids)
  expect_true(length(unqnds) >= length(tids))
})
test_that('getCnntdNds() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  tids <- sample(tree['tips'], 2)
  cnntdnds <- getCnnctdNds(tree, tids)
  prnt <- getPrnt(tree, tids)
  ptids <- tree[[prnt]]['ptid']
  expect_false(prnt %in% cnntdnds)
  expect_true(all(ptids %in% ptids))
})
test_that('getNdsFrmTxnyms() works', {
  data(mammals)
  res <- getNdsFrmTxnyms(mammals, 'Homo')[[1]]
  expect_true(res == 'Homo_sapiens')
})
test_that('getTreeAge() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  age <- getAge(tree)
  expect_true(age > 0)
  expect_true(age < tree['pd'])
})
test_that('getOtgrp() works', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  rnd_nd <- sample(tree['nds'][tree['nds'] != tree['root']], 1)
  ingrp <- getNdKids(tree, rnd_nd)
  otgrp <- sample(tree['tips'][!tree['tips'] %in% ingrp], 1)
  res <- getOtgrp(tree, ids=c(ingrp, otgrp))
  expect_that(res, equals(otgrp))
})
test_that("getPrnt() works", {
  tree <- readTree(text="(((A,B),(C,D)),(E,F));",
                   wndmtrx=sample(c(TRUE, FALSE), 1))
  prnt <- getPrnt(tree, ids=c("A", "F"))
  expect_true(prnt == tree@root)
})
test_that("getPath() works", {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  pth <- getPath(tree, from="t1", to="t10")
  prnt <- getPrnt(tree, ids=c('t1', "t10"))
  expect_true(prnt %in% pth)
  expect_that(pth[1], equals('t1'))
  expect_that(pth[length(pth)], equals('t10'))
})
test_that("getSubtree(id) works", {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  subtree <- getSubtree(tree, 'n2')
  tree_age <- getAge(tree)
  subtree_age <- getAge(subtree)
  expect_that(tree['ntips'], is_more_than(subtree['ntips']))
  expect_that(tree['nnds'], is_more_than(subtree['nnds']))
  expect_that(tree['pd'], is_more_than(subtree['pd']))
  expect_that(tree_age, is_more_than(subtree_age))
})