c_test <- C_erlang(2, 0.5/0.7)
res_c_test <- 0.188

b_test <- B_erlang(2, 0.5/0.7)
res_b_test <- 0.13

e_test     <- Engset(3, 2, 0.5/0.7)
res_e_test <- 0.38

context("Calculators")

test_that('Calculators',
{
  expect_equal(c_test, res_c_test, tolerance = 0.1)
  expect_equal(b_test, res_b_test, tolerance = 0.1)
  expect_equal(e_test, res_e_test, tolerance = 0.1)
})



