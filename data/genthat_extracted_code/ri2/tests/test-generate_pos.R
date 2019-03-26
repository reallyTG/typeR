context("gen_pos")


test_that("generate pos", {
  Z <- complete_ra(100)
  Y <- rnorm(100)
  expect_length( ri2:::generate_pos(Y = Y, assignment_vec = Z, sharp_hypothesis = 0), 200)

  Z <- complete_ra(100, num_arms = 3)
  Y <- rnorm(100)
  ri2:::generate_pos(Y = Y, assignment_vec = Z, sharp_hypothesis = 0)

  Z <- complete_ra(100)
  Y <- rnorm(100)
  ri2:::generate_pos(Y = Y, assignment_vec = Z, sharp_hypothesis = 1)

  Z <- complete_ra(100, num_arms = 3)
  Y <- rnorm(100)
  ri2:::generate_pos(Y = Y, assignment_vec = Z, sharp_hypothesis = 1)

  Z <- complete_ra(100, num_arms = 3)
  Y <- rnorm(100)
  ri2:::generate_pos(Y = Y, assignment_vec = Z, sharp_hypothesis = c(1, 2))
})
