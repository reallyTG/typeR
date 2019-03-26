library(dplyr)
context("check read_rw_csv")

# create an arbitrary csv file to check errors
tf <- tempfile(tmpdir = tempdir(), fileext = ".csv")
df <- data.frame("something" = 1:12, "other" = month.abb)
write.csv(df, file = tf)

teardown(unlink(tf))

zz <- read_rw_csv(system.file(
  "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most",
  "KeySlots.csv",
  package = "RWDataPlyr"
))

xx <- data.table::fread(
  system.file("extdata/Scenario/ISM1988_2014,2007Dems,IG,Most",
              "KeySlots.csv",
              package = "RWDataPlyr"), 
  header = TRUE, 
  data.table = FALSE
)

# check riverware csv ----------------------
test_that("RiverWare csv is properly read in", {
  expect_s3_class(zz, c("tbl_df", "tbl", "data.frame"))
  expect_true(all(
    c("RunNumber", "TraceNumber","ObjectSlot", "Timestep", "Value") %in% 
      colnames(zz)
  ))
  expect_true(nrow(zz) > 0)
})

# check rw csv formatting and compare to plain fread ---------------
test_that("rw csv is formatted properly", {
  # spaces area all removed
  expect_equal(colnames(zz), gsub(" ", "", colnames(zz), fixed = TRUE))
  # the only data that are changed are the timestep
  expect_equivalent(
    zz %>% 
      select(-Timestep) %>% 
      rename_at(
        .vars = 1:(ncol(zz)-1), 
        .funs = funs(paste0("X", match(., colnames(zz))))
      ),
    xx %>% 
      select(-Timestep) %>%
      rename_at(
        .vars = 1:(ncol(xx) - 1), 
        .funs = funs(paste0("X", match(., colnames(xx))))
      )
  )
})

# check error ---------------------------------
test_that("error is thrown on non rw csv", {
  expect_error(read_rw_csv(tf))
})

ts <- c("4-30-2020 23:59:00", "5-31-2020 23:59:01", "6-30-2020 24:00")

# check the timestep column and the helper function ---------------------
test_that("timestep is correctly modified", {
  expect_false(any(zz$Timestep == xx$Timestep))
  expect_equal(zz$Timestep[1], "2018-1-31 23:59:00")
  expect_equal(xx$Timestep[1], "01-31-2018 23:59:00")
  # checks the conversion and proves that the hh:mm are not messed with
  expect_equal(
    RWDataPlyr:::convert_rw_csv_ts(ts), 
    c("2020-4-30 23:59:00", "2020-5-31 23:59:01", "2020-6-30 24:00")
  ) %>% 
    expect_length(3) %>%
    expect_type("character")
  expect_equal(RWDataPlyr:::convert_rw_csv_ts(ts[2]), "2020-5-31 23:59:01") %>% 
    expect_length(1) %>%
    expect_type("character")
  expect_error(
    RWDataPlyr:::convert_rw_csv_ts("1-31-2020"),
    paste0("Unexpected Timestep format encountered when reading csv.\n",
           "Year, month, day and time should be seperated by a space.")
  )
  expect_error(
    RWDataPlyr:::convert_rw_csv_ts("1-31-2020 24:00 00"),
    paste0("Unexpected Timestep format encountered when reading csv.\n",
           "Year, month, day and time should be seperated by a space.")
  )
  expect_error(
    RWDataPlyr:::convert_rw_csv_ts("1/31/2020 24:00"),
    paste0("Unexpected Timestep format encountered when reading csv.\n",
           "Year, month, and day should be seperated by '-'")
  )
  expect_error(
    RWDataPlyr:::convert_rw_csv_ts("2020-2-28 24:00"),
    paste0("Unexpected Timestep format encountered when reading csv.\n",
           "Year is expected to be the 3rd element of the month, day, year.")
  )
  expect_error(
    RWDataPlyr:::convert_rw_csv_ts(c("1-31-2020", "2-28-2020")),
    paste0("Unexpected Timestep format encountered when reading csv.\n",
           "Year, month, day and time should be seperated by a space.")
  )
  expect_error(
    RWDataPlyr:::convert_rw_csv_ts(
      c("1-31-2020 24:00 00", "2-28-2020 24:00 00")
    ),
    paste0("Unexpected Timestep format encountered when reading csv.\n",
           "Year, month, day and time should be seperated by a space.")
  )
  expect_error(
    RWDataPlyr:::convert_rw_csv_ts(c("1/31/2020 24:00", "2/28/2020 24:00")),
    paste0("Unexpected Timestep format encountered when reading csv.\n",
           "Year, month, and day should be seperated by '-'")
  )
  expect_error(
    RWDataPlyr:::convert_rw_csv_ts(c("2020-2-28 24:00", "2020-3-31 24:00")),
    paste0("Unexpected Timestep format encountered when reading csv.\n",
           "Year is expected to be the 3rd element of the month, day, year.")
  )
})

# check riversmart csv -------------------------
test_that("RiverSMART csv is properly read in", {
  expect_s3_class(
    zz <- read_rw_csv(system.file(
      "extdata/ScenarioSet/ScenarioGroupA",
      "C_SystemConditions.csv",
      package = "RWDataPlyr"
    )),
    c("tbl_df", "tbl", "data.frame")
  )
  expect_true(all(
    c("RunNumber", "TraceNumber","ObjectSlot", "Timestep", "Value") %in% 
      colnames(zz)
  ))
  expect_true(nrow(zz) > 0)
})
