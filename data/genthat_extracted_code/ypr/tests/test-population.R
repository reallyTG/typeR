context("population")

test_that("population", {
  population <- ypr_population()
  expect_identical(check_population(population), population)
  population2 <- ypr_population()
  population2$Rk <- 2.5
  expect_identical(ypr_population_update(population, Rk = 2.5), population2)
  expect_error(ypr_population_update(population, Rk = 0.5), "the values in Rk must lie between 1 and 100")
  expect_is(ypr_population_update(population, pi = 0.23456), "ypr_population")

  ypr_population_update(population, M = 0.2, Mb = -0.75)

  populations <- ypr_populations()
  expect_identical(length(populations), 1L)
  expect_identical(populations[[1]], ypr_population())

  populations <- ypr_populations(Rk = c(2.5, 4.6), Hm = c(0.2, 0.05))
  expect_identical(check_populations(populations), populations)
  expect_identical(length(populations), 4L)
  expect_identical(check_population(populations[[1]]), populations[[1]])
})
