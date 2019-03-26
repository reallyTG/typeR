# Prepare some linear pseudo-demographic data without ridges and noise
m = matrix(seq(1,1.99,by = 0.01), 10,10)
rownames(m) = paste("age", 1:10)
colnames(m) = 1980:1989

test_that("estPar testing, effects = FALSE", {
  est = estPar(m, effects = FALSE)
  expect_equivalent(length(est$par), 3)
})

test_that("estPar testing, effects = TRUE", {
  est = estPar(m, effects = TRUE)
  expect_equivalent(length(est$par), 7)
})

