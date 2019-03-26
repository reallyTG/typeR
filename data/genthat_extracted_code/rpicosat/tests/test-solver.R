test_that("solves basic examples", {
  formula <- list(
      c(-1, 2), # 1 => 2
      c(-2, 3)  # 2 => 3
  )
  res <- picosat_sat(formula, 1)
  expect_equal("PICOSAT_SATISFIABLE", picosat_solution_status(res))
  expected <- data.frame(
    variable = c(1L, 2L, 3L),
    value = c(TRUE, TRUE, TRUE)
  )
  expect_equivalent(expected, res)
})

test_that("handles unsatisfiable results", {
  formula <- list(
    c(1),
    c(-1)
  )
  res <- picosat_sat(formula)
  expect_equal("PICOSAT_UNSATISFIABLE", picosat_solution_status(res))
  expect_equivalent(data.frame(variable = integer(0), value = logical()), res)
})

test_that("fails if a literal is 0", {
  expect_error(picosat_sat(list(c(1, 0))))
})

test_that("fails if a literal is not numeric", {
  expect_error(picosat_sat(list(c("1", "2"))))
})

test_that("fails if a literal is NA", {
  expect_error(picosat_sat(list(c(1, NA))))
})

test_that("fails if assumption referes to a unknown literal", {
  expect_error(picosat_sat(list(c(1, 2)), 3))
})

test_that("supporsts picosat statistics", {
  formula <- list(
    c(-1, 2), # 1 => 2
    c(-2, 3)  # 2 => 3
  )
  res <- picosat_sat(formula)
  expect_equal(3L, picosat_variables(res))
  expect_equal(2L, picosat_added_original_clauses(res))
  expect_true(picosat_propagations(res) >= 0L)
  expect_true(picosat_decisions(res) >= 0L)
  expect_true(picosat_visits(res) >= 0L)
  expect_true(picosat_seconds(res) >= 0)
})
