context("test-attributes")

test_that("Valid attribute_bijection", {
  bijection_test = matrix( 2^((3-1):0) )
  
  expect_equal(attribute_bijection(3),  bijection_test)
})

test_that("Valid attribute_inv_bijection", {
  
  inv_bijection_test = function(K, CL) { 
    alpha = rep(NA, K)
    
    for (k in seq_len(K) - 1) {
      twopow = 2^(K - k - 1)
      alpha[k + 1] = 1 * (twopow <= CL)
      CL = CL - twopow * alpha[k + 1]
    }
    
    matrix(alpha)
  } 
  
  expect_equal(attribute_inv_bijection(3, 0),  inv_bijection_test(3, 0))
  
  expect_equal(attribute_inv_bijection(4, 1),  inv_bijection_test(4, 1))
  
  expect_equal(attribute_inv_bijection(5, 2),  inv_bijection_test(5, 2))
  
})

test_that("Valid attribute classes (alpha matrix / pi references)", {
  
  # Old, r-specific pi mapping function
  pi_reference = function(K) {
    biject.vector = attribute_bijection(K)
    As = as.matrix(
      expand.grid( rep( list(c(0, 1)), K) )
    )
    a = As %*% biject.vector
    As = As[a + 1,]
    return(As)
  }
  
  # Check equality
  expect_equal(attribute_classes(2), pi_reference(2), check.attributes = FALSE,
               info = "Verify latent class mapping is correct.")
  
  # Check equality
  expect_equal(attribute_classes(5), pi_reference(5), check.attributes = FALSE,
               info = "Verify latent class mapping is correct.")
  
  # Check equality
  expect_equal(attribute_classes(8), pi_reference(8), check.attributes = FALSE,
               info = "Verify latent class mapping is correct.")
})

test_that("Simulation of attributes matches", {
  
  # Use old RNG version for equality check
  suppressWarnings(RNGversion("3.5.0"))
  
  N = 20   # Number of Examinees / Subjects
  K = 3    # Number of Skills / Attributes
  
  class_alphas = attribute_classes(K)
  class_alphas
  
  set.seed(888)
  subject_alphas_func = sim_subject_attributes(N, K)

  set.seed(888)
  subject_alphas_base = class_alphas[sample(2 ^ K, N, replace = TRUE),]
  
  expect_equal(subject_alphas_func, subject_alphas_base,
               info = "Equivalent subject alpha Generation")
})

test_that("Simulation of attributes matches with probs", {
  
  # Use old RNG version for equality check
  suppressWarnings(RNGversion("3.5.0"))
  
  N = 20   # Number of Examinees / Subjects
  K = 2    # Number of Skills / Attributes
  
  # Latent Class Probabilities
  pis = c(.1, .2, .3, .4)
  
  set.seed(991)
  # Generate latent attribute profile with custom probability (N subjects by K skills)
  subject_alphas_func = sim_subject_attributes(N, K, prob = pis)
  
  set.seed(991)
  class_alphas = attribute_classes(K)
  subject_alphas_base = class_alphas[sample(2 ^ K, N, replace = TRUE, prob = pis),]
  
  expect_equal(subject_alphas_func, subject_alphas_base,
               info = "Equivalent subject alphas generation under probabilities.")
})

