library(RWDataPlyr)
library(dplyr)

context("ensure rdf_to_rwotbl2() matches rdf_to_rwtbl()")

# check the default call -----------------
rdf_file <- system.file(
  "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most/KeySlots.rdf", 
  package = "RWDataPlyr"
)
rdftbl <- expect_warning(
  read_rdf(rdf_file) %>%
    rdf_to_rwtbl()
)
rdftbl2 <- rdf_to_rwtbl2(rdf_file)

reqCols <- RWDataPlyr:::req_rwtbl_cols()
exp_atts <- c("mrm_config_name", "owner", "description", "create_date", 
              "n_traces")

test_that("dimensions are as expected", {
  expect_equal(dim(rdftbl), dim(rdftbl2))
  expect_true(all(colnames(rdftbl2) %in% c(reqCols, "Year", "Month")))
})

test_that("attributes are as expected and match the rdf", {
  expect_true(all(exp_atts %in% names(attributes(rdftbl2))))
})

test_that("functions match", {
  expect_equal(rdftbl, rdftbl2)
})

# check the add_ym options ---------------
rdftbl3 <- expect_warning(read_rdf(rdf_file) %>% rdf_to_rwtbl(add_ym = FALSE))
rdftbl4 <- rdf_to_rwtbl2(rdf_file, add_ym = FALSE)
test_that("different versions match", {
  expect_equal(rdftbl3, rdftbl4)
})

test_that("no ym tbl matches orig tbl", {
  expect_identical(rdftbl4, rdftbl2 %>% select(-Year, -Month))
})

test_that("invalid add_ym values cause errors", {
  expect_error(rdf_to_rwtbl2(rdf_file, add_ym = NA))
  expect_error(rdf_to_rwtbl2(rdf_file, add_ym = "true"))
  expect_error(rdf_to_rwtbl2(rdf_file, add_ym = 7))
  expect_error(rdf_to_rwtbl2(rdf_file, add_ym = c(FALSE, TRUE, NA)))
})

# check the scenario option -------------
rdftbl5 <- expect_warning(
  read_rdf(rdf_file) %>% 
    rdf_to_rwtbl(scenario = "DNF,CT")
)
rdftbl6 <- rdf_to_rwtbl2(rdf_file, scenario = "DNF,CT")

rdftbl7 <- expect_warning(
  read_rdf(rdf_file) %>% 
    rdf_to_rwtbl(scenario = 1, add_ym = FALSE)
)
rdftbl8 <- rdf_to_rwtbl2(rdf_file, scenario = 1, add_ym = FALSE)
test_that("methods match", {
  expect_equal(rdftbl5, rdftbl6)
  expect_equal(rdftbl7, rdftbl8)
})

test_that("no add scenario tbl matches orig tbl", {
  expect_identical(rdftbl6 %>% select(-Scenario), rdftbl2)
  expect_identical(
    rdftbl8 %>% select(-Scenario), 
    rdftbl2 %>% select(-Year, -Month)
  )
})

test_that("scenario options error properly", {
  expect_error(rdf_to_rwtbl2(rdf_file, scenario = c("DNF,CT", "DNF,C1")))
  expect_error(rdf_to_rwtbl2(rdf_file, scenario = 1:6, add_ym = FALSE))
  expect_error(rdf_to_rwtbl2(rdf_file, scenario = character(0), add_ym = FALSE))
})

# check the keep_cols option ------------
rdftbl3 <- expect_warning(read_rdf(rdf_file) %>% rdf_to_rwtbl(keep_cols = TRUE))
rdftbl4 <- rdf_to_rwtbl2(rdf_file, keep_cols = TRUE)

rdftbl5 <- expect_warning(
  read_rdf(rdf_file) %>%
    rdf_to_rwtbl(keep_cols = c("ObjectName", "Unit"), scenario = 1)
)
rdftbl6 <- rdf_to_rwtbl2(
  rdf_file, 
  keep_cols = c("ObjectName", "Unit"), 
  scenario = 1
)

test_that("methods match", {
  expect_equal(rdftbl3, rdftbl4)
  expect_equal(rdftbl5, rdftbl6)
})

test_that("keep_cols warnings post correctly", {
  expect_warning(
    tmp <- rdf_to_rwtbl2(rdf_file, keep_cols = c("ObjectName", "missing")),
    paste0(
      "The following columns specified by 'keep_cols' were not found in the rwtbl:\n",
      "    missing"
    )
  )
  
  expect_true(all(colnames(tmp) %in% c(reqCols, "Year", "Month", "ObjectName")))
  
  expect_warning(
    tmp <- rdf_to_rwtbl2(rdf_file, keep_cols = c("ObjectName", "missing", "a")),
    paste0(
      "The following columns specified by 'keep_cols' were not found in the rwtbl:\n",
      "    missing, a"
    )
  ) 
  expect_true(all(colnames(tmp) %in% c(reqCols, "Year", "Month", "ObjectName")))
  
  expect_error(rdf_to_rwtbl2(rdf_file, keep_cols = c(FALSE, TRUE)))
  expect_error(rdf_to_rwtbl2(rdf_file, keep_cols = NULL))
})


# check the default call annual values-----------------
context("check rdf_to_rwtbl with annual rdf file")

rdf_file <- system.file(
  "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most/SystemConditions.rdf", 
  package = "RWDataPlyr"
)

rdftbl <- expect_warning(read_rdf(rdf_file) %>% rdf_to_rwtbl())
rdftbl2 <- rdf_to_rwtbl2(rdf_file)

test_that("methods match for annual rdf", {
  expect_equal(rdftbl, rdftbl2)
})

# check rwtbl for scalar slots ----------------
context("check rdf_to_rwtbl with scalar rdf files")
test_that("methods match for scalar slots", {
  xx <- expect_warning(read_rdf("../rdfs/scalar.rdf") %>% rdf_to_rwtbl())
  xx2 <- rdf_to_rwtbl2("../rdfs/scalar.rdf")
  expect_equal(xx, xx2)
  xx <- expect_warning(read_rdf("../rdfs/scalar_series.rdf") %>% rdf_to_rwtbl())
  xx2 <- rdf_to_rwtbl2("../rdfs/scalar_series.rdf")
  expect_equal(xx, xx2)
  xx <- expect_warning(read_rdf("../rdfs/series.rdf") %>% rdf_to_rwtbl())
  xx2 <- rdf_to_rwtbl2("../rdfs/series.rdf")
  expect_equal(xx, xx2)
})

