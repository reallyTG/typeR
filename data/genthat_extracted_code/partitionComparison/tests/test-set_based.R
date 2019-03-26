library(testthat)
library(partitionComparison)
context("Set based comparison measures")

test_that("Dongen's metric works correctly", {
  expect_equal(dongensMetric(random_partition, random_partition), 0)
  
  expect_equal(dongensMetric(p, q), 2)
  expect_equal(dongensMetric(q, p), 2)
  expect_equal(dongensMetric(p, r), 3)
  expect_equal(dongensMetric(p, s), 1)
  expect_equal(dongensMetric(r, s), 2)
})

test_that("the measure of Larsen and Aone works correctly", {
  expect_equal(larsenAone(random_partition, random_partition), 1)
  
  expect_equal(larsenAone(p, q), 0.8)
  expect_equal(larsenAone(q, p), 0.8)
  expect_equal(larsenAone(p, r), 13/21)
  expect_equal(larsenAone(r, p), 7/12)  # Asymmetric measure!
  expect_equal(larsenAone(p, s), 0.9)
  expect_equal(larsenAone(r, s), 5/6)
})

test_that("the classification error distance works correctly", {
  expect_equal(classificationErrorDistance(random_partition, random_partition), 0)
  
  expect_equal(classificationErrorDistance(p, q), 0.2)
  expect_equal(classificationErrorDistance(q, p), 0.2)
  expect_equal(classificationErrorDistance(p, r), 0.4)
  expect_equal(classificationErrorDistance(p, s), 0.2)
  expect_equal(classificationErrorDistance(r, s), 0.4)
})
