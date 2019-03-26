library(serrsBayes)
context("Utility functions common to both Voigt and Gaussian/Lorentzian API")

test_that("sumDnorm matches the equivalent R function sum(dnorm(..))", {
  x <- rnorm(100)
  mu <- rep(0,length(x))
  sd <- rep(1,length(x))
  expect_equal(sumDnorm(x,mu,sd), sum(dnorm(x, mu, sd, log=TRUE)))

  mu <- seq(-5,6,by=0.5)
  sd <- seq(0.1,2.3,by=0.1)
  x <- rnorm(length(mu), mu, sd)
  expect_equal(sumDnorm(x,mu,sd), sum(dnorm(x, mu, sd, log=TRUE)))
})

test_that("sumDlogNorm matches the equivalent R function sum(dlnorm(..))", {
  x <- rlnorm(100)
  expect_equal(sumDlogNorm(x,0,1), sum(dlnorm(x, log=TRUE)))
})

test_that("computeLogLikelihood for a single observation", {
  Cal_V <- seq(700,1400,by=2)
  N_WN_Cal <- length(Cal_V)
  true.bl <- 1000*cos(Cal_V/200) + 2*Cal_V
  true.sd <- 50
  Obsi <- true.bl + rnorm(N_WN_Cal, sd=true.sd)
  
  Knots<-seq(min(Cal_V), max(Cal_V), length.out=71)
  r <- max(diff(Knots))
  NK<-length(Knots)
  X_Cal <- splines::bs(Cal_V, knots=Knots, Boundary.knots = range(Knots) + c(-r,+r))
  class(X_Cal) <- "matrix"
  XtX <- Matrix(crossprod(X_Cal), sparse=TRUE)
  NB_Cal<-ncol(X_Cal)
  FD2_Cal <- diff(diff(diag(NB_Cal))) # second derivatives of the spline coefficients
  Pre_Cal <- Matrix(crossprod(FD2_Cal), sparse=TRUE)
  
  # Demmler-Reinsch orthogonalisation
  lPriors <- list()
  R = chol(XtX + Pre_Cal*1e-9) # just in case XtX is ill-conditioned
  Rinv <- solve(R)
  Rsvd <- svd(crossprod(Rinv, Pre_Cal %*% Rinv))
  Ru <- Rinv %*% Rsvd$u
  A <- X_Cal %*% Rinv %*% Rsvd$u
  lPriors$bl.basis <- X_Cal
  lPriors$bl.precision <- as(Pre_Cal, "dgCMatrix")
  lPriors$bl.XtX <- as(XtX, "dgCMatrix")
  lPriors$bl.orthog <- as.matrix(A)
  lPriors$bl.Ru <- as.matrix(Ru)
  lPriors$bl.eigen <- Rsvd$d
  lPriors$noise.nu <- 5
  lPriors$noise.sd <- true.sd
  lPriors$noise.SS <- lPriors$noise.nu * lPriors$noise.sd^2
  a0_Cal <- lPriors$noise.nu/2.0;
  ai_Cal <- a0_Cal + N_WN_Cal/2.0;
  b0_Cal <- lPriors$noise.SS/2.0;

  lambda <- 10
  g0_Cal <- N_WN_Cal * lambda * Pre_Cal
  gi_Cal <- XtX + g0_Cal
  b <- as.vector(crossprod(A, Obsi))
  bRatio <- b/(1 + N_WN_Cal*lambda*Rsvd$d)
  mi_New <- as.vector(Ru %*% bRatio)
  bi_Cal <- b0_Cal + 0.5*(t(Obsi)%*%Obsi-t(mi_New)%*%gi_Cal%*%mi_New)[1,1]

  L_Ev <- -(N_WN_Cal/2)*log(2*pi)+0.5*determinant(g0_Cal)$modulus[1] -
    0.5*determinant(gi_Cal)$modulus[1]+a0_Cal*log(b0_Cal)-ai_Cal*log(bi_Cal) +
    lgamma(ai_Cal)-lgamma(a0_Cal)
  expect_equal(computeLogLikelihood(Obsi, lambda, lPriors$noise.nu, lPriors$noise.SS,
                                    X_Cal, Rsvd$d, lPriors$bl.precision, lPriors$bl.XtX,
                                    lPriors$bl.orthog, lPriors$bl.Ru), L_Ev, tolerance=10)
})

test_that("computeLogLikelihood using Jake's code", {
  Cal_V <- seq(700,1400,by=2)
  N_WN_Cal <- length(Cal_V)
  true.bl <- 1000*cos(Cal_V/200) + 2*Cal_V
  true.sd <- 50
  Obsi <- true.bl + rnorm(N_WN_Cal, sd=true.sd)
  
  Knots<-seq(min(Cal_V), max(Cal_V), length.out=71)
  r <- max(diff(Knots))
  NK<-length(Knots)
  X_Cal <- splines::bs(Cal_V, knots=Knots, Boundary.knots = range(Knots) + c(-r,+r))
  class(X_Cal) <- "matrix"
  XtX <- Matrix(crossprod(X_Cal), sparse=TRUE)
  NB_Cal<-ncol(X_Cal)
  FD2_Cal <- diff(diff(diag(NB_Cal))) # second derivatives of the spline coefficients
  Pre_Cal <- Matrix(crossprod(FD2_Cal), sparse=TRUE)
  
  # Demmler-Reinsch orthogonalisation
  lPriors <- list()
  R = chol(XtX + Pre_Cal*1e-9) # just in case XtX is ill-conditioned
  Rinv <- solve(R)
  Rsvd <- svd(crossprod(Rinv, Pre_Cal %*% Rinv))
  Ru <- Rinv %*% Rsvd$u
  A <- X_Cal %*% Rinv %*% Rsvd$u
  lPriors$bl.basis <- X_Cal
  lPriors$bl.precision <- as(Pre_Cal, "dgCMatrix")
  lPriors$bl.XtX <- as(XtX, "dgCMatrix")
  lPriors$bl.orthog <- as.matrix(A)
  lPriors$bl.Ru <- as.matrix(Ru)
  lPriors$bl.eigen <- Rsvd$d
  lPriors$noise.nu <- 5
  lPriors$noise.sd <- true.sd
  lPriors$noise.SS <- lPriors$noise.nu * lPriors$noise.sd^2
  a0_Cal <- lPriors$noise.nu/2.0;
  ai_Cal <- a0_Cal + N_WN_Cal/2.0;
  b0_Cal <- lPriors$noise.SS/2.0;
  
  lambda <- 10
  Pen_Cal <- lambda * N_WN_Cal
  g0_Cal <- Pen_Cal * Pre_Cal
  gi_Cal <- XtX + g0_Cal
  tX_Cal<-t(X_Cal)
  Sgi_Cal<-solve(gi_Cal,sparse=T)
  mi_Cal<-Sgi_Cal%*%(tX_Cal%*%Obsi)[,1]
  bi_Cal<-b0_Cal+0.5*(t(Obsi)%*%Obsi-t(mi_Cal)%*%gi_Cal%*%mi_Cal)[1,1]
  
  L_Ev <- -(N_WN_Cal/2)*log(2*pi)+0.5*determinant(g0_Cal)$modulus[1]-0.5*determinant(gi_Cal)$modulus[1]+a0_Cal*log(b0_Cal)-ai_Cal*log(bi_Cal)+lgamma(ai_Cal)-lgamma(a0_Cal)
  expect_equal(computeLogLikelihood(Obsi, lambda, lPriors$noise.nu, lPriors$noise.SS,
                                    X_Cal, Rsvd$d, lPriors$bl.precision, lPriors$bl.XtX,
                                    lPriors$bl.orthog, lPriors$bl.Ru), L_Ev, tolerance=200)
})

