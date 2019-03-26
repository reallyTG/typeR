library(testthat)
library(poio)

# Can't compare po object directly using
# expect_identical(po1, po2) due to
# https://github.com/hadley/dplyr/issues/2194
# testthat also not informative on where differences in data_frames are
# so roll custom solution.

expect_po_equal <- function(actual, expected, check_po_revision_date = FALSE) {
  expect_identical(actual$source_type, expected$source_type)
  expect_identical(actual$file_type, expected$file_type)
  expect_identical(actual$initial_comments, expected$initial_comments)
  expect_identical(actual$initial_comments, expected$initial_comments)

  if(check_po_revision_date) {
    # PO-Revision-Date is set to the current time.
    # Fake the value, then check that separately.
    actual_po_revision_date <- with(actual$metadata, value[name == "PO-Revision-Date"])
    actual$metadata <- within(
      actual$metadata,
      value[name == "PO-Revision-Date"] <- "DUMMY VALUE"
    )
    date_format <- "%Y-%m-%d %H:%M:%S%z"
    expect_match(actual_po_revision_date, rebus.datetimes::datetime(date_format))
    expect_lt(
      as.numeric(
        difftime(
          Sys.time(),
          strptime(actual_po_revision_date, date_format),
          units = "secs"
        )
      ),
      30
    )
  }

  # Avoid tibble mess by converting data_frames
  # to data.frames before comparing
  actual_metadata <- as.data.frame(actual$metadata)
  expected_metadata <- as.data.frame(expected$metadata)
  metadata_info <- get_difference_info(actual$metadata, expected$metadata)
  expect_equal(actual_metadata, expected_metadata, info = metadata_info)
  actual_direct <- as.data.frame(actual$direct)
  expected_direct <- as.data.frame(expected$direct)
  direct_info <- get_difference_info(actual$direct, expected$direct)
  expect_equal(actual_direct, expected_direct, info = direct_info)
  actual_countable <- as.data.frame(actual$countable)
  expected_countable <- as.data.frame(expected$countable)
  countable_info <- get_difference_info(actual$countable, expected$countable)
  expect_equal(actual_countable, expected_countable, info = countable_info)
}

flatten <- function(d) {
  d[] <- lapply(
    colnames(d),
    function(colname) {
      vapply(d[[colname]], toString, character(1))
    }
  )
  d
}

get_difference_info <- function(d1, d2) {
  fd1 <- flatten(d1)
  fd2 <- flatten(d2)
  diffs12 <- dplyr::anti_join(fd1, fd2)
  diffs21 <- dplyr::anti_join(fd2, fd1)
  diffs_both <- cbind(actual = diffs12, expected = diffs21)
  assertive.base::print_and_capture(diffs_both)
}

test_check("poio")

