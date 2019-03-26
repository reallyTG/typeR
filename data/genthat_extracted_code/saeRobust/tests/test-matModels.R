context("Model Variance Structures")

test_that("FH", {

  expectEqual <- function(a, b) {
    testthat::expect_equal(a, b)
  }

  matV <- matVFH(0.5, c(1, 1))

  expectEqual(Diagonal(x = 1 / (0.5 + c(1, 1))), matV$VInv())

})

test_that("SFH", {

  expectEqual <- function(a, b) {
    testthat::expect_equal(a, b, check.attributes = FALSE)
  }

  W <- spdep::nb2mat(spdep::cell2nb(3, 1, "rook"), style = "W")

  matV <- matVSFH(0.5, 0.5, W, c(1, 1, 1))
  Omega1 <- Matrix(
    solve(t(diag(3) - 0.5 * W) %*% (diag(3) - 0.5 * W)),
    forceCheck = TRUE
  )

  expectEqual(
    matV$VInv(),
    as.matrix(solve(0.5 * Omega1 + Diagonal(3)))
  )

  expectEqual(
    as.matrix(matV$deriv$rho()),
    as.matrix(- 0.5 * Omega1 %*% (- W - t(W) + 2 * 0.5 * t(W) %*% W) %*% Omega1)
  )

  expectEqual(
    as.matrix(matV$deriv$sigma2()),
    as.matrix(Omega1)
  )

})

test_that("TFH", {

  expectEqual <- function(a, b) {
    testthat::expect_equal(a, b, check.attributes = FALSE)
  }

  nTime <- 3
  nDomains <- 3
  sige <- 1
  sigv <- c(2, 5)
  rho <- 0.2

  matV <- matVTFH(rho, sigv, nTime, rep(sige, nTime * nDomains))
  Omega2 <- saeRobust:::matOmega2(nTime, rho)
  Omega2Ref <- 1 / (1-rho^2) *
    matrix(c(1, rho, rho^2, rho, 1, rho, rho^2, rho, 1),
           ncol = nTime)

  expectEqual(Omega2, Omega2Ref)
  expectEqual(Omega2, matV$Omega2())

  expectEqual(
    dim(matV$VInv()),
    c(9, 9)
  )

  Z <- matTZ(nDomains, nTime)
  Vu <- bdiag(Diagonal(nDomains, sigv[1]),
              sigv[2] * matBlockDiagonal(Omega2, nDomains))

  expectEqual(
    as.matrix(solve(Z %*% Vu %*% t(Z) + Diagonal(nTime * nDomains, sige))),
    matV$VInv()
  )

  expectEqual(
    as.matrix(Z %*% Vu %*% t(Z) + Diagonal(nTime * nDomains, sige)),
    matV$V()
  )

  expectEqual(
    as.matrix(matV$deriv$sigma21()),
    as.matrix(matTZ1(3, 3)) %*% as.matrix(Diagonal(3)) %*% as.matrix(t(matTZ1(3, 3)))
  )

  expectEqual(
    as.matrix(matV$deriv$rho()),
    saeRobust:::matVDerR2(rho, sigv[2], Omega2, nTime)
  )

  expectEqual(
    as.matrix(matV$deriv$sigma22()),
    saeRobust:::matVDerS2(Omega2, 3)
  )

  expectEqual(
    matV$deriv$rho()[1:3, 1:3],
    sigv[2] * (1 / (1 - rho^2) *
                 matrix(c(0, 1, 2 * rho, 1, 0, 1, 2 * rho, 1, 0), ncol = 3) +
           2 * rho / (1 - rho^2) * matV$Omega2())
  )

})

test_that("TFH", {

  expectEqual <- function(a, b) {
    testthat::expect_equal(a, b, check.attributes = FALSE)
  }

  nTime <- 3
  nDomains <- 3
  sige <- 1
  sigv <- c(2, 5)
  rho <- c(0.5, 0.2)

  W <- spdep::nb2mat(spdep::cell2nb(nDomains, 1, "rook"), style = "W")

  matV <- matVSTFH(rho, sigv, W, nTime, rep(sige, nTime * nDomains))
  Omega2 <- saeRobust:::matOmega2(nTime, rho[2])

  expectEqual(Omega2, matV$Omega2())

  expectEqual(
    dim(matV$VInv()),
    c(9, 9)
  )

  Z <- matTZ(nDomains, nTime)
  Vu <- Matrix::bdiag(sigv[1] * saeRobust:::matOmega1(W, rho[1]),
                      sigv[2] * saeRobust:::matBlockDiagonal(Omega2, nDomains))

  expectEqual(
    as.matrix(solve(Z %*% Vu %*% t(Z) + Diagonal(nTime * nDomains, sige))),
    matV$VInv()
  )

  expectEqual(
    as.matrix(Z %*% Vu %*% t(Z) + Diagonal(nTime * nDomains, sige)),
    matV$V()
  )

  expectEqual(
    as.matrix(matV$deriv$sigma21()),
    as.matrix(matTZ1(3, 3)) %*% as.matrix(matV$Omega1()) %*% as.matrix(t(matTZ1(3, 3)))
  )

  expectEqual(
    as.matrix(matV$deriv$rho1()),
    saeRobust:::matVDerR1(rho[1], sigv[1], as.matrix(matTZ1(nDomains, nTime)), as.matrix(matV$Omega1()), W)
  )

  expectEqual(
    as.matrix(matV$deriv$rho2()),
    saeRobust:::matVDerR2(rho[2], sigv[2], Omega2, nTime)
  )

  expectEqual(
    as.matrix(matV$deriv$sigma22()),
    saeRobust:::matVDerS2(Omega2, 3)
  )

  expectEqual(
    matV$deriv$rho2()[1:3, 1:3],
    sigv[2] * (1 / (1 - rho[2]^2) *
                 matrix(c(0, 1, 2 * rho[2], 1, 0, 1, 2 * rho[2], 1, 0), ncol = 3) +
                 2 * rho[2] / (1 - rho[2]^2) * matV$Omega2())
  )

})

