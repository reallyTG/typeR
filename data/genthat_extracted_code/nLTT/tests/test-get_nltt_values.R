context("get_nltt_values")

test_that("input data type", {

  n_trees <- 2
  n_tips <- 3
  set.seed(41)
  ape_phylogenies <- ape::rmtree(N = n_trees, n = n_tips)
  single_phylogeny <- ape::rmtree(N = 1, n = n_tips)

  # must supply at least something
  expect_error(get_nltt_values(c()))

  #  dt must be from 0.0 to and including 1.0
  expect_error(get_nltt_values(ape_phylogenies, dt = -0.1))
  expect_error(get_nltt_values(ape_phylogenies, dt = 1.1))

  # must supply at least two trees
  expect_error(get_nltt_values(single_phylogeny))

  # must supply a phylogeny
  expect_error(get_nltt_values(c(1, 2, 3)))

  # must supply only phylogenies
  expect_error(get_nltt_values(list(c(1, 2), single_phylogeny)))
})


test_that("return data type", {

  newick1 <- "((A:1,B:1):1,(C:1,D:1):1);"
  newick2 <- paste("((((XD:1,ZD:1):1,CE:2):1,(FE:2,EE:2):1):4,",
    "((AE:1,BE:1):1,(WD:1,YD:1):1):5);", sep = "")
  phylogeny1 <- ape::read.tree(text = newick1)
  phylogeny2 <- ape::read.tree(text = newick2)
  phylogenies <- c(phylogeny1, phylogeny2)
  result <- nLTT::get_nltt_values(
    c(phylogeny1, phylogeny2), dt = 0.20)

  expect_equal(names(result), c("id", "t", "nltt"))
  expect_equal(nrow(result), 12)
  expect_equal(ncol(result), 3)

  expect_true(is.data.frame(result))
  expect_true(is.factor(result$id))
  expect_true(is.numeric(result$t))
  expect_true(is.numeric(result$nltt))
})



test_that(paste("How to stretch an nltt timepoints matrix: ",
  "Example: Two easy tree", sep = ""), {

  # The average of nltts A and B should be C
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
  n_phylogenies <- 2
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

  phylogenies <- c(phylogeny1, phylogeny2)
  testit::assert(length(phylogenies) == 2)
  result <- nLTT::get_nltt_values(
    phylogenies, dt = 0.20)
  ## [1,]  1 0.0 0.6666667  # nolint
  ## [2,]  1 0.2 0.6666667  # nolint
  ## [3,]  1 0.4 0.6666667  # nolint
  ## [4,]  1 0.6 0.6666667  # nolint
  ## [5,]  1 0.8 1.0000000  # nolint
  ## [6,]  1 1.0 1.0000000  # nolint
  ## [1,]  2 0.0 0.6666667  # nolint
  ## [2,]  2 0.2 0.6666667  # nolint
  ## [3,]  2 0.4 1.0000000  # nolint
  ## [4,]  2 0.6 1.0000000  # nolint
  ## [5,]  2 0.8 1.0000000  # nolint
  ## [6,]  2 1.0 1.0000000  # nolint

  m <- matrix(
      c(rep(1, 6), rep(2, 6),
      rep(seq(0, 1, 0.2), 2),
      rep(2 / 3, 4), rep(1, 2), rep(2 / 3, 2), rep(1, 4)),
      ncol = 3, byrow = FALSE
    )
  expected <- as.data.frame(x = m)
  colnames(expected) <- c("id", "t", "nltt")
  expected$id <- as.factor(expected$id)

  expect_equal(nrow(result), 12)
  expect_equal(ncol(result), 3)
  expect_equal(all.equal(result, expected), TRUE)
})





test_that(paste("How to stretch an nltt timepoints matrix: ",
  "Example: Two harder trees", sep = ""), {

  newick1 <- "((A:1,B:1):1,(C:1,D:1):1);"
  newick2 <- paste("((((XD:1,ZD:1):1,CE:2):1,(FE:2,EE:2):1):4,",
    "((AE:1,BE:1):1,(WD:1,YD:1):1):5);", sep = "")
  phylogeny1 <- ape::read.tree(text = newick1)
  phylogeny2 <- ape::read.tree(text = newick2)
  n_phylogenies <- 2

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
  result <- nLTT::get_nltt_values(
    c(phylogeny1, phylogeny2), dt = 0.20)

  ## [1,]  1 0.0  0.5  # nolint
  ## [2,]  1 0.2  0.5  # nolint
  ## [3,]  1 0.4  0.5  # nolint
  ## [4,]  1 0.6  1.0  # nolint
  ## [5,]  1 0.8  1.0  # nolint
  ## [6,]  1 1.0  1.0  # nolint
  ## [1,]  2 0.0 0.2222222  # nolint
  ## [2,]  2 0.2 0.2222222  # nolint
  ## [3,]  2 0.4 0.2222222  # nolint
  ## [4,]  2 0.6 0.3333333  # nolint
  ## [5,]  2 0.8 0.6666667  # nolint
  ## [6,]  2 1.0 1.0000000  # nolint
  m <- matrix(c(
      rep(1, 6), rep(2, 6),
      rep(seq(0, 1, 0.2), 2),
      rep(0.5, 3), rep(1.0, 3), rep(2 / 9, 3), 1 / 3, 2 / 3, 1.0
    ),
    ncol = 3, byrow = FALSE)
  expected <- as.data.frame(x = m)
  colnames(expected) <- c("id", "t", "nltt")
  expected$id <- as.factor(expected$id)
  expect_equal(nrow(result), 12)
  expect_equal(ncol(result), 3)
  expect_equal(all.equal(result, expected), TRUE)
})



test_that(paste("get_nltt_values: ",
  "How to stretch an nltt timepoints matrix: ",
  "Example: Three harder trees", sep = ""), {

  newick1 <- "((A:1,B:1):1,(C:1,D:1):1);"
  newick2 <- paste("((((XD:1,ZD:1):1,CE:2):1,(FE:2,EE:2):1):4,",
    "((AE:1,BE:1):1,(WD:1,YD:1):1):5);", sep = "")
  newick3 <- ape::rcoal(30)
  phylogeny1 <- ape::read.tree(text = newick1)
  phylogeny2 <- ape::read.tree(text = newick2)
  phylogeny3 <- ape::read.tree(text = newick2)
  phylogenies <- c(phylogeny1, phylogeny2, phylogeny3)

  # The real tests
  result <- nLTT::get_nltt_values(phylogenies, dt = 0.20)

  expect_equal(nrow(result), 18)
  expect_equal(ncol(result), 3)
})

test_that("get_nltt_values: check hard newick, Cer2016 issue 83", {

  newick1 <- "((((S3-3-3:0.1675031644,S15-15-15:0.1675031644):1.907147988,((S6-6-6:0.7420191294,S12-12-12:0.7420191294):1.214657976,S8-8-8:1.956677105):0.1179740472):1.277801487,(((S2-2-2:0.8899823338,((S10-10-10:0.3891799744,S14-14-14:0.3891799744):0.4244144858,(S11-11-11:0.3952677648,S13-13-13:0.3952677648):0.4183266954):0.07638787362):1.24284372,(S7-7-7:1.061923261,S9-9-9:1.061923261):1.070902793):0.342787982,S4-4-4:2.475614036):0.876838603):1.647547361,((((S16-16-16:1.432164957,S28-28-28:1.432164957):0.4387614913,(S25-25-25:0.72979032,((S34-34-34:0.05011133155,S37-37-37:0.05011133155):0.4882989831,S35-35-35:0.5384103147):0.1913800054):1.141136128):1.454235367,((S19-19-19:1.211783643,S30-30-30:1.211783643):1.133537742,S22-22-22:2.345321385):0.9798404296):1.297315759,(S24-24-24:3.139226892,((S20-20-20:2.324746368,S23-23-23:2.324746368):0.512418213,(S21-21-21:1.664931007,(((S26-26-26:0.3510079264,S36-36-36:0.3510079264):0.6473160666,(S31-31-31:0.007537712127,S38-38-38:0.007537712127):0.9907862809):0.2276187496,(S29-29-29:0.8665861791,S33-33-33:0.8665861791):0.3593565635):0.4389882641):1.172233574):0.3020623108):1.483250682):0.3775224257):1e-10;" # nolint
  phylogeny1 <- ape::read.tree(text = newick1)
  phylogenies <- c(phylogeny1)
  result <- nLTT::get_nltt_values(phylogenies, dt = 0.10)
  expect_true(utils::tail(result$nltt, n = 1) > 0.7)
})

# From https://github.com/richelbilderbeek/nLTT/issues/33
# Thanks to @franciscorichter for finding this bug
test_that("get_nltt_values: issue 33", {

  set.seed(42)
  phylogenies <- c(ape::rcoal(3), ape::rcoal(5))
  testthat::expect_silent(
   nLTT::get_nltt_values(phylogenies = phylogenies, dt = 0.0001))
  testthat::expect_error(
   nLTT::get_nltt_values(phylogenies = phylogenies, dt = 0.00001),
   "dt too small")

})
