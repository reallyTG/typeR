test_that("decomposition is correct with rsimple implementatation",{
  
  # Make some data
  N <- 3
  nrow <- c(10,10,10)
  ncol <- 10
  s <- 1:N
  D <- lapply(s, function(x) {matrix(rnorm(n=nrow[x]*ncol,mean = 0, sd =10),nrow[x],ncol)})
  rm(nrow, ncol, s)
  
  # Decompose
  res <- hogsvd(D, method = 'rsimple')
  
  # Reconstruct
  D.reconstruct <- lapply(1:N, function(n) { res$U[[n]] %*% diag(res$Sigma[[n]]) %*% t(res$V) })
  
  # Test 
  expect_true(all(unlist(lapply(1:N, function(n) { max(D[[n]] - res$U[[n]] %*% diag(res$Sigma[[n]]) %*% t(res$V)) })) < 1.e-10))
})

test_that("decomposition is correct with arma implementatation",{
  # Make some data
  N <- 3
  nrow <- c(10,10,10)
  ncol <- 10
  s <- 1:N
  D <- lapply(s, function(x) {matrix(rnorm(n=nrow[x]*ncol,mean = 0, sd =10),nrow[x],ncol)})
  rm(nrow, ncol, s)
  
  # Decompose
  res <- hogsvd(D, method = 'arma')
  
  # Reconstruct
  D.reconstruct <- lapply(1:N, function(n) { res$U[[n]] %*% diag(res$Sigma[[n]]) %*% t(res$V) })
  
  # Test 
  expect_true(all(unlist(lapply(1:N, function(n) { max(D[[n]] - res$U[[n]] %*% diag(res$Sigma[[n]]) %*% t(res$V)) })) < 1.e-10))
})

test_that("hogsvd will not accept non list input", {
  expect_error(hogsvd(NULL));
})

test_that("hogsvd will not accept non-matrix input", {
  D <- list('this','is','not','a',matrix());
  expect_error(hogsvd(D));
})
  
