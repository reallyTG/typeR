context("Testing") 

f.test.pval = function(pval) {
  out = pval >= 0 && pval <= 1
  return(out)
}

data('hfdata')
N = dim(hfdata)[2]

x = hfdata[,1]
y = hfdata[,2]

test_that("Sharpe and modified Sharpe", { 
  tmp = sharpe(hfdata)
  expect_true(is.vector(tmp))
  expect_true(length(tmp) == N)
  
  tmp = msharpe(hfdata)
  expect_true(is.vector(tmp))
  expect_true(length(tmp) == N)
}) 

test_that("Sharpe testing", { 
  tmp = sharpeTesting(x, y, control = list())
  expect_true(f.test.pval(tmp$pval))
  set.seed(123)
  tmp = sharpeTesting(x, y, control = list(type = 2))
  expect_true(f.test.pval(tmp$pval))
  tmp = sharpeTesting(x, y, control = list(ttype = 1))
  expect_true(f.test.pval(tmp$pval))
  tmp = sharpeTesting(x, y, control = list(hac = TRUE))
  expect_true(f.test.pval(tmp$pval))
  tmp = sharpeTesting(x, y, control = list(type  = 2, pBoot = 2))
  expect_true(f.test.pval(tmp$pval))
})

test_that("Modified Sharpe testing", { 
  tmp = msharpeTesting(x, y, control = list())
  expect_true(f.test.pval(tmp$pval))
  set.seed(123)
  tmp = msharpeTesting(x, y, control = list(type = 2))
  expect_true(f.test.pval(tmp$pval))
  tmp = msharpeTesting(x, y, control = list(ttype = 1))
  expect_true(f.test.pval(tmp$pval))
  tmp = msharpeTesting(x, y, control = list(hac = TRUE))
  expect_true(f.test.pval(tmp$pval))
  tmp = msharpeTesting(x, y, control = list(type  = 2, pBoot = 2))
  expect_true(f.test.pval(tmp$pval))
})
