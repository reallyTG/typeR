context("get_average_nltt_matrix")

test_that("can get the average nLTT stats from one phylogeny", {

  n_trees <- 2
  n_tips <- 3
  set.seed(41)
  single_phylogeny <- ape::rmtree(N = 1, n = n_tips)
  testthat::expect_silent(get_average_nltt_matrix(single_phylogeny))
})

test_that(paste(
  "How to stretch an nLTT timepoints matrix: ",
  "Example: Easy tree", sep = ""), {

  # The average of nLTTs A and B should be C
  #
  #      A              B              C       # nolint
  #                                            # nolint
  # |  ********    |      ****    |      ****  # nolint
  # |  *           |      *       |   ****     # nolint
  # ****           ********       *****        # nolint
  # |              |              |            # nolint
  # |              |              |            # nolint
  # |              |              |            # nolint
  # +----------    +----------    +----------  # nolint
  #
  newick1 <- "((A:1,B:1):2,C:3);"
  newick2 <- "((A:2,B:2):1,C:3);"
  phylogeny1 <- ape::read.tree(text = newick1)
  phylogeny2 <- ape::read.tree(text = newick2)
  nltt_matrix1 <- nLTT::stretch_nltt_matrix(
    get_phylogeny_nltt_matrix(phylogeny1),
    dt = 0.2, step_type = "upper")
  ##      [,1]      [,2]  # nolint
  ## [1,]  0.0 0.6666667  # nolint
  ## [2,]  0.2 0.6666667  # nolint
  ## [3,]  0.4 0.6666667  # nolint
  ## [4,]  0.6 0.6666667  # nolint
  ## [5,]  0.8 1.0000000  # nolint
  ## [6,]  1.0 1.0000000  # nolint
  expected_nltt_matrix1 <- matrix(c(seq(0.0, 1.0, 0.2),
    rep(2 / 3, 4), rep(1, 2)), ncol = 2)
  testit::assert(all.equal(nltt_matrix1, expected_nltt_matrix1))

  nltt_matrix2 <- nLTT::stretch_nltt_matrix(
    get_phylogeny_nltt_matrix(phylogeny2),
    dt = 0.2, step_type = "upper")
  ##      [,1]      [,2]  # nolint
  ## [1,]  0.0 0.6666667  # nolint
  ## [2,]  0.2 0.6666667  # nolint
  ## [3,]  0.4 1.0000000  # nolint
  ## [4,]  0.6 1.0000000  # nolint
  ## [5,]  0.8 1.0000000  # nolint
  ## [6,]  1.0 1.0000000  # nolint
  expected_nltt_matrix2 <- matrix(c(seq(0.0, 1.0, 0.2),
    rep(2 / 3, 2), rep(1, 4)), ncol = 2)
  testit::assert(all.equal(nltt_matrix2, expected_nltt_matrix2))

  result <- nLTT::get_average_nltt_matrix(
    c(phylogeny1, phylogeny2), dt = 0.20)
  ##      [,1]      [,2]  # nolint
  ## [1,]  0.0 0.6666667  # nolint
  ## [2,]  0.2 0.6666667  # nolint
  ## [3,]  0.4 0.8333333  # nolint
  ## [4,]  0.6 0.8333333  # nolint
  ## [5,]  0.8 1.0000000  # nolint
  ## [6,]  1.0 1.0000000  # nolint
  expected <- matrix(c(seq(0.0, 1.0, 0.2),
    rep(2 / 3, 2), rep(5 / 6, 2), rep(1, 2)), ncol = 2)
  expect_equal(all.equal(nltt_matrix2, expected_nltt_matrix2), TRUE)
})





test_that(paste(
  "How to stretch an nLTT timepoints matrix: ",
  "Example: Harder trees", sep = ""), {

  newick1 <- "((A:1,B:1):1,(C:1,D:1):1);"
  newick2 <- paste("((((XD:1,ZD:1):1,CE:2):1,(FE:2,EE:2):1):4,",
    "((AE:1,BE:1):1,(WD:1,YD:1):1):5);", sep = "")
  phylogeny1 <- ape::read.tree(text = newick1)
  phylogeny2 <- ape::read.tree(text = newick2)

  nltt_matrix1 <- nLTT::stretch_nltt_matrix(
    nLTT::get_phylogeny_nltt_matrix(phylogeny1),
    dt = 0.20, step_type = "upper")

  ##      [,1] [,2]  # nolint
  ## [1,]  0.0  0.5  # nolint
  ## [2,]  0.2  0.5  # nolint
  ## [3,]  0.4  0.5  # nolint
  ## [4,]  0.6  1.0  # nolint
  ## [5,]  0.8  1.0  # nolint
  ## [6,]  1.0  1.0  # nolint
  expected_nltt_matrix1 <- matrix(c(seq(0.0, 1.0, 0.2),
    rep(0.5, 3), rep(1.0, 3)), ncol = 2)
  testit::assert(all.equal(nltt_matrix1, expected_nltt_matrix1))

  nltt_matrix2 <- nLTT::stretch_nltt_matrix(
    nLTT::get_phylogeny_nltt_matrix(phylogeny2),
    dt = 0.20, step_type = "upper")
  ##      [,1]      [,2]  # nolint
  ## [1,]  0.0 0.2222222  # nolint
  ## [2,]  0.2 0.2222222  # nolint
  ## [3,]  0.4 0.2222222  # nolint
  ## [4,]  0.6 0.3333333  # nolint
  ## [5,]  0.8 0.6666667  # nolint
  ## [6,]  1.0 1.0000000  # nolint
  expected_nltt_matrix2 <- matrix(c(seq(0.0, 1.0, 0.2),
    rep(2 / 9, 3), 1 / 3, 2 / 3, 1.0), ncol = 2)
  testit::assert(all.equal(nltt_matrix2, expected_nltt_matrix2))
  #phylogenies <- c(phylogeny1, phylogeny2)  # nolint

  # The real tests
  result <- nLTT::get_average_nltt_matrix(
    c(phylogeny1, phylogeny2), dt = 0.20)

  ##      [,1]      [,2]  # nolint
  ## [1,]  0.0 0.3611111  # nolint
  ## [2,]  0.2 0.3611111  # nolint
  ## [3,]  0.4 0.3611111  # nolint
  ## [4,]  0.6 0.6666667  # nolint
  ## [5,]  0.8 0.8333333  # nolint
  ## [6,]  1.0 1.0000000  # nolint
  expected <- matrix(c(seq(0.0, 1.0, 0.2), rep(13 / 36, 3),
    2 / 3, 5 / 6, 1.0), ncol = 2)
  expect_equal(all.equal(result, expected), TRUE)
})

test_that("data types", {
  # Create a list or multiPhylo of phylogenies (of type phylo)
  # and run it through the get_average_nltt_matrix function

  n_trees <- 2
  n_tips <- 3
  set.seed(41)
  ape_phylogenies <- ape::rmtree(N = n_trees, n = n_tips)
  m <- get_average_nltt_matrix(ape_phylogenies)
  expect_equal(ncol(m), 2)
  expect_equal(nrow(m), 1001)

  set.seed(41)
  treesim_phylogenies <- TreeSim::sim.bd.age(
    6, numbsim = n_trees, lambda = 0.4, mu = 0.0, complete = FALSE)
  n <- get_average_nltt_matrix(treesim_phylogenies)
  expect_equal(ncol(n), 2)
  expect_equal(nrow(n), 1001)

  combined_phylogenies <- c(ape::rcoal(10), ape::rcoal(20))
  p <- get_average_nltt_matrix(combined_phylogenies)
  expect_equal(ncol(p), 2)
  expect_equal(nrow(p), 1001)
  expect_equal(TRUE, TRUE)
})

test_that("stop on incorrect input", {

  n_trees <- 2
  n_tips <- 3
  set.seed(41)
  ape_phylogenies <- ape::rmtree(N = n_trees, n = n_tips)
  single_phylogeny <- ape::rmtree(N = 1, n = n_tips)

  # must supply at least something
  expect_error(get_average_nltt_matrix(c()))

  #  dt must be from 0.0 to and including 1.0
  expect_error(get_average_nltt_matrix(ape_phylogenies, dt = -0.1))
  expect_error(get_average_nltt_matrix(ape_phylogenies, dt = 1.1))


  # must supply a phylogeny
  expect_error(get_average_nltt_matrix(c(1, 2, 3)))

  # must supply only phylogenies
  expect_error(get_average_nltt_matrix(list(c(1, 2), single_phylogeny)))
})
