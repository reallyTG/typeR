## ----setup1, echo=FALSE, cache=FALSE---------------------------------------
suppressPackageStartupMessages(require(Matrix))
knitr::render_sweave()
knitr::opts_chunk$set(prompt=TRUE, cache=FALSE,error=FALSE) #$
options(replace.assign=TRUE, width=77, prompt="R> ")

## ----setup2, echo=FALSE----------------------------------------------------
N <- 5
k <- 2
nv1 <- (N + 1) * k
nels1 <- nv1^2
nnz1 <- (N + 1) * k^2 + 2 * N * k^2
nnz1LT <- (N + 1) * k * (k+1)/2 + N * k^2
Q <- 1000
nv2 <- (Q+1) * k
nels2 <- nv2^2
nnz2 <- (Q+1) * k^2 + 2 * Q * k^2
nnz2LT <- (Q+1) * k * (k+1)/2 + Q * k^2
options(scipen=999)

## ----blockarrow, echo=FALSE------------------------------------------------
Mat <- as(kronecker(diag(N), matrix(1, k, k)),"sparseMatrix")
Mat <- rbind(Mat, Matrix(1, k, N*k))
Mat <- cbind(Mat, Matrix(1, k * (N+1), k))
printSpMatrix(as(Mat,"nMatrix"))

## ----banded, echo=FALSE----------------------------------------------------
Mat <- kronecker(Matrix(1, k, k), diag(N))
Mat <- rbind(Mat, Matrix(1, k, N * k))
Mat <- cbind(Mat, Matrix(1, k * (N + 1), k))
printSpMatrix(as(Mat,"nMatrix"))

## --------------------------------------------------------------------------
library("sparseHessianFD")
bd <- kronecker(diag(3), matrix(TRUE, 2, 2))
Mat <- as(bd, "nMatrix")
printSpMatrix(tril(Mat))
mc <- Matrix.to.Coord(tril(Mat))
mc

## --------------------------------------------------------------------------
pattern <- sparseMatrix(i=mc$rows, j=mc$cols)
printSpMatrix(pattern)

## ----eval=FALSE, prompt=FALSE----------------------------------------------
#  obj <- sparseHessianFD(x, fn, gr, rows, cols, ...)

## ----eval=FALSE------------------------------------------------------------
#  f <- obj$fn(x)
#  df <- obj$gr(x)
#  hess <- obj$hessian(x)
#  fngr <- obj$fngr(x)
#  fngrhs <- obj$fngrhs(x)

## ----binaryInit, tidy=FALSE------------------------------------------------
set.seed(123)
data("binary")
str(binary)
N <- length(binary[["Y"]])
k <- NROW(binary[["X"]])
T <- binary[["T"]]
nvars <- as.integer(N * k + k)
priors <- list(inv.Sigma = rWishart(1, k + 5, diag(k))[,,1],
   inv.Omega = diag(k))

## ----trueValues------------------------------------------------------------
P <- rnorm(nvars)
order.row <- FALSE
true.f <- binary.f(P, binary, priors, order.row=order.row)
true.grad <- binary.grad(P, binary, priors, order.row=order.row)
true.hess <- binary.hess(P, binary, priors, order.row=order.row)

## ----binaryRowsCols--------------------------------------------------------
pattern <- Matrix.to.Coord(tril(true.hess))
str(pattern)

## ----usingSparseHessianFD1, tidy=FALSE-------------------------------------
obj <- sparseHessianFD(P, fn=binary.f, gr=binary.grad,
   rows=pattern[["rows"]], cols=pattern[["cols"]],
   data=binary, priors=priors, order.row=order.row)
f <- obj$fn(P)
identical(f, true.f)
gr <- obj$gr(P)
identical(gr, true.grad)

## ----echo=FALSE------------------------------------------------------------
options(scipen=0)

## ----usingSparseHessianFD2-------------------------------------------------
hs <- obj$hessian(P)
mean(abs(hs-true.hess))/mean(abs(hs))

## ----tidy=FALSE------------------------------------------------------------
obj2 <- sparseHessianFD(P, fn=binary.f, gr=binary.grad,
   rows=pattern[["rows"]], cols=pattern[["cols"]],
   complex=TRUE,
   data=binary, priors=priors, order.row=order.row)
hs2 <- obj2$hessian(P)
mean(abs(hs2-true.hess))/mean(abs(hs2))

## ----echo=FALSE------------------------------------------------------------
options(scipen=999)

## ----echo=FALSE------------------------------------------------------------
suppressMessages(library(xtable))
suppressMessages(library(dplyr))
load("vignette_tab4.Rdata")

## ----results='asis',echo=FALSE---------------------------------------------
arrange(tab4, M) %>%
xtable(digits=c(rep(0,4),rep(1,8))) %>%
    print(only.contents=TRUE, comment=FALSE, booktabs=TRUE,
      include.rownames=FALSE, include.colnames=FALSE)

