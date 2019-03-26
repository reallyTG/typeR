context("kntn_parse and kntn_unnest")

library(dplyr, warn.conflicts = FALSE)

test_that("parsing a single record works", {
  record_file <- system.file("extdata/record.json", package = "kntnr")
  record_obj  <- jsonlite::fromJSON(record_file, simplifyVector = FALSE)$record %>%
    kntn_parse_record

  expect_identical(dim(record_obj), c(1L, 21L))
})

test_that("parsing multiple records works", {
  records_file <- system.file("extdata/records.json", package = "kntnr")
  records_obj  <- jsonlite::fromJSON(records_file, simplifyVector = FALSE)$records %>%
    kntn_parse_records

  expect_identical(dim(records_obj), c(3L, 6L))
})

test_that("unnesting records works", {
  records_file <- system.file("extdata/records.json", package = "kntnr")
  records_obj  <- jsonlite::fromJSON(records_file, simplifyVector = FALSE)$records %>%
    kntn_parse_records %>%
    kntn_unnest

  expect_identical(dim(records_obj), c(6L, 7L))
  expect_equivalent(table(records_obj$record_id),
                    as.table(purrr::set_names(c(3,1,2), 1:3)))

  na_count <- dplyr::group_by(records_obj, record_id) %>%
    dplyr::summarize(na_count_checkbox = sum(is.na(checkbox)),
                     na_count_subfield1 = sum(is.na(subfield1)))
  expect_identical(na_count$na_count_checkbox, c(3L, 0L, 0L))
  expect_identical(na_count$na_count_subfield1, c(0L, 0L, 2L))

})


test_that("unnesting terriblly-nested records works", {
  records_file <- system.file("extdata/records_nested.json", package = "kntnr")
  records_obj  <- jsonlite::fromJSON(records_file, simplifyVector = FALSE)$records %>%
    kntn_parse_records %>%
    kntn_unnest

  expect_identical(dim(records_obj), c(5L, 7L))
  expect_equivalent(table(records_obj$record_id),
                    as.table(purrr::set_names(c(3,2), 1:2)))

  na_count <- dplyr::group_by(records_obj, record_id) %>%
    dplyr::summarize(na_count_fileKey = sum(is.na(fileKey)),
                     na_count_subfield1 = sum(is.na(subfield1)))
  expect_identical(na_count$na_count_fileKey, c(0L, 2L))
  expect_identical(na_count$na_count_subfield1, c(0L, 1L))

})
