context("linear algebra")
A <- sparseMatrix(i=c(1,1,2,2),j=c(1,2,1,2),x=c(0.1,0.2,0.2,1))
Asym <- as(A, "symmetricMatrix")
Aspam <- as.spam.dgCMatrix(A)
X <- cholPermute(A)
Xsym <- cholPermute(Asym)
Xspam <- cholPermute(Aspam)
y <- matrix(c(1,2),2,1)
b <- y %*% t(y)

test_that("cholsolve works as expected", {
    expect_identical(cholPermute(A)$Qpermchol, t(chol(A)))
})

test_that("other linalg functions", {
  expect_equal(Takahashi_Davis(A),solve(A))
  expect_equal(Takahashi_Davis(Asym),solve(A))
  expect_equal(Takahashi_Davis(Aspam),solve(A))
  expect_equal(Takahashi_Davis(A),
               Takahashi_Davis(A,cholQp = X$Qpermchol, P = X$P))
  expect_equal(Takahashi_Davis(Asym),
               Takahashi_Davis(Asym,cholQp = Xsym$Qpermchol,
                               P = Xsym$P))
  expect_equal(as.numeric(cholsolveAQinvAT(A, b,X$Qpermchol,X$P)),
               as.numeric(b  %*% solve(A) %*% t(b)))
  expect_equal(as.numeric(cholsolveAQinvAT(A, b)),
               as.numeric(b  %*% solve(A) %*% t(b)))
  expect_is(Takahashi_Davis(A),"dgCMatrix")
  expect_is(Takahashi_Davis(Asym),"dgCMatrix")
  expect_is(Takahashi_Davis(Aspam),"dgCMatrix")
  expect_is(.amd_test(),"list")
  expect_equal(cholsolve(A,b),solve(A) %*% b)
  expect_equal(cholsolve(A,b,perm = T),solve(A) %*% b)
  expect_equal(cholsolve(A,b,perm = T,cholQp = X$Qpermchol,P = X$P),solve(A) %*% b)
  expect_equal(cholsolve(Asym,b),solve(A) %*% b)
  expect_equal(cholsolve(Asym,b,perm = T),solve(A) %*% b)
  expect_equal(cholsolve(Asym,b,perm = T,cholQp = Xsym$Qpermchol,
                         P = Xsym$P),solve(A) %*% b)
})
