# LIBS
library(treeman)
library(testthat)

# RUNNING
context('Testing \'ndmtrx-methods\'')
# MULTIPLE
test_that('.getNdsPrdstsFrmMtrx() works', {
  # init
  tree <- randTree(100, wndmtrx=TRUE)
  ndlst <- tree@ndlst
  ids <- names(ndlst)
  spns <- treeman:::.getSltSpns(tree@ndlst)
  # test
  prdsts <- treeman:::.getNdsPrdstsFrmMtrx(tree@ndmtrx, all_ids=ids, ids=ids,
                                           spns=spns, parallel=FALSE,
                                           progress="none")
  tree_age <- getAge(tree)
  expect_true(all(prdsts <= tree_age))
})
test_that('.getNdsKidsFrmMtrx() works', {
  # init
  tree <- randTree(100, wndmtrx=TRUE)
  ndlst <- tree@ndlst
  ids <- names(ndlst)
  tids <- tree@tips
  # test
  kids <- treeman:::.getNdsKidsFrmMtrx(tree@ndmtrx, all_ids=ids, ids=ids,
                                       tids=tids, parallel=FALSE,
                                       progress="none")
  expect_true(all(sapply(kids[names(kids) %in% tree['tips']],
                         length) == 0))
})
test_that('.getNdsPtidsFrmMtrx() works', {
  # init
  tree <- randTree(100, wndmtrx=TRUE)
  ndlst <- tree@ndlst
  ids <- names(ndlst)
  # test
  ptids <- treeman:::.getNdsPtidsFrmMtrx(tree@ndmtrx, all_ids=ids, ids=ids,
                                        parallel=FALSE, progress="none")
  expect_true(all(sapply(ptids[names(ptids) %in% tree['tips']],
                         length) == 0))
})
test_that('.getNdsPridsFrmMtrx() works', {
  # init
  tree <- randTree(100, wndmtrx=TRUE)
  ndlst <- tree@ndlst
  ids <- names(ndlst)
  # test
  prids <- treeman:::.getNdsPridsFrmMtrx(tree@ndmtrx, all_ids=ids, ids=ids,
                                        parallel=FALSE, progress="none")
  expect_true(prids[[tree['root']]] == tree['root'])
})
test_that('.getNdsPDFrmMtrx() works', {
  # init
  tree <- randTree(100, wndmtrx=TRUE)
  ndlst <- tree@ndlst
  ids <- names(ndlst)
  spns <- treeman:::.getSltSpns(tree@ndlst)
  # test
  pds <- treeman:::.getNdsPDFrmMtrx(tree@ndmtrx, all_ids=ids, ids=ids,
                                    spns=spns, parallel=FALSE, progress="none")
  expect_true(sum(pds[names(pds) %in% tree['tips']]) == 0)
})
# TREE
test_that('.getTreeAgeFrmMtrx() works', {
  # init
  tree <- randTree(100, wndmtrx=TRUE)
  ids <- names(tree@ndlst)
  spns <- treeman:::.getSltSpns(tree@ndlst)
  tids <- tree@tips
  # test
  res <- treeman:::.getTreeAgeFrmMtrx(tree@ndmtrx,
                                      all_ids=ids,
                                      tids=tids,
                                      spns=spns,
                                      FALSE)
  expect_lt(res, tree['pd'])
  tree_age <- getAge(tree)
  expect_equal(res, tree_age)
})