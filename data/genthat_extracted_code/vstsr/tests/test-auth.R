testthat::context('Authentication')

testthat::test_that('Authentication gives back single string', {
  auth_key <- vstsr::vsts_auth_key('x', 'y')

  testthat::expect_is(auth_key, 'character')
  testthat::expect_length(auth_key, 1)
})
