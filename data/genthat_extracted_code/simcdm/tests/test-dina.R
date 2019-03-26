context("test-dina")

## Test Setup for DINA ----

# Set a seed for reproducibility
set.seed(888)

# Setup Parameters
N = 15   # Number of Examinees / Subjects
J = 10   # Number of Items
K = 2    # Number of Skills / Attributes

# Assign slipping and guessing values for each item
ss = gs = rep(.2, J)

# Simulate identifiable Q matrix
Q = sim_q_matrix(J, K)

# Simulate subject attributes
subject_alphas = sim_subject_attributes(N, K)

## Unit Tests for DINA ----

test_that("Verify DINA item simulation is reproducible", {
  
  # Set a seed for reproducibility
  set.seed(7762)
  
  # Simulate items under the DINA model
  items_dina_a = sim_dina_items(subject_alphas, Q, ss, gs)
  
  # Set a seed for reproducibility
  set.seed(7762)
  
  # Simulate items under the DINA model
  items_dina_b = sim_dina_items(subject_alphas, Q, ss, gs)
  
  expect_equal(items_dina_a, items_dina_b, 
               info = "Ensure that items are the same under a set seed")
})

test_that("Verify DINA attribute simulation is reproducible", {
  
  # Set a seed for reproducibility
  set.seed(44820)
  
  # Simulate attributes under the DINA model
  attributes_a = sim_dina_attributes(subject_alphas, Q)
  
  # Set a seed for reproducibility
  set.seed(44820)
  
  # Simulate attributes under the DINA model
  attributes_b = sim_dina_attributes(subject_alphas, Q)
  
  expect_equal(attributes_a, attributes_b, 
               info = "Ensure that attributes are the same under a set seed")
})



