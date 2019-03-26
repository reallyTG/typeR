context("rprof-read")

test_that("read incomplete files", {
  expect_warning(
    ds <- read_inst_rprof("rprof/incomplete.out"),
    "Incomplete sampling information, increase bufsize in `Rprof()` or `start_profiler()` call",
    fixed = TRUE
  )
  sample_lengths <- map_int(ds$samples$locations, nrow)
  # Expecting only two different lengths
  expect_equal(unname(diff(rle(sample_lengths)$values)), -1)
})
