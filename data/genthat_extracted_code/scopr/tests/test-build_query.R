context("build_query")


test_that("build query works when time is supplied", {
  dir <- paste0(scopr_example_dir(), "/ethoscope_results/")
  query <- data.frame(machine_name = c("E_014", "E_014","E_029"),
                      date = c("2016-01-25", "2016-02-17","2016-01-25"),
                      time = c("21:36:04", NA, NA),
                      test=c(1,2,3)
                      )

  out <- scopr:::build_query(dir, query)
  expect_equal(nrow(out), 3)

  query <- data.frame(machine_name = c("E_014"),
                      date = c("2016-01-25"),
                      time = c("21:46:14"),
                      region_id=c(1,2,3,4)
  )

  out <- scopr:::build_query(dir, query)
  expect_equal(nrow(out), 4)
})



test_that("build_query with date, machine name, and ROIs, and two experiments on the same date, but different times!", {
  dir <- paste0(scopr_example_dir(), "/ethoscope_results/")
  query <- data.frame(machine_name = c("E_014", "E_014","E_029"),
                      date = c("2016-01-25", "2016-01-25","2016-01-25"),
                      time = c("21:46:14", "21:36:04", NA),
                      test=c(1,2,3)

  )

  query <- data.table::as.data.table(query)
  query <- query[,.(region_id=1:5),by=c(colnames(query))]

  out <- scopr:::build_query(dir, query)

  expect_equal(nrow(out), 3*5)
  expect_equal(nrow(na.omit(out)), 3*5)
})


test_that("build query works when only date supplied", {
  dir <- paste0(scopr_example_dir(), "/ethoscope_results/")

  query <- data.frame(machine_name = c("E_014", "E_014","E_029", "E_029"),
                      date = c("2016-01-25", "2016-02-17","2016-01-25","2016-01-25"))

  expect_warning(out <- scopr:::build_query(dir, query), "Several files")
  expect_equal(nrow(out), 4)
  expect_equal(nrow(out[as.character(datetime)=="2016-02-17 15:42:46"]), 1)
})


test_that("build query works when only date supplied and ROIs", {
  dir <- paste0(scopr_example_dir(), "/ethoscope_results/")

  query <- data.frame(machine_name = c("E_014", "E_014","E_029"),
                      date = c("2016-01-25", "2016-02-17","2016-01-25"))

  query <- data.table::as.data.table(query)
  query <- query[,.(region_id=1:5),by=c(colnames(query))]

  expect_warning(out <- scopr:::build_query(dir, query), "Several files")
  expect_equal(nrow(out), nrow(query))
  expect_equal(nrow(out[as.character(datetime)=="2016-02-17 15:42:46"]), 5)
})



test_that("missing results!", {
  dir <- paste0(scopr_example_dir(), "/ethoscope_results/")
  query <- data.frame(machine_name = c("E_014", "E_0XXX","E_029"),
                      date = c("2016-01-25", "2016-02-17","2016-01-25"),
                      time = c("21:46:14", NA, NA),
                      test=c(1,2,3)
  )

  expect_warning(out <- scopr:::build_query(dir, query),   "No result for machine_name == E_0XXX")
  expect_equal(nrow(out), 2)

  # same with wrong time "2016-02-28"
  query <- data.frame(machine_name = c("E_014", "E_014","E_029"),
                      date = c("2016-01-25", "2016-02-28","2016-01-25"),
                      time = c("21:46:14", NA, NA),
                      test=c(1,2,3)
  )

  expect_warning(out <- scopr:::build_query(dir, query),   "No result for machine_name == E_014, date == 2016-02-28")
  expect_equal(nrow(out), 2)
})
