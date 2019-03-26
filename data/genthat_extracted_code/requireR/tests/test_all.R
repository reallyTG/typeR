context("All requireR tests")
test_that("requireR exists", {
  expect_is(requireR, "function")
})

test_that("Incorrect calls to require behave as expected.", {
  expect_error(requireR(), "No dependencies or functions passed.")
})

test_that("Non-existing files cannot be requirerd.", {
  expect_error(requireR("non_existing_file.R"), "The file 'non_existing_file.R' does not exist.")
})

test_that("Empty files return nothing.", {
  expect_equal(requireR("empty_file.R"), NULL)
})


test_that("Vanilla R objects are returned as is.", {
  expect_equal(requireR("contains_a_single_1.R"), 1)
  expect_equal(requireR("contains_a_single_a.R"), "a")
})

test_that("Requirer objects are returned as is.", {
  expect_equal(requireR("returns_1.R"), 1)
  expect_equal(requireR("returns_a.R"), "a")
})

test_that("Objects are loaded only once.", {
  expect_equal(requireR("random.R"), requireR("random.R"))
})

test_that("Single dependencies are loaded.", {
  expect_equal(requireR("single_dependency/dependent.R"), "This text is returned by the independent file.")
})

test_that("A dependency is loaded only once.", {
  expect_equal(requireR("double_dependency/dependent1.R"), requireR("double_dependency/dependent2.R"))
  expect_equal(requireR("double_dependency_with_adaptation/dependent1.R"), list(0, 2, 3, 5, 8))
  expect_equal(requireR("double_dependency_with_adaptation/dependent2.R"), list(0, 2, 3, 5, 0))
})
