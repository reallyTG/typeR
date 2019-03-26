context("Penalty matrices")


test_that("Penalty matrix for Lasso", {
  expect_equal(.pen.mat.lasso(5), 
               diag(5))
})


test_that("Penalty matrix for Group Lasso", {
  expect_equal(.pen.mat.grouplasso(6), 
               diag(6))
})


test_that("Penalty matrix for Fused Lasso", {
  expect_equal(.pen.mat.flasso(4), 
               rbind(c(1, 0, 0, 0), c(-1, 1, 0, 0), c(0, -1, 1, 0), c(0, 0, -1, 1)))
  
  # With changed reference category
  expect_equal(.pen.mat.flasso(4, refcat = 3), 
               rbind(c(-1, 1, 0, 0), c(0, -1, 0, 0), c(0, 0, 1, 0), c(0, 0, -1, 1)))
})


test_that("Penalty matrix for Generalized Fused Lasso", {
  # With reference category
  a <- .pen.mat.gflasso(4)
  # Remove dimension names
  dimnames(a) <- NULL
  expect_equal(a, 
               rbind(c(1, 0, 0, 0), c(-1, 1, 0, 0), c(0, -1, 1, 0), c(0, 0, -1, 1),
                     c(0, 1, 0, 0), c(-1, 0, 1, 0), c(0, -1, 0, 1),
                     c(0, 0, 1, 0), c(-1, 0, 0, 1), c(0, 0, 0, 1)))
  
  # Without reference category
  b <- .pen.mat.gflasso(4, refcat = FALSE)
  # Remove dimension names
  dimnames(b) <- NULL
  expect_equal(b, 
               rbind(c(-1, 1, 0, 0), c(0, -1, 1, 0), c(0, 0, -1, 1),
                     c(-1, 0, 1, 0), c(0, -1, 0, 1), c(-1, 0, 0, 1)))
})


test_that("Penalty matrix for 2D Fused Lasso", {
  expect_equal(.pen.mat.2dflasso(3, 2),
               rbind(c(1, 0, 0, 0, 0, 0), c(-1, 1, 0, 0, 0, 0), 
                     c(-1, 0, 0, 1, 0, 0), c(0, 1, 0, 0, 0, 0),
                     c(0, -1, 1, 0, 0, 0), c(0, -1, 0, 0, 1, 0),
                     c(0, 0, 1, 0, 0, 0), c(0, 0, -1, 0, 0, 1), 
                     c(0, 0, 0, 1, 0, 0), c(0, 0, 0, -1, 1, 0), c(0, 0, 0, 0, -1, 1)))
})


test_that("Penalty matrix for Graph-Guided Fused Lasso", {

  # Adjacency matrix
  adj <- matrix(0, 10, 10)
  adj[1, 2] <- adj[2, 1] <- 1
  adj[2, 3] <- adj[3, 2] <- 1 
  adj[2, 5] <- adj[5, 2] <- 1 
  adj[1, 3] <- adj[3, 1] <- 1
  adj[6, 7] <- adj[7, 6] <- 1
  
  # Expected penalty matrix
  pen.exp <- matrix(0, 5, 9)
  pen.exp[1, 1] <- 1
  pen.exp[2, 2] <- 1
  pen.exp[3, 1] <- -1; pen.exp[3, 2] <- 1
  pen.exp[4, 1] <- -1; pen.exp[4, 4] <- 1
  pen.exp[5, 5] <- -1; pen.exp[5, 6] <- 1
  
  expect_equal(.pen.mat.ggflasso(adj), 
               pen.exp)
  
  
  # Now with different reference category
  pen.exp2 <- matrix(0, 5, 9)
  pen.exp2[1, 2] <- 1
  pen.exp2[2, 1] <- -1; pen.exp2[2, 2] <- 1
  pen.exp2[3, 1] <- -1; pen.exp2[3, 3] <- 1
  pen.exp2[4, 2] <- -1; pen.exp2[4, 3] <- 1
  pen.exp2[5, 5] <- -1; pen.exp2[5, 6] <- 1
  
  expect_equal(.pen.mat.ggflasso(adj, refcat = 5), 
               pen.exp2)
})



