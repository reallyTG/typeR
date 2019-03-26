context("Test PO and penalty functions")

test_that("Test ADMM", {
  
  # Penalty types
  pen.cov <- c("none", "flasso", "gflasso")
  # Value of coefficients to compute proximal operator for
  beta.tilde <- c(runif(1), runif(10), runif(24))
  # Previous coefficient values
  beta.old <- c(runif(1), runif(10), runif(24))
  # Number of parameters
  n.par.cov <- list(intercept = 1, age = 10, area = 24)
  # Groups of predictors (ignored here)
  group.cov <- unlist(list(intercept = 0, age = 0, area = 0))
  # lambda parameter
  lambda <- 10
  # lambda1 list
  lambda1 <- list(intercept = 0, age = 0, area = 0, lambda.orig = 0)
  # lambda2 list
  lambda2 <- list(intercept = 0, age = 0, area = 0, lambda.orig = 0)
  # Step size
  step <- 1e-5
  
  # List of penalty matrices
  pen.mat.cov <- list(intercept = as.matrix(0), age = .pen.mat.flasso(n.par.cov[[2]], refcat = 2), 
                area = .pen.mat.ggflasso(adj.matrix = munich_adj_orig, lev.names = 1:25, refcat = 4))
  
  # Compute eigenvalue decomposition of t(pen.mat.cov[[j]]) %*% pen.mat.cov[[j]] for all penalty types
  # except "none", "lasso" and "grouplasso"
  pen.mat.cov.aux1 <- .pen.mat.eig(pen.cov = pen.cov, pen.mat = pen.mat.cov)
    
  # Run ADMM with faster version using the Woodbury matrix identity
  PO1 <- .PO(beta.tilde = beta.tilde, beta.old = beta.old, pen.cov = pen.cov, n.par.cov = n.par.cov, group.cov = group.cov, 
             pen.mat.cov = pen.mat.cov, pen.mat.cov.aux = pen.mat.cov.aux1, lambda = lambda, lambda1 = lambda1, lambda2 = lambda2, 
             step = step, po.ncores = 1)
  
  # Run ADMM without eigenvalues, hence the slower version
  pen.mat.cov.aux2 <- vector("list", length(pen.cov))
  pen.mat.cov.aux2[[2]]$Q <- as.matrix(0); pen.mat.cov.aux2[[2]]$eigval <- 0
  pen.mat.cov.aux2[[3]]$Q <- as.matrix(0); pen.mat.cov.aux2[[3]]$eigval <- 0
  PO2 <- .PO(beta.tilde = beta.tilde, beta.old = beta.old, pen.cov = pen.cov, n.par.cov = n.par.cov, group.cov = group.cov, 
             pen.mat.cov = pen.mat.cov, pen.mat.cov.aux = pen.mat.cov.aux2, lambda = lambda, lambda1 = lambda1, lambda2 = lambda2, 
             step = step, po.ncores = 1)
    
  # Expect proximal operators to be equal up to numerical precision
  expect_equal(length(PO1), length(PO2))
  expect_true(max(abs(PO1 - PO2)) < 1e-14) 
  
  
  ##############
  # Check Woodbury matrix identity
  
  # Dimension
  d <- c(1L, 10L, 24L)
  # Augmented Lagragian parameter
  rho <- sqrt(3)

  
  for (j in 2:3) {
    
    # Matrix of eigenvectors
    Q <- pen.mat.cov.aux1[[j]]$Q
    # Vector of eigenvalues
    eigval <- pen.mat.cov.aux1[[j]]$eigval
    
    # Code based on our C++ code using Woodbury matrix identity
    ADMM_aux1 <- diag(d[j]) - rho * Q %*% diag(1/(1/eigval + rho)) %*% t(Q)
    
    # Code based on our C++ code using direct inversion
    ADMM_aux2 <- solve(diag(d[j]) + rho * t(pen.mat.cov[[j]]) %*% pen.mat.cov[[j]])
    
    # Expect matrices to be equal
    expect_equal(dim(ADMM_aux1), dim(ADMM_aux2))
    expect_true(max(abs(ADMM_aux1 - ADMM_aux1)) < 1e-14) 
  }
})


test_that("Test PO and penalty functions", {
  
  # Penalty types
  pen.cov <- c("none", "flasso", "gflasso", "lasso")
  # Value of coefficients to compute proximal operator for
  beta.tilde <- c(runif(1), runif(10), runif(24), runif(20))
  # Previous coefficient values
  beta.old <- c(runif(1), runif(10), runif(24), runif(20))
  # Number of parameters
  n.par.cov <- list(intercept = 1, age = 10, area = 24, size = 20)
  # Groups of predictors
  group.cov <- unlist(list(intercept = 0, age = 0, area = 0, size = 0))
  # lambda parameter
  lambda <- 10
  # lambda1 list
  lambda1 <- list(intercept = 0, age = 0, area = 0, size = 0, lambda.orig = 0)
  # lambda2 list
  lambda2 <- list(intercept = 0, age = 0, area = 0, size = 0, lambda.orig = 0)
  # Step size
  step <- 1e-5
  
  # List of penalty matrices
  pen.mat.cov <- list(intercept = as.matrix(0), age = .pen.mat.flasso(n.par.cov[[2]], refcat = 2), 
                area = .pen.mat.ggflasso(adj.matrix = munich_adj_orig, lev.names = 1:25, refcat = 4),
                size = .pen.mat.lasso(n.par.cov[[4]]))
  
  # Compute eigenvalue decomposition of t(pen.mat.cov[[j]]) %*% pen.mat.cov[[j]] for all penalty types
  # except "none", "lasso" and "grouplasso"
  pen.mat.cov.aux1 <- .pen.mat.eig(pen.cov = pen.cov, pen.mat = pen.mat.cov)

  
  ##########
  # Proximal operator
  
  # Run PO and expect no error
  po1 <- function() {
    .PO(beta.tilde = beta.tilde, beta.old = beta.old, pen.cov = pen.cov, n.par.cov = n.par.cov, group.cov = group.cov, 
        pen.mat.cov = pen.mat.cov, pen.mat.cov.aux = pen.mat.cov.aux1, lambda = lambda, lambda1 = lambda1, lambda2 = lambda2, 
        step = step, po.ncores = 1)
  }
  
  expect_error(po1(),
               NA)
  
  
  # Compute proximal operator semi-manually (and do not use fast version!)
  beta.tilde.split <- split(beta.tilde, rep(1:length(pen.cov), n.par.cov))
  beta.old.split <- split(beta.old, rep(1:length(pen.cov), n.par.cov))
  po2.split <- beta.tilde.split
  for (j in 2:3) {
    po2.split[[j]] <- admm_po_cpp(beta_tilde = as.numeric(beta.tilde.split[[j]]),
                                  slambda = lambda * step, 
                                  lambda1 = lambda1[[j]], lambda2 = lambda2[[j]],
                                  penmat = pen.mat.cov[[j]], Q = as.matrix(0), eigval = 0, 
                                  fast = FALSE, maxiter = 1e4, rho = 1, 
                                  beta_old = beta.old.split[[j]])
  }
  po2.split[[4]] <- .PO.Lasso(beta.tilde = beta.tilde.split[[4]], slambda = step * lambda)
  names(po2.split) <- NULL
  
  # Expect semi-manual computation to give the same result as .PO function (up to numerical precision)
  expect_true(max(abs(po1() - unlist(po2.split))) < 1e-14)
  
  
  # Run PO on 2 cores and expect no error
  po2 <- function() {
    .PO(beta.tilde = beta.tilde, beta.old = beta.old, pen.cov = pen.cov, n.par.cov = n.par.cov, group.cov = group.cov, 
        pen.mat.cov = pen.mat.cov, pen.mat.cov.aux = pen.mat.cov.aux1, lambda = lambda, lambda1 = lambda1, lambda2 = lambda2, 
        step = step, po.ncores = 2L)
  }
  
  expect_error(po2(),
               NA)
  
  ##########
  # Total penalty
  
  # Run penalty with different groups and expect no error
  p1 <- function() {
    .pen.tot(beta = beta.tilde, pen.cov = pen.cov, n.par.cov = n.par.cov, group.cov = group.cov, 
             pen.mat.cov = pen.mat.cov, lambda = lambda, lambda1 = lambda1, lambda2 = lambda2) 
  }
  expect_error(p1(),
               NA)
  
  
  # Compute penalty manually
  p2 <- lambda * (sum(abs(pen.mat.cov[[2]] %*% beta.tilde.split[[2]])) + 
                  sum(abs(pen.mat.cov[[3]] %*% beta.tilde.split[[3]])) + 
                  sum(abs(beta.tilde.split[[4]])))
  
  
  # Expect manual computation to give the same result as .pen.tot function
  expect_equal(p1(), p2)
})



test_that("Test PO and penalty with different groups", {
  
  # Penalty types
  pen.cov <- c("none", "grouplasso", "grouplasso", "grouplasso")
  # Value of coefficients to compute proximal operator for
  beta.tilde <- c(runif(1), runif(10), runif(24), runif(20))
  # Previous coefficient values
  beta.old <- c(runif(1), runif(10), runif(24), runif(20))
  # Number of parameters
  n.par.cov <- list(intercept = 1, age = 10, area = 24, size = 20)
  # Groups of predictors
  group.cov <- unlist(list(intercept = 0, age = 1, area = 1, size = 0))
  # lambda parameter
  lambda <- 10
  # lambda1 list
  lambda1 <- list(intercept = 0, age = 0, area = 0, size = 0, lambda.orig = 0)
  # lambda2 list
  lambda2 <- list(intercept = 0, age = 0, area = 0, size = 0, lambda.orig = 0)
  # Step size
  step <- 1e-5
  
  # List of penalty matrices
  pen.mat.cov <- list(intercept = as.matrix(0), age = .pen.mat.grouplasso(n.par.cov[[2]]), 
                area = .pen.mat.grouplasso(n.par.cov[[3]]), size = .pen.mat.grouplasso(n.par.cov[[4]]))
  
  ##########
  # Proximal operator
  
  # Run PO with different groups and expect no error
  po1 <- function() {
    .PO(beta.tilde = beta.tilde, beta.old = beta.old, pen.cov = pen.cov, n.par.cov = n.par.cov, group.cov = group.cov, 
        pen.mat.cov = pen.mat.cov, pen.mat.cov.aux = NULL, lambda = lambda, lambda1 = lambda1, lambda2 = lambda2, 
        step = step, po.ncores = 1)
  }
  expect_error(po1(),
               NA)
  
  # Compute proximal operator semi-manually
  beta.tilde.split <- split(beta.tilde, rep(1:length(pen.cov), n.par.cov))
  po2.split <- beta.tilde.split
  norms_group1 <- sqrt(sum(c(beta.tilde.split[[2]], beta.tilde.split[[3]]) ^ 2))
  po2.split[[2]] <- .PO.GroupLasso(beta.tilde = beta.tilde.split[[2]], slambda = step * lambda, norm = norms_group1)
  po2.split[[3]] <- .PO.GroupLasso(beta.tilde = beta.tilde.split[[3]], slambda = step * lambda, norm = norms_group1)
  po2.split[[4]] <- .PO.GroupLasso(beta.tilde = beta.tilde.split[[4]], slambda = step * lambda, norm = sqrt(sum(beta.tilde.split[[4]] ^ 2)))
  names(po2.split) <- NULL
  
  # Expect semi-manual computation to give the same result as .PO function
  expect_equal(po1(), unlist(po2.split))
  
  
  ##########
  # Total penalty
  
  # Run penalty with different groups and expect no error
  p1 <- function() {
    .pen.tot(beta = beta.tilde, pen.cov = pen.cov, n.par.cov = n.par.cov, group.cov = group.cov, 
             pen.mat.cov = pen.mat.cov, lambda = lambda, lambda1 = lambda1, lambda2 = lambda2)
  }
  expect_error(p1(),
               NA)
  

  # Compute penalty manually
  p2 <- lambda * sqrt(sum(c(beta.tilde.split[[2]], beta.tilde.split[[3]]) ^ 2)) + lambda * sqrt(sum(beta.tilde.split[[4]] ^ 2))
  
  
  # Expect manual computation to give the same result as .pen.tot function
  expect_equal(p1(), p2)
})




