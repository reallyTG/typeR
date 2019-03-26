x = c(1, 1, 1, 1, 2, 3, 4, 5, 6)
grp = as.factor(c('A','A','B','B','B','D','D','D','D'))
df = data.frame(x = x, grp = grp)

context("Function for Calculating the Kruskal-Wallis Test with Pseudo-Ranks")

pvalueF = 0.03567399334725241
pvalueT = 0.03444397966139712

test_that("function hettmansperger_norton_test", {
  expect_equivalent(pseudorank::kruskal_wallis_test(x,grp,na.rm=FALSE,pseudoranks=FALSE)$pValue, pvalueF, tolerance=1e-4)
  expect_equivalent(pseudorank::kruskal_wallis_test(x,grp,na.rm=FALSE,pseudoranks=TRUE)$pValue, pvalueT, tolerance=1e-4)
  expect_equivalent(pseudorank::kruskal_wallis_test(x~grp,data=df,na.rm=FALSE,pseudoranks=FALSE)$pValue, pvalueF, tolerance=1e-4)
  expect_equivalent(pseudorank::kruskal_wallis_test(x~grp,data=df,na.rm=FALSE,pseudoranks=TRUE)$pValue, pvalueT, tolerance=1e-4)
})


x = c(1, 1, 1, 1, 2, 3, 4, 5, 6, NA)
grp = as.factor(c('A','A','B','B','B','D','D','D','D', 'A'))
df = data.frame(x = x, grp = grp)

context("Function for Calculating the Kruskal-Wallis Test with Pseudo-Ranks and NAs")

pvalueF = 0.03567399334725241
pvalueT = 0.03444397966139712

test_that("function hettmansperger_norton_test", {
  expect_equivalent(pseudorank::kruskal_wallis_test(x,grp,na.rm=TRUE,pseudoranks=FALSE)$pValue, pvalueF, tolerance=1e-4)
  expect_equivalent(pseudorank::kruskal_wallis_test(x,grp,na.rm=TRUE,pseudoranks=TRUE)$pValue, pvalueT, tolerance=1e-4)
  expect_equivalent(pseudorank::kruskal_wallis_test(x~grp,data=df,na.rm=TRUE,pseudoranks=FALSE)$pValue, pvalueF, tolerance=1e-4)
  expect_equivalent(pseudorank::kruskal_wallis_test(x~grp,data=df,na.rm=TRUE,pseudoranks=TRUE)$pValue, pvalueT, tolerance=1e-4)
  expect_error(pseudorank::kruskal_wallis_test(x~grp,data=df,na.rm=FALSE,pseudoranks=TRUE))
  expect_error(pseudorank::kruskal_wallis_test(df$x,df$grp,na.rm=FALSE,pseudoranks=TRUE))
})


