library(spartan)
context("Test of A-Test calculation utilities")

test_that("normaliseATest", {

  # Normalise should return a value scaled between 0.5 and 1
  expect_equal(normaliseATest(0.5),0.5)
  expect_equal(normaliseATest(1.0),1.0)
  # Anything less than 0.5 should be rescaled:
  expect_equal(normaliseATest(0),1)
  expect_equal(normaliseATest(0.2),0.8)

  # String handling
  expect_message(normaliseATest("A"),"Error in Normalise A-Test, non numeric figure provided")
  # Non existant Parameter handing
  expect_message(normaliseATest(A),"Error in A-Test value sent for normalisation")

})

test_that("num.decimals", {

  # Should return the correct number of decimal places
  expect_equal(num.decimals(0.33),2)
  expect_equal(num.decimals(1),1)
  expect_equal(num.decimals(0.3),1)
  expect_false(isTRUE(all.equal(num.decimals(0.334444), 7)))
})

