library(testthat)
context("problem.PeakSegFPOP")
library(PeakSegDisk)

library(data.table)
cov.dt <- fread("chrom   chromStart chromEnd count
chr6_dbb_hap3   3491790 3491834 2
chr6_dbb_hap3   3491834 3491836 1
chr6_dbb_hap3   3491836 3697362 0
chr6_dbb_hap3   3697362 3697408 1
chr6_dbb_hap3   3697408 3701587 0
chr6_dbb_hap3   3701587 3701633 1
chr6_dbb_hap3   3701633 3736386 0
")
prob.dir <- file.path(
  tempfile(),
  "samples",
  "sample1",
  "problems",
  "chr6_dbb_hap3-3491790-3736386")
dir.create(prob.dir, showWarnings=FALSE, recursive=TRUE)
coverage.bedGraph <- file.path(prob.dir, "coverage.bedGraph")
fwrite(
  cov.dt,
  coverage.bedGraph,
  sep="\t", row.names=FALSE, col.names=FALSE)

test_that("large penalty should not crash solver", {
  fit <- problem.PeakSegFPOP(prob.dir, "866939314852865280")
  expect_identical(fit$loss$peaks, 0L)
})

loss.tsv <- file.path(prob.dir, "coverage.bedGraph_penalty=10_loss.tsv")
cat("", file=loss.tsv)
test_that("empty loss.tsv is fine", {
  fit <- problem.PeakSegFPOP(prob.dir, "10")
  expect_is(fit, "list")
})

segments.tsv <- file.path(prob.dir, "coverage.bedGraph_penalty=5_segments.tsv")
cat("", file=segments.tsv)
test_that("empty segments.tsv is fine", {
  fit <- problem.PeakSegFPOP(prob.dir, "5")
  expect_is(fit, "list")
})

timing.tsv <- file.path(prob.dir, "coverage.bedGraph_penalty=300_timing.tsv")
cat("", file=timing.tsv)
test_that("empty timing.tsv is fine", {
  fit <- problem.PeakSegFPOP(prob.dir, "300")
  expect_is(fit, "list")
})

cat("", file=coverage.bedGraph)
test_that("empty coverage.bedGraph is an error", {
  expect_error({
    problem.PeakSegFPOP(prob.dir, "300")
  }, "contains no data")
})

cat("chr1 0 1 5", file=coverage.bedGraph)
test_that("one line coverage.bedGraph is fine", {
  fit <- problem.PeakSegFPOP(prob.dir, "300")
  expect_is(fit, "list")
})

cat("0 1 5", file=coverage.bedGraph)
test_that("three columns in coverage.bedGraph is an error", {
  expect_error({
    problem.PeakSegFPOP(prob.dir, "300")
  }, "should have exactly four columns")
})
