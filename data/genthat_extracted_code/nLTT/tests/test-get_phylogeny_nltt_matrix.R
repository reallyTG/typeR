context("get_phylogeny_nltt_matrix")

test_that("get_phylogeny_nltt_matrix #1", {

  #
  #         /-------- A
  #  +------+
  # =+      +-------- B
  #  |
  #  \--------------- C
  #
  # +-------********X
  # |       *       |
  # ********X       |
  # *               |
  # X               |
  # |               |
  # +-+-+-+-+-+-+-+-+
  #
  # Should become the nLTT matrix:
  #
  #      time         N
  # [1,]  0.0 0.3333333
  # [2,]  0.5 0.6666667
  # [3,]  1.0 1.0000000
  newick <- "((A:1,B:1):1,C:2);"
  phylogeny <- ape::read.tree(text = newick)
  result <- nLTT::get_phylogeny_nltt_matrix(phylogeny)
  expected <- matrix(c(seq(0.0, 1.0, 0.5),
    seq(1 / 3, 1.0, 1 / 3)), ncol = 2, nrow = 3)
  colnames(expected) <- c("time", "N")
  expect_equal(identical(result, expected), TRUE)
})


test_that("get_phylogeny_nltt_matrix #2", {
  library(testit)

  #
  #         /-------- A
  #  +------+
  #  |      +-------- B
  #  +
  #  |      +-------- C
  #  +------+
  #         \-------- D
  #
  # +-------********X
  # |       *       |
  # |       X       |
  # |       *       |
  # ********X       |
  # *               |
  # X               |
  # |               |
  # +-+-+-+-+-+-+-+-+
  #
  # Should become the nLTT matrix:
  #
  #      time         N
  # [1,]  0.0 0.25
  # [2,]  0.5 0.5
  # [3,]  0.5 0.75
  # [4,]  1.0 1.0

  newick <- "((A:1,B:1):1,(C:1,D:1):1);"
  phylogeny <- ape::read.tree(text = newick)
  result <- nLTT::get_phylogeny_nltt_matrix(phylogeny)
  expected <- matrix(c(c(0.0, 0.5, 0.5, 1.0),
    c(0.25, 0.5, 0.75, 1.0)), ncol = 2, nrow = 4)
  colnames(expected) <- c("time", "N")
  if (!identical(result, expected)) {
    print("ERROR")
    print("expected:")
    print(expected)
    print("result:")
    print(result)
  }
  expect_equal(identical(result, expected), TRUE)
})





test_that("get_phylogeny_nltt_matrix: stop on incorrect input", {

  # must supply at least something
  expect_error(get_phylogeny_nltt_matrix(c()))

  # must supply a phylogeny
  expect_error(get_phylogeny_nltt_matrix(c(1, 2, 3)))
})
