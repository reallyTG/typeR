library(RWDataPlyr)
context('check rw_scen_gen_names')

test_that("length and dimensions are correct", {
  expect_equal(length(rw_scen_gen_names(c("a", "b"), c("a", "b"))), 4)
  expect_equal(length(rw_scen_gen_names(c("a"), "b")), 1)
  expect_equal(
    length(rw_scen_gen_names(1:4, 1:6, 1:4, 1:30, sep = "_")), 
    4*6*4*30
  )
  expect_null(dim(rw_scen_gen_names(1:3, 1:2, 1:6)))
  expect_equal(
    length(strsplit(
      rw_scen_gen_names(1:4, 1:6, 1:4, 1:30)[1], 
      ",", 
      fixed = TRUE
    )[[1]]),
    4
  )
  expect_equal(
    length(strsplit(
      rw_scen_gen_names(1:4, 1:6, 1:4, sep = "_")[1], 
      ",", 
      fixed = TRUE
    )[[1]]),
    1
  )
})

test_that("scenario names are correct", {
  expect_equal(rw_scen_gen_names(c("a", "b"), c("a", "b"))[1], "a,a")
  expect_true(all(
    c("1,6,3,15", "4,3,1,22") %in% rw_scen_gen_names(1:4, 1:6, 1:4, 1:30)
  ))
  expect_true(all(
    c("b_a_2", "a_a_4") %in% 
      rw_scen_gen_names(c("a", "b"), c("a", "b"), 1:4, sep = "_")
  ))
})

test_that("versions match", {
  expect_identical(
    rw_scen_gen_names(c("a", "b"), c("a", "b")),
    expect_warning(makeAllScenNames(c("a", "b"), c("a", "b")))
  )
  
  expect_identical(
    rw_scen_gen_names(1:4, 1:6, 1:4, 1:30),
    expect_warning(makeAllScenNames(1:4, 1:6, 1:4, 1:30))
  )
})
