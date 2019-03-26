context("lapply")

test_that("eply and evals can be passed to functions like lapply", {
  e <- split(example.expr(), f = seq_len(nrow(example.expr())))
  expect_silent(o <- lapply(e, eply,
    .fun = example.fun, .with = example.with()
  ))
  expect_silent(o <- lapply(c("1+1", "a+2"), evals, .with = list(a = 1)))
})
