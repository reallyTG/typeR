context('Test full procrustes function')

library(abind)

test_that('Basic procrustes works', {

  # Make sh1, then rotate, resize and translate twice to make sh2 and sh3.

  set.seed(33)
  # Make a shape, then rotate it, then pcr it bake
  sh1 <- matrix(sample(1:48), ncol = 3)

  sh2 <- sh1 * 3

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)  ),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh2 <- t(apply(sh2, 1, function(x) t(x) %*% R))

  sh2 <- sh2 + 1



  sh3 <- sh1 * 1

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)  ),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh3 <- t(apply(sh3, 1, function(x) t(x) %*% R))

  sh3 <- sh3 -2


  A <- abind(sh1, sh2, sh3, along = 3)


  B <- procrustes(A, scale = TRUE, tolerance = 10e-9)
  
  expect_equal(B[, , 1], B[, , 2])
  expect_equal(B[, , 2], B[, , 3])
  expect_equal(B[, , 1], B[, , 3])


})


test_that('Missing data procrustes works', {

  set.seed(77)
  # Make a shape, then rotate it, then pcr it bake
  sh1 <- matrix(sample(1:48), ncol = 3)

  sh2 <- sh1 * 3

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)  ),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh2 <- t(apply(sh2, 1, function(x) t(x) %*% R))

  sh2 <- sh2 + 1



  sh3 <- sh1 * 0.2

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)  ),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh3 <- t(apply(sh3, 1, function(x) t(x) %*% R))

  sh3 <- sh3 - 2
  
  sh4 <- sh1 * 3
  sh4[1, ] <- NA


  A <- abind(sh1, sh2, sh3, sh4, along = 3)


  B <- procrustes(A, scale = TRUE, tolerance = 1e-10)
  
  expect_equal(B[, , 1], B[, , 2])
  expect_equal(B[, , 2], B[, , 3])
  expect_equal(B[, , 1], B[, , 3])



})



test_that('Scale switch and other params work', {

  # 1. Test that scaling changes the result. That all shapes are equal with scaling and not equal without scaling.
  # 2. Test that given shapes that have been rotated and translated but not scaled, all shapes are equal.

  set.seed(12)
  # Make a shape, then rotate it, then pcr it bake
  sh1 <- matrix(sample(1:48), ncol = 3)

  sh2 <- sh1 * 3

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)  ),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh2 <- t(apply(sh2, 1, function(x) t(x) %*% R))

  sh2 <- sh2 + 1



  sh3 <- sh1 * 5

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)  ),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh3 <- t(apply(sh3, 1, function(x) t(x) %*% R))

  sh3 <- sh3 - 2
  
  sh4 <- sh1 * 3


  A <- abind(sh1, sh2, sh3, along = 3)


  # procrustes with and without scaling.
  B <- procrustes(A, scale = TRUE)
  C <- procrustes(A, scale = FALSE)

  expect_true(all(B[, , 1] - B[, , 2] < 1e-7))
  expect_true(all(B[, , 1] - B[, , 3] < 1e-7))
  expect_true(all(B[, , 2] - B[, , 3] < 1e-7))

  expect_false(all(C[, , 1] - C[, , 2] < 1e-7))
  expect_false(all(C[, , 1] - C[, , 2] < 1e-7))
  expect_false(all(C[, , 1] - C[, , 2] < 1e-7))


  ######################################################

  # Now test that procrustes with scale = FALSE does return identical objects if objects were same size to start with.

  set.seed(122)
  # Make a shape, then rotate it, then pcr it back
  sh1 <- matrix(sample(1:48), ncol = 3)

  sh2 <- sh1 

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)  ),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh2 <- t(apply(sh2, 1, function(x) t(x) %*% R))

  sh2 <- sh2 + 1



  sh3 <- sh1 

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)  ),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh3 <- t(apply(sh3, 1, function(x) t(x) %*% R))

  sh3 <- sh3 - 2
  
  sh4 <- sh1 


  A <- abind(sh1, sh2, sh3, along = 3)


  # procrustes with and without scaling.
  B <- procrustes(A, scale = FALSE)

  expect_true(all(B[, , 1] - B[, , 2] < 1e-7))
  expect_true(all(B[, , 1] - B[, , 3] < 1e-7))
  expect_true(all(B[, , 2] - B[, , 3] < 1e-7))

})






test_that('Partially missing data causes an error.', {

  a <- array(1:(3*6*7), dim = c(7, 3, 6))
  a[1, 2, 3] <- NA

  expect_error(procrustes(a))

  
  a <- array(1:(3*6*7), dim = c(7, 3, 6))
  a[1, , 2] <- NA

  expect_error(procrustes(a), NA)


})


# TODO
test_that('Procrustes with and without missing data give similar cvms', {

  set.seed(22)
  # Make a shape, then rotate it, then pcr it back
  sh1 <- matrix(sample(1:48), ncol = 3)

  sh2 <- sh1 * 3

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh2 <- t(apply(sh2, 1, function(x) t(x) %*% R))

  sh2 <- sh2 + 1



  sh3 <- sh1 * 0.2

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)  ),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh3 <- t(apply(sh3, 1, function(x) t(x) %*% R))

  sh3 <- sh3 - 2
  
  sh4 <- sh1 * 3

  A1 <- abind(sh1, sh2, sh3, sh4, along = 3)
  A2 <- A1 + rnorm(length(A1), 0, 1)
  A3 <- A1 + rnorm(length(A1), 0, 1)
  A4 <- A1 + rnorm(length(A1), 0, 1)
  A <- abind(A1, A2, A3, A4, along = 3)



  full <- procrustes(A, scale = TRUE, tolerance = 1e-10)

  # Now add some missing data and repeat.
  B <- A
  B[c(1, 2), , 1] <- NA

  
  missing <- procrustes(B, scale = TRUE, tolerance = 1e-10)

  fullcorr <- dotcvm(full)
  missingcorr <- suppressWarnings(dotcvm(missing))

  # Still not sure how to really test this? 
  #  I imagine the bigger the array and the less missing data, the closer the two 
  #    covariancve matrices will be.
  expect_true(all(fullcorr - missingcorr < 1e-5))

})








test_that('procrustes works with names.', {

  a <- array(1:(3*6*7), dim = c(7, 3, 6))

  b <- array(1:(3*6*7), dim = c(7, 3, 6), dimnames=list(NULL, NULL, letters[1:6]))


  expect_error(procrustes(b), NA)
  expect_equal(procrustes(a), procrustes(b))




  b <- array(1:(3*6*7), dim = c(7, 3, 6), dimnames=list(letters[1:7], NULL, letters[1:6]))


  expect_error(procrustes(b), NA)
  expect_equal(procrustes(a), procrustes(b))



  b <- array(1:(3*6*7), dim = c(7, 3, 6), dimnames=list(as.character(1:7), NULL, as.character(3:8)))


  expect_error(procrustes(b), NA)
  expect_equal(procrustes(a), procrustes(b))


})



