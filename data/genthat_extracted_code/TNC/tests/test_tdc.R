context("Test for tdc output")

test_that("Adjamatrices: centrality_evolution=FALSE when running tdc", {
  expect_is(tdc(As, "M", normalize = T, centrality_evolution = F), "numeric")
  expect_length(tdc(As, "M", normalize = T, centrality_evolution = F), numberNodes)
  expect_true(all(tdc(As, "M", normalize = T, centrality_evolution = F)<=1))
})

test_that("Adjamatrices: centrality_evolution=TRUE when running tdc", {
  expect_is(tdc(As, "M", normalize = T, centrality_evolution = T), "list")
  expect_length(tdc(As, "M", normalize = T, centrality_evolution = T), 2)
  expect_is(tdc(As, "M", normalize = T, centrality_evolution = T)[[2]], "matrix")
})


test_that("Adjalists: centrality_evolution=FALSE when running tdc", {
  expect_is(tdc(Es, "L", normalize = T, centrality_evolution = F), "numeric")
  expect_length(tdc(Es, "L", normalize = T, centrality_evolution = F), numberNodes)
  expect_true(all(tdc(Es, "L", normalize = T, centrality_evolution = F)<=1))
})

test_that("Adjalists: centrality_evolution=TRUE when running tdc", {
  expect_is(tdc(Es, "L", normalize = T, centrality_evolution = T), "list")
  expect_length(tdc(Es, "L", normalize = T, centrality_evolution = T), 2)
  expect_is(tdc(Es, "L", normalize = T, centrality_evolution = T)[[2]], "matrix")
})

test_that("Adjalists compared to Adjamatrices", {
  expect_equal(tdc(Es, "L", normalize = T, centrality_evolution = T),
               tdc(As, "M", normalize = T, centrality_evolution = T))
})
