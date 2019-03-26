# REQUIRE TEST mlogit example --------------------------------------------------

test_that('REQUIRE TEST mlogit example', {
    data(mexico)
    z.out <- zelig(as.factor(vote88) ~ pristr + othcok + othsocok,
                 model = "mlogit", data = mexico)
    x.out <- setx(z.out)
    expect_error(s.out <- sim(z.out, x.out), NA)
})

# REQUIRE TEST mlogit getters --------------------------------------------------
test_that('REQUIRE TEST mlogit from_zelig_model', {
  data(mexico)
  z.out1 <- zelig(as.factor(vote88) ~ pristr + othcok + othsocok,
                  model = "mlogit", data = mexico, cite = F)
  
  expect_equal(length(coef(z.out1)), 8)
  expect_equal(class(from_zelig_model(z.out1))[[1]], "vglm")

  expect_equal(length(z.out1$get_pvalue()[[1]]), 8)
  expect_equal(length(z.out1$get_se()[[1]]), 8)
  expect_false(any(z.out1$get_pvalue()[[1]] == z.out1$get_se()[[1]]))
})