id_info_from_errors <- function(errors) {
    paste(errors$id, collapse = "\n")
}

gen_failswith_id <- function(check, dataset, id) {
    errs <- check(dataset, diagnosis.plot = FALSE)
    expect_true(id %in% errs$id, info = id_info_from_errors(errs))
}

gen_failswith_ids <- function(check, dataset, ids) {
    errs <- check(dataset, diagnosis.plot = FALSE)
    expect_equal(ids, errs$id, info = id_info_from_errors(errs))
}

check_all_datasets <- function(datasets, check) {
  empty_error_table <- msgTableCreate()

  lapply(datasets, function(x) {
    errors <- check(get(x))
    expect_equal(errors, empty_error_table, info = paste(c(x,errors$msg), collapse = "\n"))
    expect_is(errors, c("errorTable",
                        "data.frame"))
    expect_true(morse:::msgTableIsEmpty(errors))
  })
}

