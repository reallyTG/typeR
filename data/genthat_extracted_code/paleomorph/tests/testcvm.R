context('Test that all cvm functions work.')

test_that('dotcorr calculates correlation coefficient properly.', {


M <- array(0, dim = c(2, 3, 4))

# Landmarks are perfectly correlated
M[1, , ] <- 1:12
M[2, , ] <- 1:12

r <- dotcorrentry(M, 1, 2)

expect_equal(r[1,1], 1)

})


test_that('Congruence is never outside -1, 1', {

  set.seed(999)
  r <- replicate(100, {
    # I don't think they need to be centered first. So use points not around (0, 0, 0)
    mu <- rnorm(1, 0, 3)
    M <- array(rnorm(4*2*3, mu), dim = c(2, 3, 4))
    dotcorr(M)
  })

  expect_true(all(r >= -1))
  expect_true(all(r <= 1))



})




test_that('dotcvm calculates congruence coefficient properly.', {



M <- array(0, dim = c(2, 3, 4))

# Landmarks are perfectly correlated
M[1, , ] <- 1:12
M[2, , ] <- 1:12

r <- dotcvm(M)

rcorr <- dotcorr(M)

expect_true(all(r > 0))

expect_true(all(r == r[1,1]))
expect_true(all(rcorr == rcorr[1,1]))



set.seed(1)
M <- array(rnorm(4 * 2 * 3), dim = c(2, 3, 4)) 
corr.mat <- dotcorr(M)
expect_equal(diag(corr.mat), c(1,1))

# Not sure a good test for this.
cvm.mat <- dotcvm(M)


})


test_that('dotcvm calculates congruence coefficient with NAs.', {



M <- array(0, dim = c(2, 3, 4))

# Landmarks are perfectly correlated
M[1, , ] <- 1:12
M[2, , ] <- 1:12

r1 <- dotcvm(M)

M[1, , 1] <- NA

r2 <- dotcvm(M)

expect_true(r1[2, 2] == r2[2, 2])


})





test_that('dotcorr, dotcvm work with dimnames.', {


M <- array(0, dim = c(2, 3, 4), dimnames=list(NULL, NULL, letters[1:4]))

# Landmarks are perfectly correlated
M[1, , ] <- 1:12
M[2, , ] <- 1:12

expect_error(r <- dotcorrentry(M, 1, 2), NA)

expect_equal(r[1,1], 1)



expect_error(r <- dotcvmentry(M, 1, 2), NA)


})




test_that('covar calculates covariance matrix with NAs.', {



M <- array(0, dim = c(2, 3, 4))

# Landmarks are perfectly correlated
M[1, , ] <- 1:12
M[2, , ] <- 1:12

r1 <- covar(M)

M[1, , 1] <- NA

r2 <- covar(M)

expect_equal(r1[4:6, 4:6], r2[4:6, 4:6])

expect_equal(ncol(r2), 2 * 3)

})






test_that('dotcvm calculates congruence coefficient properly with 2d data.', {
  
  
  
  M <- array(0, dim = c(2, 2, 4))
  
  # Landmarks are perfectly correlated
  M[1, , ] <- 1:8
  M[2, , ] <- 1:8
  
  r <- dotcvm(M)
  

  expect_true(all(r > 0))
  
  expect_true(all(r == r[1,1]))

  
})



