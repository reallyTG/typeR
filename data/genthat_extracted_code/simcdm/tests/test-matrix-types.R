context("test-matrix-types")

test_that("Reproducible Q matrix simulations", {
  
  # Item configuration
  J = 20
  K = 3
  
  set.seed(888)
  q1 = sim_q_matrix(J, K)
  
  set.seed(888)
  q2 = sim_q_matrix(J, K)
  
  expect_equal(q1,  q2, info = "Verify Q matrix is able to be regenerated")
})


test_that("Incorrect dimensions for an identifiable Q matrix creation", {
  
  # Verify Q matrix throws error if J < 3 * K - 1.
  
  # Todo: tighten this check.
  expect_error(sim_q_matrix(5, 3), info = "")
})


test_that("Reproducible eta matrix simulations", {
  
  # Item configuration
  J = 25
  K = 3
  
  set.seed(998)
  # Construct a random q matrix
  Q_sim = sim_q_matrix(J, K)
  
  set.seed(125)
  # Generate the eta matrix
  eta1 = sim_eta_matrix(K, J, Q_sim)
  
  set.seed(125)
  # Re-generate the eta matrix
  eta2 = sim_eta_matrix(K, J, Q_sim)
  
  expect_equal(eta1,  eta2, info = "Verify eta matrix is able to be regenerated")
})

