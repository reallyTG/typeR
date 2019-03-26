# Test that result when x1=0 and x2=0 are sensible

library(exact2x2)
context("Testing x1=0 and x2=0")

test_that("x=(0,0) gives pvalue=1 parmtype='ratio' ",{
  expect_equal(uncondExact2x2(0,21,0,37, parmtype="ratio")$p.value, 1)
  expect_equal(uncondExact2x2(0,21,0,37, parmtype="ratio", alternative="less")$p.value, 1)
  expect_equal(uncondExact2x2(0,21,0,37, parmtype="ratio", alternative="greater")$p.value, 1)
})



test_that("x=(0,0) gives CI=(0,Inf) parmtype='ratio' ",{
  expect_equivalent(uncondExact2x2(0,21,0,37, conf.int=TRUE, parmtype="ratio")$conf.int, c(0,Inf))
  expect_equivalent(uncondExact2x2(0,21,0,37, conf.int=TRUE, parmtype="ratio",alternative="less")$conf.int, c(0,Inf))
  expect_equivalent(uncondExact2x2(0,21,0,37, conf.int=TRUE, parmtype="ratio", alternative="greater")$conf.int, c(0,Inf))
})


test_that("x=(0,0) gives pvalue=1 parmtype='oddsratio' ",{
  expect_equal(uncondExact2x2(0,21,0,37, parmtype="oddsratio")$p.value, 1)
  expect_equal(uncondExact2x2(0,21,0,37, parmtype="oddsratio", alternative="less")$p.value, 1)
  expect_equal(uncondExact2x2(0,21,0,37, parmtype="oddsratio", alternative="greater")$p.value, 1)
})



test_that("x=(0,0) gives CI=(0,Inf) parmtype='oddsratio' ",{
  expect_equivalent(uncondExact2x2(0,21,0,37, conf.int=TRUE, parmtype="oddsratio")$conf.int, c(0,Inf))
  expect_equivalent(uncondExact2x2(0,21,0,37, conf.int=TRUE, parmtype="oddsratio",alternative="less")$conf.int, c(0,Inf))
  expect_equivalent(uncondExact2x2(0,21,0,37, conf.int=TRUE, parmtype="oddsratio", alternative="greater")$conf.int, c(0,Inf))
})


context("Testing x1=n1 and x2=n2")

test_that("x=(n1,n2) gives pvalue=1 parmtype='oddsratio' ",{
  expect_equal(uncondExact2x2(21,21,37,37, parmtype="oddsratio")$p.value, 1)
  expect_equal(uncondExact2x2(21,21,37,37, parmtype="oddsratio", alternative="less")$p.value, 1)
  expect_equal(uncondExact2x2(21,21,37,37, parmtype="oddsratio", alternative="greater")$p.value, 1)
})



test_that("x=(n1,n2) gives CI=(0,Inf) parmtype='oddsratio' ",{
  expect_equivalent(uncondExact2x2(21,21,37,37, conf.int=TRUE, parmtype="oddsratio")$conf.int, c(0,Inf))
  expect_equivalent(uncondExact2x2(21,21,37,37, conf.int=TRUE, parmtype="oddsratio",alternative="less")$conf.int, c(0,Inf))
  expect_equivalent(uncondExact2x2(21,21,37,37, conf.int=TRUE, parmtype="oddsratio", alternative="greater")$conf.int, c(0,Inf))
})

