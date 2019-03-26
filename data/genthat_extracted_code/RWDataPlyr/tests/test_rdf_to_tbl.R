library(RWDataPlyr)

context("check rdf_to_rwtbl()")

# check the default call -----------------
rdftbl <- expect_warning(rdf_to_rwtbl(keyRdf))
reqCols <- RWDataPlyr:::req_rwtbl_cols()
exp_atts <- c("mrm_config_name", "owner", "description", "create_date", 
              "n_traces")
nt <- as.integer(keyRdf$meta$number_of_runs)
slots <- rdf_slot_names(keyRdf)

test_that("dimensions are as expected", {
  expect_true(nrow(rdftbl) > 0)
  expect_equal(ncol(rdftbl), length(reqCols) + 2)
  expect_true(all(colnames(rdftbl) %in% c(reqCols, "Year", "Month")))
})

test_that("attributes are as expected and match the rdf", {
  expect_true(all(exp_atts %in% names(attributes(rdftbl))))
  expect_identical(attributes(rdftbl)$mrm_config_name, keyRdf$meta$name)
  expect_identical(attributes(rdftbl)$owner, keyRdf$meta$owner)
  expect_identical(attributes(rdftbl)$description, keyRdf$meta$description)
  expect_identical(attributes(rdftbl)$create_date, keyRdf$meta$create_date)
  expect_identical(
    attributes(rdftbl)$n_traces, 
    as.integer(keyRdf$meta$number_of_runs)
  )
})

test_that("no values are modified", {
  for(slot in slots){
    for(tt in seq_len(nt)){
      expect_equivalent(
        (rdftbl %>% 
           filter(TraceNumber == tt, ObjectSlot == slot) %>%
           select(Value))$Value,
        rdf_get_slot(keyRdf, slot)[,tt]
      )
    }
  }
})

# check the add_ym options ---------------
rdftbl2 <- expect_warning(rdf_to_rwtbl(keyRdf, add_ym = FALSE))
test_that("dimensions are as expected with no ym", {
  expect_true(nrow(rdftbl2) > 0)
  expect_equal(ncol(rdftbl2), length(reqCols))
  expect_true(all(colnames(rdftbl2) %in% c(reqCols)))
})

test_that("no ym tbl matches orig tbl", {
  expect_identical(rdftbl2, rdftbl %>% select(-Year, -Month))
})

test_that("invalid add_ym values cause errors", {
  expect_warning(expect_error(rdf_to_rwtbl(keyRdf, add_ym = NA)))
  expect_warning(expect_error(rdf_to_rwtbl(keyRdf, add_ym = "true")))
  expect_warning(expect_error(rdf_to_rwtbl(keyRdf, add_ym = 7)))
  expect_warning(
    expect_error(rdf_to_rwtbl(keyRdf, add_ym = c(FALSE, TRUE, NA)))
  )
})

# check the scenario option -------------
rdftbl2 <- expect_warning(rdf_to_rwtbl(keyRdf, scenario = "DNF,CT"))
rdftbl3 <- expect_warning(rdf_to_rwtbl(keyRdf, scenario = 1, add_ym = FALSE))
test_that("dimensions are as expected with no ym", {
  expect_true(nrow(rdftbl2) > 0)
  expect_equal(ncol(rdftbl2), length(reqCols) + 3)
  expect_true(
    all(colnames(rdftbl2) %in% c(reqCols, "Year", "Month", "Scenario"))
  )
  expect_true(nrow(rdftbl3) > 0)
  expect_equal(ncol(rdftbl3), length(reqCols) + 1)
  expect_true(all(colnames(rdftbl3) %in% c(reqCols, "Scenario")))
  expect_type(rdftbl2$Scenario, "character")
  expect_true(all(rdftbl2$Scenario == "DNF,CT"))
  expect_type(rdftbl3$Scenario, "character")
  expect_true(all(rdftbl3$Scenario == 1))
})

test_that("no add scenario tbl matches orig tbl", {
  expect_identical(rdftbl2 %>% select(-Scenario), rdftbl)
  expect_identical(
    rdftbl3 %>% select(-Scenario), 
    rdftbl %>% select(-Year, -Month)
  )
})

test_that("scenario options error properly", {
  expect_warning({
    expect_error(rdf_to_rwtbl(keyRdf, scenario = c("DNF,CT", "DNF,C1")))
    expect_error(rdf_to_rwtbl(keyRdf, scenario = 1:6, add_ym = FALSE))
    expect_error(rdf_to_rwtbl(keyRdf, scenario = character(0), add_ym = FALSE))
  })
})

# check the keep_cols option ------------
rdftbl2 <- expect_warning(rdf_to_rwtbl(keyRdf, keep_cols = TRUE))
rdftbl3 <- expect_warning(rdf_to_rwtbl(
  keyRdf, 
  keep_cols = c("ObjectName", "Unit"), 
  scenario = 1
))
test_that("dimensions are as expected with keep_cols", {
  expect_true(nrow(rdftbl2) > 0)
  expect_equal(ncol(rdftbl2), length(reqCols) + 8)
  expect_true(
    all(colnames(rdftbl2) %in% 
          c(reqCols, "Year", "Month", "ObjectName", "SlotName", "ObjectType", 
            "Unit", "RulesetFileName", "InputDMIName"))
  )
  
  expect_true(nrow(rdftbl3) > 0)
  expect_equal(ncol(rdftbl3), length(reqCols) + 5)
  expect_true(
    all(colnames(rdftbl3) %in% 
          c(reqCols, "Scenario", "Year", "Month", "ObjectName", "Unit"))
  )
})

test_that("keep_cols warnings post correctly", {
  expect_warning(
    tmp <- rdf_to_rwtbl(keyRdf, keep_cols = c("ObjectName", "missing")),
    paste0(
      "The following columns specified by 'keep_cols' were not found in the rwtbl:\n",
      "    missing"
    )
  )
  
  expect_true(all(colnames(tmp) %in% c(reqCols, "Year", "Month", "ObjectName")))
  
  expect_warning(
    tmp <- rdf_to_rwtbl(keyRdf, keep_cols = c("ObjectName", "missing", "a")),
    paste0(
      "The following columns specified by 'keep_cols' were not found in the rwtbl:\n",
      "    missing, a"
    )
  ) 
  expect_true(all(colnames(tmp) %in% c(reqCols, "Year", "Month", "ObjectName")))
  
  expect_warning({
    expect_error(rdf_to_rwtbl(keyRdf, keep_cols = c(FALSE, TRUE)))
    expect_error(rdf_to_rwtbl(keyRdf, keep_cols = NULL))
  })
})


# check the default call annual values-----------------
context("check rdf_to_rwtbl with annual rdf file")

rdftbl <- expect_warning(rdf_to_rwtbl(sysRdf))
reqCols <- RWDataPlyr:::req_rwtbl_cols()
nt <- as.integer(sysRdf$meta$number_of_runs)
slots <- rdf_slot_names(sysRdf)

test_that("dimensions are as expected", {
  expect_true(nrow(rdftbl) > 0)
  expect_equal(ncol(rdftbl), length(reqCols) + 2)
  expect_true(all(colnames(rdftbl) %in% c(reqCols, "Year", "Month")))
})

test_that("attributes are as expected and match the rdf", {
  expect_true(all(exp_atts %in% names(attributes(rdftbl))))
  expect_identical(attributes(rdftbl)$mrm_config_name, sysRdf$meta$name)
  expect_identical(attributes(rdftbl)$owner, sysRdf$meta$owner)
  expect_identical(attributes(rdftbl)$description, sysRdf$meta$description)
  expect_identical(attributes(rdftbl)$create_date, sysRdf$meta$create_date)
  expect_identical(
    attributes(rdftbl)$n_traces, 
    as.integer(sysRdf$meta$number_of_runs)
  )
})

test_that("values are as expected", {
  for(slot in slots){
    for(tt in seq_len(nt)){
      expect_equivalent(
        (rdftbl %>% 
           filter(TraceNumber == tt, ObjectSlot == slot) %>%
           select(Value))$Value,
        rdf_get_slot(sysRdf, slot)[,tt]
      )
    }
  }
  expect_true(all(rdftbl$Month == "December"))
})

context("check rdf_to_rwtbl() internal helpers")

test_that("req_rwtbl_cols()", {
  expect_type(RWDataPlyr:::req_rwtbl_cols(), "character") %>%
    expect_length(4)
})
