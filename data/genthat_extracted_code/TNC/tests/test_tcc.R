context("Test for tcc output")

test_that("Adjamatrices: centrality_evolution=FALSE when running tcc", {
  expect_is(tcc(As, "M", normalize = T, centrality_evolution = F), "numeric")
  expect_length(tcc(As, "M", normalize = T, centrality_evolution = F), numberNodes)
  expect_true(all(tcc(As, "M", normalize = T, centrality_evolution = F)<=1))
})

test_that("Adjamatrices: centrality_evolution=TRUE when running tcc", {
  expect_is(tcc(As, "M", normalize = T, centrality_evolution = T), "list")
  expect_length(tcc(As, "M", normalize = T, centrality_evolution = T), 2)
  expect_is(tcc(As, "M", normalize = T, centrality_evolution = T)[[2]], "matrix")
})


test_that("Adjalists: centrality_evolution=FALSE when running tcc", {
  expect_is(tcc(Es, "L", normalize = T, centrality_evolution = F), "numeric")
  expect_length(tcc(Es, "L", normalize = T, centrality_evolution = F), numberNodes)
  expect_true(all(tcc(Es, "L", normalize = T, centrality_evolution = F)<=1))
})

test_that("Adjalists: centrality_evolution=TRUE when running tcc", {
  expect_is(tcc(Es, "L", normalize = T, centrality_evolution = T), "list")
  expect_length(tcc(Es, "L", normalize = T, centrality_evolution = T), 2)
  expect_is(tcc(Es, "L", normalize = T, centrality_evolution = T)[[2]], "matrix")
})

test_that("Adjalists compared to Adjamatrices", {
  expect_equal(tcc(Es, "L", normalize = T, centrality_evolution = T),
               tcc(As, "M", normalize = T, centrality_evolution = T))
})
