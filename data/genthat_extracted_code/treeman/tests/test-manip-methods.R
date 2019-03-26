# LIBS
library(treeman)
library(testthat)

# TEST FUNCTIONS
randomLineage <- function(n, tree) {
  # add random monophyletic taxonyms to tree
  addLname <- function(nd, tree) {
    tree@ndlst[[nd]][['txnym']] <- lname
    pnds <- getNdPtids(tree, nd)
    for(pnd in pnds) {
      tree <- addLname(pnd, tree)
    }
    tree
  }
  nds <- tree@nds
  nds <- nds[nds != tree@root]
  lname <- paste0('l', 1)
  tree <- addLname(tree@root, tree)
  for(i in 2:(n-1)) {
    lname <- paste0('l', i)
    nd <- sample(nds, 1)
    tree <- addLname(nd, tree)
  }
  getNdsLng(tree, tree['tips'])
  tree@wtxnyms <- TRUE
  tree
}
randomTips <- function(n, tree, tree_age) {
  # generate random tips with lineages for pinning
  lngs <- ends <- tip_ids <- rep(NA, n)
  nds <- names(tree@ndlst)
  nds <- nds[nds != 'n1']
  for (i in 1:n) {
    random_nd <- sample(nds, 1)
    l <- c(getNdLng(tree, random_nd),
           paste0('new_l', i))
    lngs[i] <- list(l)
    ends[i] <- runif(max=tree_age, min=0, n=1)
    tip_ids[i] <- paste0('new_', i)
  }
  list("l"=lngs, "e"=ends, "t"=tip_ids)
}

# RUNNING
context('Testing \'manip-methods\'')
test_that('addTip() works', {
  test_tree_size <- 10
  # TEST 1 check for tree without spns
  tree <- randTree(test_tree_size,
                   wndmtrx=sample(c(TRUE, FALSE), 1))
  tree <- setNdsSpn(tree, tree['all'], 0)
  tid <- paste0('t', tree['ntips'] + 1)
  sid <- sample(tree['tips'], 1)
  new_tree <- addTip(tree, tid=tid, sid=sid)
  # test if successful
  expect_that(length(getNdKids(new_tree, tree['root'])),
              equals(new_tree['ntips']))
  # TEST 2 check for multiple tips with spns
  tree <- randTree(test_tree_size,
                   wndmtrx=sample(c(TRUE, FALSE), 1))
  pd_before <- tree['pd']
  age_before <- getAge(tree)
  tid <- paste0('t', tree['ntips'] + 1)
  sid <- sample(tree['tips'], 1, replace=FALSE)
  # create suitable age range
  sid_spn <- getNdSlt(tree, 'spn', sid)
  min_strt_age <- getNdAge(tree, sid, age_before)
  max_strt_age <- min_strt_age + sid_spn
  strt_age <- runif(1, max=max_strt_age, min=min_strt_age)
  end_age <- strt_age - runif(1, max=strt_age, min=0)
  additional_pd <- sum(strt_age - end_age)
  new_tree <- addTip(tree, tid=tid, sid=sid, strt_age=strt_age,
                      end_age=end_age, tree_age=age_before)
  # phylo <- as(new_tree, 'phylo')
  # plot(phylo)
  spns <- getNdsSlt(tree, 'spn', tree['all'])
  expect_true(all(spns >= 0))
  expect_that(getAge(new_tree), equals(age_before))
  expect_that(new_tree['ntips'], equals(test_tree_size + 1))
  expect_that(new_tree['pd'], equals(pd_before + additional_pd))
})
test_that('rmTips() work', {
  n <- 100
  tree <- randTree(n, wndmtrx=sample(c(TRUE, FALSE), 1))
  # test dropping 1 tip
  pd_before <- tree['pd']
  tid <- sample(tree['tips'], 1)
  tid_spn <- getNdSlt(tree, id=tid, slt_nm='spn')
  tree <- rmTips(tree, tid)
  expect_true(checkNdlst(tree@ndlst, tree@root))
  expect_that(tree['ntips'], equals(n - 1))
  expect_that(pd_before-tid_spn, equals(tree['pd']))
  # test multiple tips
  n <- tree['ntips']
  pd_before <- tree['pd']
  tids <- sample(tree['tips'], 10)
  tree <- rmTips(tree, tids)
  expect_true(checkNdlst(tree@ndlst, tree@root))
  expect_that(tree['ntips'], equals(n - 10))
  expect_that(pd_before, is_more_than(tree['pd']))
})
test_that('rmNodes() works', {
  tree <- randTree(100, wndmtrx=sample(c(TRUE, FALSE), 1))
  nids <- sample(tree['nds'][tree['nds'] != tree['root']], 10)
  tree <- rmNodes(tree, nids)
  expect_true(tree['ply'])
  tree <- randTree(100, wndmtrx = TRUE)
  nids <- sample(tree['nds'][tree['nds'] != tree['root']], 10)
  tree <- rmNodes(tree, nids)
  expect_true(tree['ply'])
  t_age <- getAge(tree)
})
test_that('pinTips() work', {
  # TODO: a better test would be to take a tree with lineages,
  #  remove a random set of tips and add them again.
  n_start <- 10
  n_add <- 20
  tree <- randTree(n_start, wndmtrx=sample(c(TRUE, FALSE), 1))
  tree <- randomLineage(n_start/2, tree)
  pd_before <- tree['pd']
  age_before <- getAge(tree)
  ntips_before <- tree['ntips']
  rdata <- randomTips(n_add, tree, getAge(tree))
  tree <- pinTips(tree, tids=rdata[["t"]],
                  lngs=rdata[["l"]],
                  end_ages=rdata[["e"]],
                  tree_age=age_before)
  #phylo <- as(tree, 'phylo')
  #plot(phylo)
  expect_that(validObject(tree), is_true())
  #expect_that(tree['ntips'], equals(n_start+n_add))  # not necessarily true
  expect_that(pd_before, is_less_than(tree['pd']))
  expect_gt(tree['ntips'], ntips_before)
  #expect_that(age_before, equals(tree['age']))  # not necessarily true
  writeTree(tree, file='test.tre')  # expect no error
})
test_that('ultrTree() works', {
  trees <- cTrees(randTree(100), unblncdTree(100),
                  blncdTree(100))
  for(tree in trees['treelst']) {
    tree <- ultrTree(tree)
    expect_true(length(getDcsd(tree)) == 0)
  }
})
test_that('rmClade() works', {
  t1 <- randTree(100)
  t1 <- rmClade(t1, sample(t1['nds'], 1))
  expect_true(t1['ntips'] < 100)
  t2 <- randTree(100, wndmtrx=TRUE)
  t2 <- rmClade(t2, sample(t2['nds'], 1))
  expect_true(t2['ntips'] < 100)
  t2_age <- getAge(t2)
})
test_that('addClade() works', {
  t1 <- randTree(100, wndmtrx=sample(c(TRUE, FALSE), 1))
  cld <- getSubtree(t1, 'n2')
  t2 <- rmClade(t1, 'n2')
  t3 <- addClade(t2, 'n2', cld)
  expect_true(t3['ntips'] == 100)
})
if(file.exists('test.tre')) {
  file.remove('test.tre')
}