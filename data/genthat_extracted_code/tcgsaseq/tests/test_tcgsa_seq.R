library(tcgsaseq)
context("Gene Set Analysis with tcgsa_seq wrapper")

test_that("Gene sets with no genes measure trigger warnings", {
  rm(list = ls())
  n <- 200
  r <- 12
  t <- matrix(rep(1:3), 4, ncol=1, nrow=r)
  sigma <- 0.4
  b0 <- 1
  b1 <- 0 #under the null
  y.tilde <- b0 + b1*t + rnorm(r, sd = sigma)
  y <- t(matrix(rnorm(n*r, sd = sqrt(sigma*abs(y.tilde))), ncol=n, nrow=r) +
           matrix(rep(y.tilde, n), ncol=n, nrow=r))
  x <- matrix(1, ncol=1, nrow=r)
  gs <- list(nrow(y) + 1:10)
  expect_warning(tcgsa_seq(y, x, phi=t, genesets=gs,
                           Sigma_xi=matrix(1), indiv=rep(1:4, each=3), which_test="permutation",
                           which_weights="none", preprocessed=TRUE))
  expect_warning(tcgsa_seq(y, x, phi=t, genesets=gs,
                           Sigma_xi=matrix(1), indiv=rep(1:4, each=3), which_test="asymptotic",
                           which_weights="none", preprocessed=TRUE))
})

test_that("Returned as many p-values as there are genesets", {
  rm(list = ls())
  n <- 200
  r <- 12
  t <- matrix(rep(1:3), 4, ncol=1, nrow=r)
  sigma <- 0.4
  b0 <- 1
  b1 <- 0 #under the null
  y.tilde <- b0 + b1*t + rnorm(r, sd = sigma)
  y <- t(matrix(rnorm(n*r, sd = sqrt(sigma*abs(y.tilde))), ncol=n, nrow=r) +
           matrix(rep(y.tilde, n), ncol=n, nrow=r))
  x <- matrix(1, ncol=1, nrow=r)
  res <- tcgsa_seq(y=y, x=x, phi=t, genesets=list(1:10, 11:20),
                   Sigma_xi=matrix(1), indiv=rep(1:4, each=3), which_test="asymptotic",
                   which_weights="none", preprocessed=TRUE)
  expect_length(res$pvals$rawPval, n = length(res$genesets))
  expect_length(res$pvals$adjPval, n = length(res$genesets))
})


