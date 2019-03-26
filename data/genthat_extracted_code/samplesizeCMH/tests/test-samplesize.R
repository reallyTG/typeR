context("Sample size results")

test_that("Returns same value as Nam 1992", {
  sample_size_test <- function(correct) {
    ceiling(
      power.cmh.test(
        p2 = c(0.75,0.70,0.65,0.60),
        theta = 3,
        power = 0.9,
        t = c(0.10,0.40,0.35,0.15),
        alternative = "greater",
        correct = correct
      )$N
    )
  }
  # Uncorrected
  expect_equal(sample_size_test(FALSE),171)

  # Corrected
  expect_equal(sample_size_test(TRUE),192)
})

test_that("Corrected sample size is greater than uncorrected", {
  correction_test <- function(thetas, p2, power, alternative) {
    vN <- Vectorize(power.cmh.test,"correct", SIMPLIFY = FALSE)

    N_pair <-
      sapply(
        vN(
          theta = thetas,p2 = p2,N = NULL,power = power,
          alternative = alternative,correct = c(FALSE,TRUE)
        ),
        "[[",
        "N"
      )

    N_pair[1] < N_pair[2]
  }

  # Two-sided
  expect_true(correction_test(c(12,12),c(0.2,0.25),0.8,"two"))
  expect_true(correction_test(c(10,10),c(0.2,0.25),0.8,"two"))
  expect_true(correction_test(c(8,8),c(0.2,0.25),0.8,"two"))
  expect_true(correction_test(c(8,8),c(0.2,0.5),0.8,"two"))
  expect_true(correction_test(c(4,8),c(0.2,0.5),0.8,"two"))
  expect_true(correction_test(c(2,6),c(0.2,0.5),0.8,"two"))
  expect_true(correction_test(c(3,3),c(0.2,0.5),0.8,"two"))
  expect_true(correction_test(c(3,3),c(0.2,0.5),0.9,"two"))
  expect_true(correction_test(c(4,4),c(0.2,0.5),0.8,"two"))
  expect_true(correction_test(1 / c(12,12),c(0.2,0.25),0.8,"two"))
  expect_true(correction_test(1 / c(10,10),c(0.2,0.25),0.8,"two"))
  expect_true(correction_test(1 / c(8,8),c(0.2,0.25),0.8,"two"))
  expect_true(correction_test(1 / c(8,8),c(0.2,0.5),0.8,"two"))
  expect_true(correction_test(1 / c(4,8),c(0.2,0.5),0.8,"two"))
  expect_true(correction_test(1 / c(2,6),c(0.2,0.5),0.8,"two"))
  expect_true(correction_test(1 / c(3,3),c(0.2,0.5),0.8,"two"))
  expect_true(correction_test(1 / c(3,3),c(0.2,0.5),0.9,"two"))
  expect_true(correction_test(1 / c(4,4),c(0.2,0.5),0.8,"two"))

  # Greater
  expect_true(correction_test(c(12,12),c(0.2,0.25),0.8,"g"))
  expect_true(correction_test(c(10,10),c(0.2,0.25),0.8,"g"))
  expect_true(correction_test(c(8,8),c(0.2,0.25),0.8,"g"))
  expect_true(correction_test(c(8,8),c(0.2,0.5),0.8,"g"))
  expect_true(correction_test(c(4,8),c(0.2,0.5),0.8,"g"))
  expect_true(correction_test(c(2,6),c(0.2,0.5),0.8,"g"))
  expect_true(correction_test(c(3,3),c(0.2,0.5),0.8,"g"))
  expect_true(correction_test(c(3,3),c(0.2,0.5),0.9,"g"))
  expect_true(correction_test(c(4,4),c(0.2,0.5),0.8,"g"))

  # Less
  expect_true(correction_test(1 / c(12,12),c(0.2,0.25),0.8,"l"))
  expect_true(correction_test(1 / c(10,10),c(0.2,0.25),0.8,"l"))
  expect_true(correction_test(1 / c(8,8),c(0.2,0.25),0.8,"l"))
  expect_true(correction_test(1 / c(8,8),c(0.2,0.5),0.8,"l"))
  expect_true(correction_test(1 / c(4,8),c(0.2,0.5),0.8,"l"))
  expect_true(correction_test(1 / c(2,6),c(0.2,0.5),0.8,"l"))
  expect_true(correction_test(1 / c(3,3),c(0.2,0.5),0.8,"l"))
  expect_true(correction_test(1 / c(3,3),c(0.2,0.5),0.9,"l"))
  expect_true(correction_test(1 / c(4,4),c(0.2,0.5),0.8,"l"))
})
