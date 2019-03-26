library(dplyr)
# rwtbl_slot_names() ---------------------
context("Test `rwtbl_slot_names()` function")

rwtbl <- expect_warning(rdf_to_rwtbl(keyRdf))

test_that("`rwtbl_slot_names()` finds correct slots", {
  expect_type(rwslots <- rwtbl_slot_names(rwtbl), "character")

  expect_true(all(rwslots %in% c("Mead.Pool Elevation", "Powell.Outflow")))
  
  expect_true(all(c("Mead.Pool Elevation", "Powell.Outflow") %in% rwslots))
  
  expect_setequal(rwslots, rdf_slot_names(keyRdf))
})

rwa <- as.rwd_agg(read.csv(
  system.file("extdata/rwd_agg_files/passing_aggs.csv", package = "RWDataPlyr"),
  stringsAsFactors = FALSE
))

test_that("`rwtbl_slot_names()` fails for other data frames", {
  errMsg <- paste0(
    "Invalid `tbl_df` passed to `rdftbl_slot_names()`.\n",
    "It does not have an `ObjectSlot` column"
  )
  expect_error(rwtbl_slot_names(mtcars), errMsg, fixed = TRUE)
  
  # should fail for summarized RW data
  expect_error(
    rwtbl_slot_names(rdf_aggregate(
      rwa[1,],
      system.file(
        "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most/", 
        package = "RWDataPlyr"
      )
    )),
    errMsg,
    fixed = TRUE
  )
})

# rwtbl_var_to_slot() ---------------------
context("Test `rwtbl_var_to_slot()`")

test_that("`rwtbl_var_to_slot()` errors correctly", {
  expect_error(
    rwtbl_var_to_slot(mtcars, "peLt1000"), 
    paste0("Invalid `tbl_df` passed to `rwtbl_var_to_slot()`.\n",
           "It does not have a `Variable` column"),
    fixed = TRUE
  )
  expect_error(
    rwtbl_var_to_slot(mutate(mtcars, Variable = rownames(mtcars)), "peLt1000"),
    paste0("Invalid `tbl_df` passed to `rwtbl_var_to_slot()`.\n",
           "It does not have a `rwd_agg` attribute."),
    fixed = TRUE
  )
})

rwa <- rwd_agg(read.csv(
  system.file("extdata/rwd_agg_files/passing_aggs.csv", package = "RWDataPlyr"),
  stringsAsFactors = FALSE)
)

test_that("`rwtbl_var_to_slot()` works", {
  expect_type(tmp <- rwtbl_var_to_slot(scen_data, rwa$variable), "character")
  expect_length(tmp, nrow(rwa))
  expect_setequal(tmp, rwa$slot)
  
  expect_type(tmp <- rwtbl_var_to_slot(scen_data, rwa$variable[1]), "character")
  expect_length(tmp, 1)
  expect_setequal(tmp, rwa$slot[1])
  
  expect_type(
    expect_warning(
      tmp <- rwtbl_var_to_slot(scen_data, c(rwa$variable[1:2], "okey")), 
      paste0("The following variables were not found in the rwtbl:\n",
             paste(paste("    ", "okey"), collapse = "\n"))
    ),
    "character"
  )
  expect_length(tmp, 2)
  expect_setequal(tmp, rwa$slot[1:2])
  
  expect_type(
    expect_warning(
      tmp <- rwtbl_var_to_slot(scen_data, c("noway", "okey")), 
      paste0("The following variables were not found in the rwtbl:\n",
             paste(paste("    ", c("noway", "okey")), collapse = "\n"))
    ),
    "character"
  )
  expect_length(tmp, 0)
})

# rwtbl_get_scen_folder() ---------------------
context("Test `rwtbl_get_scen_folder()`")

test_that("`rwtbl_get_scen_folder()` errors correctly", {
  expect_error(
    rwtbl_get_scen_folder(mtcars, "Most"), 
    paste0("Invalid `tbl_df` passed to `rwtbl_get_scen_folder()`.\n",
           "It does not have a `Scenario` column"),
    fixed = TRUE
  )
  expect_error(
    rwtbl_get_scen_folder(mutate(mtcars, Scenario = rownames(mtcars)), "Most"),
    paste0("Invalid `tbl_df` passed to `rwtbl_get_scen_folder()`.\n",
           "It does not have a `scen_folder` attribute."),
    fixed = TRUE
  )
})

test_that("`rwtbl_get_scen_folder()` works", {
  expect_type(
    tmp <- rwtbl_get_scen_folder(scen_data, c("Most", "2002")), 
    "character"
  )
  expect_length(tmp, 2)
  expect_setequal(tmp, attr(scen_data, "scen_folder")$folder)
  
  expect_type(
    tmp <- rwtbl_get_scen_folder(scen_data, "Most"), 
    "character"
  )
  expect_length(tmp, 1)
  expect_setequal(tmp, attr(scen_data, "scen_folder")$folder[2])
  
  expect_warning(
    expect_type(
      tmp <- rwtbl_get_scen_folder(scen_data, c("Most", "2002", "missed")), 
      "character"
    ),
    paste0("The following scenarios were not found in the rwtbl:\n",
           paste(paste("    ", "missed"), collapse = "\n"))
  )
  expect_length(tmp, 2)
  expect_setequal(tmp, attr(scen_data, "scen_folder")$folder)
  
  expect_warning(
    expect_type(
      tmp <- rwtbl_get_scen_folder(scen_data, c("notthere", "missed")), 
      "character"
    ),
    paste0("The following scenarios were not found in the rwtbl:\n",
           paste(paste("    ", c("notthere", "missed")), collapse = "\n"))
  )
  expect_length(tmp, 0)
})
