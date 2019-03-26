context("Test cal.margin1 ")

test_that("Test cal.margin1",{

  res <- cal.margin1(0,1)
  expect_equal(res,0)

  res <- cal.margin1(1,1)
  expect_equal(res,0)

  res <- cal.margin1(1,2)
  expect_equal(res,-0.5)

  res <- cal.margin1(1,0.5)
  expect_equal(res,1)
})

context("Test cal.margin2")

test_that("Test cal.margin2",{

  res <- cal.margin2(0,1)
  expect_equal(res,0)

  res <- cal.margin1(1,1)
  expect_equal(res,0)

  res <- cal.margin2(1,2)
  expect_equal(res,0)

  res <- cal.margin2(1,0.5)
  expect_equal(res,0)

  res <- cal.margin2(0,0.5)
  expect_equal(res,1)

  res <- cal.margin2(0,2)
  expect_equal(res,-0.5)
})


context("Test get.random.beta")

test_that("Test get.random.beta",{

  res <- get.random.beta(0,1)
  expect_type(res,"double")

})


context("Test cal.prob.AA ")

test_that("Test cal.prob.AA",{

  res <- cal.prob.AA(0)
  expect_equal(res,1)

  res <- cal.prob.AA(1)
  expect_equal(res,0)

  res <- cal.prob.AA(0.5)
  expect_equal(res,0.25)

})


context("Test cal.prob.AB ")

test_that("Test cal.prob.AB",{

  res <- cal.prob.AB(0)
  expect_equal(res,0)

  res <- cal.prob.AB(1)
  expect_equal(res,0)

  res <- cal.prob.AB(0.5)
  expect_equal(res,0.5)

})


context("Test cal.prob.BB ")

test_that("Test cal.prob.BB",{

  res <- cal.prob.BB(0)
  expect_equal(res,0)

  res <- cal.prob.BB(1)
  expect_equal(res,1)

  res <- cal.prob.BB(0.5)
  expect_equal(res,0.25)

})


context("Test do.sample.SNP")

test_that("Test do.sample.SNP",{

  res <- do.sample.SNP(0,0.5,0.5,5)
  expect_length(res,5)

})


context("Test do.create.cate")

test_that("Test do.create.cate",{

  res <- do.create.cate("M","P")
  expect_equal(res,"P_M")

})


context("Test create.outlier")

test_that("Test create.outlier",{

  X <- matrix(c(1,2,0,1,2,2,1,2,0,0,1,2,1,2,2,2),ncol=4)
  P <- c(3,1)
  O <- c(0,1)

  res <- create.outlier(X,P,O)
  expect_length(res,16)

})



context("Test cal.prob.categorical.data")

test_that("Test cal.prob.categorical.data",{

  P <- 0.5
  M <- 2
  res <- cal.prob.categorical.data(P,M)
  expect_length(res,2)

  M <- 4
  res <- cal.prob.categorical.data(P,M)
  expect_length(res,4)

  M <- 6
  res <- cal.prob.categorical.data(P,M)
  expect_length(res,6)

})



context("Test do.sample.categorical.data")

test_that("Test do.sample.categorical.data",{

  P <- c(0.5,0.5,0.5,0.5,0.5)
  M <- 2
  I <- 1
  res <- cal.prob.categorical.data(P,M)
  expect_length(res,10)

  P <- c(0.5,0.5)
  M <- 2
  I <- 1
  res <- cal.prob.categorical.data(P,M)
  expect_length(res,4)

})



context("Test generate.categorical.data")

test_that("Test generate.categorical.data",{

  P <- 2
  Fst <- 0.1
  N <- 5
  res <- generate.categorical.data(P,Fst,N)
  expect_length(res,10)

})



context("Test generate.snp")

test_that("Test generate.snp",{

  P <- 2
  Fst <- 0.1
  N <- 5
  R <- 1.0
  res <- generate.snp(P,Fst,N,R)
  expect_length(res,10)

})



context("Test generate.label")

test_that("Test generate.label",{

  P <- c(5,5)
  O <- c(0,1)
  res <- generate.label(P,O)
  expect_length(res,10)

})



context("Test rbind_bigmatrix")

test_that("Test rbind_bigmatrix",{

  X <- matrix(c(1,2,0,1,2,2,1,2,0,0,1,2,1,2,2,2),ncol=4)
  Y <- matrix(c(1,2,0,1,2,2,1,2,0,0,1,2,1,2,2,2),ncol=4)
  res <- rbind_bigmatrix(X,Y)
  expect_length(res,32)

})



context("Test cbind_bigmatrix")

test_that("Test cbind_bigmatrix",{

  X <- matrix(c(1,2,0,1,2,2,1,2,0,0,1,2,1,2,2,2),ncol=4)
  Y <- matrix(c(1,2,0,1,2,2,1,2,0,0,1,2,1,2,2,2),ncol=4)
  res <- cbind_bigmatrix(X,Y)
  expect_length(res,32)

})
