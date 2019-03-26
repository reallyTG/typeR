context("Test project_to_segments")

segment_points <- cbind(
  c(0, 1, 2, 0, -2, -1, 0),
  c(1, 2, 1, -1, 1, 2, 1)
)
segment_start <- segment_points[-nrow(segment_points), ]
segment_end <- segment_points[-1, ]

x <- cbind(
  seq(-2, 2, by = .5),
  rep(.5, 9)
)

test_that("project_to_segments works", {
  out <- project_to_segments(x, segment_start, segment_end)

  expect_equal(out$x_proj, matrix(c(-1.75, -1.5, -1.25, 0, 0, 0, 1.25, 1.5, 1.75, .75, .5, .25, 1, 1, 1, .25, .5, .75), ncol = 2))
  expect_equal(out$distance, c(.125, 0, .125, .5, .25, .5, .125, 0, .125))
  expect_equal(out$segment, c(4, 4, 4, 1, 1, 1, 3, 3, 3))
  expect_equal(out$progression, c(.875, .75, .625, 0, 0, 0, .375, .25, .125))

  rownames(x) <- paste0("point", seq_len(nrow(x)))
  colnames(x) <- paste0("feature", seq_len(ncol(x)))

  out <- project_to_segments(x, segment_start, segment_end)

  expect_equal(rownames(out$x_proj), rownames(x))
  expect_equal(colnames(out$x_proj), colnames(x))
  expect_equal(names(out$distance), rownames(x))
  expect_equal(names(out$segment), rownames(x))
  expect_equal(names(out$progression), rownames(x))
})


test_that("project_to_segments fails gracefully", {
  expect_error(project_to_segments(cbind(x, x), x, x), "should be exactly the same")
  expect_error(project_to_segments(x, cbind(x, x), x), "should be exactly the same")
  expect_error(project_to_segments(x, x, cbind(x, x)), "should be exactly the same")
  expect_error(project_to_segments(x, rbind(x, x), x), "should be exactly the same")
  expect_error(project_to_segments(x, x, rbind(x, x)), "should be exactly the same")
})

