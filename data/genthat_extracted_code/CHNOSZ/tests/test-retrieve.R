context("retrieve")

test_that("errors and recalculations produce expected messages", {
  # this should give an error about one non-element
  expect_error(retrieve(c("A", "B", "C")), '"A" is not an element')
  # this should give an error about two non-elements
  expect_error(retrieve(c("A", "B", "C", "D")), '"A", "D" are not elements')
  # this should recalculate the stoichiometric matrix
  add.obigt("SUPCRT92")
  expect_message(retrieve("Ti"), "creating stoichiometric matrix")
  reset()
})
