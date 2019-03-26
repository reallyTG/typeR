context("ventilation")

test_that("anatomic deadspace for a child", {
  expect_equal(
    expect_warning(deadspace_anatomic_child(ideal_weight_kg = 10)),
    deadspace_anatomic_child(ideal_weight_kg = 10, age_y = 6)
  )
  expect_equal(
    deadspace_anatomic_child(ideal_weight_kg = 10, age_y = 6),
    deadspace_anatomic_child(ideal_weight_kg = 10, age_y = 7)
  )
  expect_equal(
    expect_warning(deadspace_anatomic_child(ideal_weight_kg = 10)), 22)
  expect_equal(deadspace_anatomic_child(ideal_weight_kg = 10, age_y = 5),
               22.76615, tolerance = 1e-5)
})

test_that("adult deadspace", {
  expect_equal(deadspace_anatomic_adult(), 125)
})

test_that("child or adult deadspace", {
  expect_equal(deadspace_anatomic(ideal_weight_kg = 70, age_y = 19),
               deadspace_anatomic_adult(ideal_weight_kg = 70))
  expect_equal(deadspace_anatomic(ideal_weight_kg = 12, age_y = 3),
               deadspace_anatomic_child(ideal_weight_kg = 12, age_y = 3))
})

test_that("intrathoracic", {
  expect_equal(deadspace_intrathoracic_ml(ideal_weight_kg = 100), 103)
})
