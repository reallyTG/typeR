context('Test zapa')

test_that('zapa works with missing data', {

  # 1 missing value
  a <- array( rep(1:4, 3), dim = c(2, 3, 2))
  a[1, 1, 1] <- NA

  a1 <- zapa(a)

  # The whole landmark with an NA should be 0
  expect_true(all(a1[1, , 1] == 0))
  # Only the landmark with an NA should be zero (others are between 1 and 4)
  expect_true(sum(a1 == 0) == 3)
  # There should be no remaining NAs
  expect_false(any(is.na(a1)))

  # 2 missing values in different landmarks
  # New NA, a[1,1,1] is still NA from previous test.
  a[2, 3, 1] <- NA

  a2 <- zapa(a)

  # Both landmarks with an NA should be 0
  expect_true(all(a2[1, , 1] == 0, a2[2, , 1] == 0))
  # Only the landmarks with an NA should be zero (others are between 1 and 4)
  expect_true(sum(a2 == 0) == 6)
  # There should be no remaining NAs
  expect_false(any(is.na(a2)))



  # 2 missing values in same landmark
  # Make this one a value again.
  a[2, 3, 1] <- 2

  # Add additional NA in specimen 1, landmark 1. And check I've done it right.
  a[1, 3, 1] <- NA
  expect_true(sum(is.na(a)) == 2)
  expect_true(all(is.na(a[1, c(1, 3), 1])))


  a3 <- zapa(a)

  # a3 should have replaced same elements as in a1
  expect_equal(a1, a3)


  # The whole landmark with an NA should be 0
  expect_true(all(a3[1, , 1] == 0))
  # Only the landmark with an NA should be zero (others are between 1 and 4)
  expect_true(sum(a3 == 0) == 3)
  # There should be no remaining NAs
  expect_false(any(is.na(a3)))
  

})



test_that('zapa works when no data is missing', {

  # 1 missing value
  a <- array( rep(1:4, 3), dim = c(2, 3, 2))

  a1 <- zapa(a)

  expect_equal(a1, a)
  expect_false(any(a1 == 0))
  expect_false(any(is.na(a1)))

})



test_that('unzapa works with missing values', {

  a <- array( rep(1:4, 3), dim = c(2, 3, 2))
  b <- a
  b[1, 1, 1] <- NA

  a1 <- unzapa(a, b)
  
  # expect NAs at (1,1,1)
  expect_true(is.na(a1[1, 1, 1]))
  # expect no NAs other than that one
  expect_true(sum(is.na(a1)) == 1)


})

test_that('unzapa works with no missing values', {


  a <- array( rep(1:4, 3), dim = c(2, 3, 2))
  b <- a + 5

  a2 <- unzapa(a, b)
  
  # expect no NAs
  expect_false(any(is.na(a2)))

  # a2 and a should be the same. i.e. unzapa shouldn't change a
  expect_equal(a, a2)

})



