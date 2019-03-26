context("stretch_nltt_matrix")

test_that("stretch_nltt_matrix #1", {
  # t   N      t   N
  # 0.0 0.5    0.0 0.5
  #         -> 0.5 0.5
  # 1.0 1.0    1.0 1.0
  m <- matrix(c(c(0.0, 1.0), c(0.5, 1.0)), ncol = 2, nrow = 2)
  colnames(m) <- c("t", "N")
  expected <- matrix(
    c(
      seq(0.0, 1.0, 0.5),
      c(0.5, 0.5, 1.0)
    ),
    ncol = 2, nrow = 3
  )
  result <- stretch_nltt_matrix(m = m, dt = 0.5, step_type = "lower")
  if (!identical(result, expected)) {
    print("ERROR")
    print("result:")
    print(result)
    print("expected:")
    print(expected)
  }
  expect_equal(identical(result, expected), TRUE)
})

test_that("stretch_nltt_matrix #2", {
  # t   N      t   N
  # 0.0 0.3    0.00 0.3
  # 0.4 0.5    0.25 0.3
  #            0.50 0.5
  #         -> 0.75 0.5
  # 1.0 1.0    1.00 1.0
  m <- matrix(c(c(0.0, 0.4, 1.0), c(0.3, 0.5, 1.0)), ncol = 2, nrow = 3)
  colnames(m) <- c("t", "N")
  expected <- matrix(
    c(
      seq(0.0, 1.0, 0.25),
      c(0.3, 0.3, 0.5, 0.5, 1.0)
    ),
    ncol = 2, nrow = 5
  )
  result <- stretch_nltt_matrix(m = m, dt = 0.25, step_type = "lower")
  if (!identical(result, expected)) {
    print("ERROR")
    print("result:")
    print(result)
    print("expected:")
    print(expected)
  }
  expect_equal(identical(result, expected), TRUE)
})






test_that("stretch_nltt_matrix from vignette, ", {
  # t   N      t   N
  # 0.0 0.3    0.00 0.3
  # 0.4 0.5    0.25 0.3
  #            0.50 0.5
  #         -> 0.75 0.5
  # 1.0 1.0    1.00 1.0
  newick <- "((A:1,B:1):1,(C:1,D:1):1);"
  phylogeny <- ape::read.tree(text = newick)
  nltt <- nLTT::get_phylogeny_nltt_matrix(phylogeny)
  result <- stretch_nltt_matrix(nltt, dt = 0.25, step_type = "upper")

  expected <- matrix(
    c(
      c(0.00, 0.25, 0.50, 0.75, 1.00),
      c(0.50, 0.50, 1.00, 1.00, 1.00)
    ),
    ncol = 2, nrow = 5
  )
  if (!identical(result, expected)) {
    print("ERROR")
    print("result:")
    print(result)
    print("expected:")
    print(expected)
  }
  expect_equal(identical(result, expected), TRUE)
})




test_that("stretch_nltt_matrix #3", {
  # Fill in the timepoints:
  #
  # t   N
  # 0.0 0.2
  # 0.4 0.5
  # 1.0 1.0
  #
  # becomes
  #
  # t   N
  # 0.0 0.2
  # 0.1 0.2
  # 0.2 0.2
  # 0.3 0.2
  # 0.4 0.5
  # 0.5 0.5
  # 0.6 0.5
  # 0.7 0.5
  # 0.8 0.5
  # 0.9 0.5
  # 1.0 1.0

  test <- matrix(c(c(0.0, 0.4, 1.0), c(0.2, 0.5, 1.0)), ncol = 2, nrow = 3)
  colnames(test) <- c("t", "N")
  expected <- matrix(
    c(
      seq(0.0, 1.0, 0.1),
      rep(0.2, times = 4), rep(0.5, times = 6), 1.0),
      ncol = 2, nrow = 11
  )
  result <- stretch_nltt_matrix(m = test, dt = 0.1, step_type = "lower")
  if (!identical(result, expected)) {
    print("ERROR")
    print("result:")
    print(result)
    print("expected:")
    print(expected)
  }
  expect_equal(identical(result, expected), TRUE)
})






test_that("get_average_nltt_matrix: stop on incorrect input", {
  test <- matrix(c(c(0.0, 0.4, 1.0), c(0.2, 0.5, 1.0)), ncol = 2, nrow = 3)
  colnames(test) <- c("t", "N")

  # must supply a matrx
  expect_error(
    stretch_nltt_matrix(m = list(), dt = 0.1, step_type = "upper")
  )

  # must supply at matrix with two columns
  expect_error(
    stretch_nltt_matrix(
      m = matrix(rep(0.0, times = 9), ncol = 3, nrow = 3),
      dt = 0.1,
      step_type = "upper"
    )
  )

  # step_type should be either 'upper' or 'lower'
  expect_silent(
    stretch_nltt_matrix(m = test, dt = 0.1, step_type = "upper")
  )
  expect_silent(
    stretch_nltt_matrix(m = test, dt = 0.1, step_type = "lower")
  )
  expect_error(
    stretch_nltt_matrix(m = test, dt = 0.1, step_type = "nonsense")
  )

})

test_that("stretch_nltt_matrix: check hard newick, Cer2016 issue 83", {

  newick1 <- "((((S3-3-3:0.1675031644,S15-15-15:0.1675031644):1.907147988,((S6-6-6:0.7420191294,S12-12-12:0.7420191294):1.214657976,S8-8-8:1.956677105):0.1179740472):1.277801487,(((S2-2-2:0.8899823338,((S10-10-10:0.3891799744,S14-14-14:0.3891799744):0.4244144858,(S11-11-11:0.3952677648,S13-13-13:0.3952677648):0.4183266954):0.07638787362):1.24284372,(S7-7-7:1.061923261,S9-9-9:1.061923261):1.070902793):0.342787982,S4-4-4:2.475614036):0.876838603):1.647547361,((((S16-16-16:1.432164957,S28-28-28:1.432164957):0.4387614913,(S25-25-25:0.72979032,((S34-34-34:0.05011133155,S37-37-37:0.05011133155):0.4882989831,S35-35-35:0.5384103147):0.1913800054):1.141136128):1.454235367,((S19-19-19:1.211783643,S30-30-30:1.211783643):1.133537742,S22-22-22:2.345321385):0.9798404296):1.297315759,(S24-24-24:3.139226892,((S20-20-20:2.324746368,S23-23-23:2.324746368):0.512418213,(S21-21-21:1.664931007,(((S26-26-26:0.3510079264,S36-36-36:0.3510079264):0.6473160666,(S31-31-31:0.007537712127,S38-38-38:0.007537712127):0.9907862809):0.2276187496,(S29-29-29:0.8665861791,S33-33-33:0.8665861791):0.3593565635):0.4389882641):1.172233574):0.3020623108):1.483250682):0.3775224257):1e-10;" # nolint
  phylogeny1 <- ape::read.tree(text = newick1)
  phylogenies <- c(phylogeny1)
  full_nltt_matrix <- nLTT::get_phylogeny_nltt_matrix(phylogenies[[1]])
  nltt_values <- nLTT::stretch_nltt_matrix(
    m = full_nltt_matrix,  dt = 0.1, step_type = "upper"
  )
  expect_true(utils::tail(nltt_values[, 2], n = 1) > 0.7)
})
