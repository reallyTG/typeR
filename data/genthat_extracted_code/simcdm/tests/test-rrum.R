context("test-rrum")

test_that("Verify rrum item generation is recoverable", {
  
  # Set a seed for reproducibility
  set.seed(912358)
  
  # Setup Parameters
  N = 15   # Number of Examinees / Subjects
  J = 10   # Number of Items
  K = 2    # Number of Skills / Attributes
  
  # The probabilities of answering each item correctly for individuals 
  # who do not lack any required attribute
  pistar = rep(.9, J)
  
  # Simulate an identifiable Q matrix
  Q = sim_q_matrix(J, K)
  
  # Penalties for failing to have each of the required attributes
  rstar  = .5 * Q
  
  # Latent Class Probabilities
  pis = c(.1, .2, .3, .4)
  
  # Generate latent attribute profile with custom probability (N subjects by K skills)
  subject_alphas = sim_subject_attributes(N, K, prob = pis)
  
  set.seed(523)
  rrum_items_a = sim_rrum_items(Q, rstar, pistar, subject_alphas)
  
  set.seed(523)
  rrum_items_b = sim_rrum_items(Q, rstar, pistar, subject_alphas)
  
  expect_equal(rrum_items_a, rrum_items_b)
})
