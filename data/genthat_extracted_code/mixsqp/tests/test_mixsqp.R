context("mixsqp")

# The Rmosek package on CRAN will not work with REBayes. This function
# is used for some of the tests to check whether the correct Rmosek
# package (the one downloaded from mosek.com) is installed.
skip_if_mixkwdual_doesnt_work <- function() {
  testthat::skip_if_not_installed("REBayes")
  testthat::skip_if_not_installed("Rmosek")
  testthat::skip_if(is.element("mosek_attachbuilder",
                               getNamespaceExports("Rmosek")))
}

test_that("Version number in mixsqp with verbose = TRUE is correct",{
  data(tacks)
  out <- capture.output(mixsqp(tacks$L,tacks$w))
  x   <- unlist(strsplit(out[1]," "))[4]
  expect_equal(packageDescription("mixsqp")$Version,x)
})

test_that(paste("mix-SQP allows zero likelihoods, but reports an error",
                "when initial estimate does not satisfy L*x > 0"),{
  L <- rbind(c(1,1,0),
             c(1,1,1))
  capture.output(out <- mixsqp(L))
  expect_equal(out$status,mixsqp:::mixsqp.status.converged)
  expect_error(mixsqp(L,x0 = c(0,0,1)))
})

test_that("eps parameter automatically adjusts according to scale of L",{
  set.seed(1)
  n   <- 1000
  m   <- 10
  L   <- simulatemixdata(n,m)$L
  capture.output(out1 <- mixsqp(L))
  capture.output(out2 <- mixsqp(L/1e10))
  expect_equal(out1$x,out2$x,tolerance = 1e-8)
})

test_that(paste("mix-SQP converges to correct solution even when initial",
                "estimate is very poor"),{
  e <- 1e-8
  L <- rbind(c(1,1,e),
             c(1,2,1))
  capture.output(out1 <- mixsqp(L))
  capture.output(out2 <- mixsqp(L,x0 = c(0,0,1)))
  expect_equal(out1$value,out2$value,tol = 1e-8)

  # This second example is particularly challenging because two of the
  # columns of the likelihood matrix are identical.
  L <- rbind(c(1,1,e),
             c(1,1,1))
  capture.output(out1 <- mixsqp(L))
  capture.output(out2 <- mixsqp(L,x0 = c(0,0,1)))
  expect_equal(out1$value,out2$value,tol = 1e-8)
})

test_that(paste("mix-SQP gives correct solutions for 2 x 2 and",
                "2 x 3 likelihood matrices"),{

  # In this first example, the correct solution is (1/2,1/2).
  e <- 1e-8
  L <- rbind(c(1,e),
             c(e,1))
  capture.output(out <- mixsqp(L))
  expect_equal(out$x,c(0.5,0.5),tolerance = 1e-8)
  
  # In this second example, any solution of the form (x1,x2,0) gives
  # the same value for the objective.
  L <- rbind(c(1,1,e),
             c(1,1,1))
  capture.output(out1 <- mixsqp(L,x0 = c(1,1,0)))
  capture.output(out2 <- mixsqp(L,x0 = c(0,1,1)))
  expect_equal(out1$status,mixsqp:::mixsqp.status.converged)
  expect_equal(out2$status,mixsqp:::mixsqp.status.converged)
  expect_equal(out1$x[3],0,tolerance = 1e-8)
  expect_equal(out2$x[3],0,tolerance = 1e-8)
})

test_that(paste("mix-SQP and KWDual return the same solution for",
                "1000 x 10 likelihood matrix"),{

  # Simulate a 1,000 x 10 likelihood matrix. Note that I add row and
  # column names to the matrix to check that the column names are
  # retained in the solution vector.
  set.seed(1)
  n <- 1000
  m <- 10
  L <- simulatemixdata(n,m)$L
  rownames(L) <- paste0("x",1:n)
  colnames(L) <- paste0("s",1:m)
  
  # Apply mix-SQP solver to the data set. Check that the solution
  # entries are labeled correctly.
  capture.output(out1 <- mixsqp(L))
  expect_equal(out1$status,mixsqp:::mixsqp.status.converged)
  expect_equal(names(out1$x),colnames(L))

  # Apply KWDual solver to the data set. 
  skip_if_mixkwdual_doesnt_work()
  out2 <- mixkwdual(L)
  expect_equal(names(out2$x),colnames(L))

  # The outputted solutions, and # the objective values at those
  # solutions, should be nearly identical.
  expect_equal(out1$x,out2$x,tolerance = 1e-6)
  expect_equal(out1$value,out2$value,tolerance = 1e-8)
})

test_that(paste("mix-SQP & KWDual return the same solution for",
                "1000 x 10 likelihood matrix with unequal row weights"),{

  # The REBayes package is required to run this test.
  skip_if_mixkwdual_doesnt_work()
  
  # Simulate a 1000 x 10 likelihood matrix, and different weights for
  # the rows of this matrix.
  set.seed(1)
  L <- simulatemixdata(1000,10)$L
  w <- runif(1000)
  w <- w/sum(w)
  
  # Apply mix-SQP solver to the data set.
  capture.output(out1 <- mixsqp(L,w))
  expect_equal(out1$status,mixsqp:::mixsqp.status.converged)

  # Apply KWDual solver to the data set.
  skip_if_mixkwdual_doesnt_work()
  out2 <- mixkwdual(L,w)
  
  # The outputted solutions, and the objective values at those
  # solutions, should be nearly identical.
  expect_equal(out1$x,out2$x,tolerance = 2e-8)
  expect_equal(out1$value,out2$value,tolerance = 2e-8)
})

test_that(paste("mix-SQP returns the same solution regardless whether",
                "the likelihood matrix is normalized"),{
  
  # Simulate two 100 x 10 likelihood matrices---one normalized and one
  # unnormalized---and different weights for the rows of this matrix.
  set.seed(1)
  L1 <- simulatemixdata(100,10,normalize.rows = TRUE)$L
  set.seed(1)
  L2 <- simulatemixdata(100,10,normalize.rows = FALSE)$L
  w  <- runif(100)
  w  <- w/sum(w)

  # Apply mix-SQP to normalized and unnormalized data sets.
  capture.output(out1 <- mixsqp(L1,w,control = list(eps = 0)))
  capture.output(out2 <- mixsqp(L2,w,control = list(eps = 0)))

  # The outputted solutions should be nearly identical (although the
  # values of the objectives will be different).
  expect_equal(out1$status,mixsqp:::mixsqp.status.converged)
  expect_equal(out2$status,mixsqp:::mixsqp.status.converged)
  expect_equal(out1$x,out2$x,tolerance = 1e-8)
})
                    
test_that(paste("mix-SQP gives correct solution for Beckett & Diaconis",
                "tack rolling example"),{
  data(tacks)
  L <- tacks$L
  w <- tacks$w
  capture.output(out <- mixsqp(L,w,control = list(eps = 0)))

  # The mix-SQP solution should be very close to the KWDual solution
  # and, more importantly, the quality of the mix-SQP solution should
  # be as good or greater.
  expect_equal(out$status,mixsqp:::mixsqp.status.converged)
  expect_equal(tacks$x,out$x,tolerance = 5e-4)
  expect_lte(out$value,mixobjective(L,tacks$x,w))
})

# This is mainly to test post-processing of the output when the
# algorithm reaches the maximum number of iterations. This example is
# used in one of the other tests above.
test_that("mix-SQP does not report an error with convergence failure",{
  e <- 1e-8
  L <- rbind(c(1,1,e),
             c(1,1,1))
  capture_output(out <- mixsqp(L,x0 = c(0,1,1),
                               control = list(maxiter.sqp = 3)))
  expect_equal(out$status,mixsqp.status.didnotconverge)
  expect_equal(dim(out$progress),c(3,7))
})

# This test comes from Issue #3.
test_that(paste("mix-SQP gives correct solution for \"short and fat\" matrix,",
                "even when linear systems in active-set method are not",
                "necessarily s.p.d."),{
  set.seed(1)
  L    <- matrix(rgamma(1000,1,1),nrow = 10)
  capture.output(out1 <- mixsqp(L))
  capture.output(out2 <- mixsqp(L,control = list(eps = 0,delta = 0)))
  expect_equal(out1$status,mixsqp:::mixsqp.status.converged)
  expect_equal(out2$status,mixsqp:::mixsqp.status.converged)

  # The mix-SQP solution should be very close to the KWDual solution
  # and, more importantly, the quality of the mix-SQP solution should
  # be very similar, even when the Newton search direction in the
  # active-set method is not necessarily unique (i.e., the Hessian is
  # not s.p.d.).
  skip_if_mixkwdual_doesnt_work()
  out3 <- mixkwdual(L)
  expect_equal(out1$x,out3$x,tolerance = 1e-8)
  expect_equal(out2$x,out3$x,tolerance = 1e-8)
  expect_equal(out1$value,out3$value,tolerance = 1e-8)
  expect_equal(out2$value,out3$value,tolerance = 1e-8)
})

# This test comes from Issue #5.
test_that(paste("mix-SQP converges, and outputs correct solution, for example",
                "in which the \"dual residual\" never reaches exactly zero"),{

  # Generate the data set for testing.
  set.seed(1)
  n <- 1e5
  m <- 12
  L <- simulatemixdata(n,m)$L

  # Here we also check convergence for the case when no numerical
  # stability measure is used for the active-set linear systems (i.e.,
  # eps = 0, delta = 0). Also, when convtol.sqp = 0, the mix-SQP
  # algorithm should report that it failed to converge in this
  # example.
  capture.output(out1 <- mixsqp(L,control = list(eps = 0,convtol.sqp = 0,
                                                 maxiter.sqp = 10)))
  capture.output(out2 <- mixsqp(L))
  capture.output(out3 <- mixsqp(L,control = list(eps = 0,delta = 0)))
  expect_equal(out1$status,"exceeded maximum number of iterations")
  expect_equal(out2$status,mixsqp:::mixsqp.status.converged)
  expect_equal(out3$status,mixsqp:::mixsqp.status.converged)
  
  # When the mix-SQP iterates converge, they should be very close to
  # the KWDual solution.
  skip_if_mixkwdual_doesnt_work()
  out4 <- mixkwdual(L)
  expect_equal(out2$x,out4$x,tolerance = 1e-7)
  expect_equal(out3$x,out4$x,tolerance = 1e-7)
  expect_equal(out2$value,out4$value,tolerance = 1e-8)
  expect_equal(out3$value,out4$value,tolerance = 1e-8)
})

test_that(paste("Case is properly handled in which all columns except",
                "one are filled with zeros"),{
  set.seed(1)
  n       <- 200
  m       <- 10
  i       <- 7
  L       <- simulatemixdata(n,m)$L
  L[,-i]  <- 0
  xsol    <- rep(0,m)
  xsol[i] <- 1
  expect_warning(capture.output(out1 <- mixsqp(L)))
  expect_equal(out1$status,mixsqp:::mixsqp.status.didnotrun)
  expect_null(out1$progress)
  expect_equal(out1$x,xsol)

  skip_if_mixkwdual_doesnt_work()
  expect_warning(capture.output(out2 <- mixkwdual(L)))
  expect_equal(out2$x,xsol)
})

test_that("Case is properly handled in which one column of L is all zeros",{
  set.seed(1)
  n <- 200
  m <- 10
  i <- 7
  L <- simulatemixdata(n,m)$L

  # Run the mix-SQP algorithm when all columns have nonzeros.
  L[,i] <- 1e-8
  capture.output(out1 <- mixsqp(L))

  # Set one of the columns to be all zeros, and re-run the mix-SQP
  # algorithm.
  L[,i] <- 0
  expect_warning(capture.output(out2 <- mixsqp(L)))

  # The two solutions should be pretty much the same.
  expect_equal(out1$x,out2$x,tolerance = 1e-8)
  expect_equal(out1$value,out2$value,tolerance = 1e-8)

  # Also check KWDual solution.
  skip_if_mixkwdual_doesnt_work()
  expect_warning(out3 <- mixkwdual(L))
  expect_equal(out1$x,out3$x,tolerance = 1e-6)
  expect_equal(out1$value,out3$value,tolerance = 1e-6)
})

test_that("Case is properly handled when L has only one column",{
  set.seed(1)
  L    <- matrix(runif(100))
  suppressWarnings(out1 <- mixsqp(L))
  suppressWarnings(out2 <- mixkwdual(L))
  expect_equal(out1$x,1)
  expect_equal(out2$x,1)
  expect_equal(out1$value,out2$value)
})

test_that(paste("mix-SQP converges to solution for \"flat\" objective even",
                "if initial progress is poor"),{
  set.seed(1)
  n   <- 10000
  m   <- 20
  L   <- matrix(runif(n*m),n,m)
  out <- mixsqp(L)
  expect_equal(out$status,mixsqp:::mixsqp.status.converged)
})

# This test comes from Issue #19.
test_that("mix-SQP converges (sometimes) in a more difficult example",{
  load("flashr.example.RData")
  capture.output(out1 <- mixsqp(L))
  expect_equal(out1$status,mixsqp:::mixsqp.status.converged)
  skip_if_mixkwdual_doesnt_work()
  out2 <- mixkwdual(L)
  expect_equal(out1$x,out2$x,tolerance = 1e-8)
})
