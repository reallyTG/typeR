context("Test for tbc output")

test_that("Adjamatrices: centrality_evolution=FALSE when running tbc", {
  expect_is(tbc(As, "M", normalize = T, centrality_evolution = F), "numeric")
  expect_length(tbc(As, "M", normalize = T, centrality_evolution = F), numberNodes)
  expect_true(all(tbc(As, "M", normalize = T, centrality_evolution = F)<=1))
})

test_that("Adjamatrices: centrality_evolution=TRUE when running tbc", {
  expect_is(tbc(As, "M", normalize = T, centrality_evolution = T), "list")
  expect_length(tbc(As, "M", normalize = T, centrality_evolution = T), 2)
  expect_is(tbc(As, "M", normalize = T, centrality_evolution = T)[[2]], "matrix")
})


test_that("Adjalists: centrality_evolution=FALSE when running tbc", {
  expect_is(tbc(Es, "L", normalize = T, centrality_evolution = F), "numeric")
  expect_length(tbc(Es, "L", normalize = T, centrality_evolution = F), numberNodes)
  expect_true(all(tbc(Es, "L", normalize = T, centrality_evolution = F)<=1))
})

test_that("Adjalists: centrality_evolution=TRUE when running tbc", {
  expect_is(tbc(Es, "L", normalize = T, centrality_evolution = T), "list")
  expect_length(tbc(Es, "L", normalize = T, centrality_evolution = T), 2)
  expect_is(tbc(Es, "L", normalize = T, centrality_evolution = T)[[2]], "matrix")
})

test_that("Adjalists compared to Adjamatrices", {
  expect_equal(tbc(Es, "L", normalize = T, centrality_evolution = T),
               tbc(As, "M", normalize = T, centrality_evolution = T))
})
