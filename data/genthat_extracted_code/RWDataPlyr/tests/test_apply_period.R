
context("check the apply_period function")
library(dplyr)

slot_agg_matrix <- rwd_agg(read.csv(
  system.file("extdata/rwd_agg_files/passing_aggs.csv", package = "RWDataPlyr"),
  stringsAsFactors = FALSE
))[1:5,]

rwtbl <- expect_warning(rdf_to_rwtbl(keyRdf))

orig_op <- getOption("rwdataplyr.wy_month_tol")
teardown(options(rwdataplyr.wy_month_tol = orig_op))

# check pre-specified periods --------------------------
test_that("period_apply works with pre-specified periods", {
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[1,]),
    filter(
      rwtbl, 
      Month %in% month.name, 
      ObjectSlot == slot_agg_matrix[1,]$slot
    ) %>%
      group_by(Year)
  )
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[2,]),
    rwtbl %>%  
      filter(Month %in% "December", ObjectSlot == slot_agg_matrix[2,]$slot) %>%
      group_by(Year)
  )
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[3,]),
    filter(rwtbl, Month %in% "July", ObjectSlot == slot_agg_matrix[3,]$slot) %>%
      group_by(Year)
  )
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[4,]),
    filter(rwtbl, ObjectSlot == slot_agg_matrix[4,]$slot) %>%
      group_by(Year, Month)
  )
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[5,]),
    filter(rwtbl, ObjectSlot == slot_agg_matrix[5,]$slot) %>%
      mutate(ym = zoo::as.yearmon(Timestep)) %>%
      mutate(Year = ym_get_wateryear(ym)) %>%
      select(-ym) %>%
      # drop the last year off
      filter(Year < max(Year)) %>%
      group_by(Year)
  )
  
  # also want to check water year calc for different wy tolerance levels
  # don't filter any off
  options(rwdataplyr.wy_month_tol = 0)
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[5,]),
    filter(rwtbl, ObjectSlot == slot_agg_matrix[5,]$slot) %>%
      mutate(ym = zoo::as.yearmon(Timestep)) %>%
      mutate(Year = ym_get_wateryear(ym)) %>%
      select(-ym) %>%
      group_by(Year)
  )
  
  # filter off first and last WY since they aren't full
  options(rwdataplyr.wy_month_tol = 11)
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[5,]),
    filter(rwtbl, ObjectSlot == slot_agg_matrix[5,]$slot) %>%
      mutate(ym = zoo::as.yearmon(Timestep)) %>%
      mutate(Year = ym_get_wateryear(ym)) %>%
      select(-ym) %>%
      # drop first and last years off (they don't have full 12 months of data)
      filter(Year < max(Year), Year > min(Year)) %>%
      group_by(Year)
  )
})

# check custom functions -------------------------------
slot_agg_matrix <- data.frame(matrix(c(
  "KeySlots.rdf", "Mead.Pool Elevation", "summer", "max", ">=", "1100", 
    "peGt1100",
  "KeySlots.rdf", "Powell.Outflow", "djf", "sum", "none", "none", "djrRel"
), ncol = 7, byrow = TRUE), stringsAsFactors = FALSE)

colnames(slot_agg_matrix) <- c("file", "slot", "period", "summary", "eval", 
                               "t_s", "variable")

# **** add these to vignette

# globally defined, b/c user would be adding it to the global workspace
summer <<- function()
{
  list(
    fun = function(x) x, 
    filter_months = c("July", "August", "May"), 
    group_tbl = c("Year")
  )
}

# the previous year to go with Jan and Feb of the current year
djf <<- function()
{
  djf_convert <- function(rwtbl)
  {
    rwtbl %>%
      dplyr::mutate_at(
        "Timestep", 
        .funs = dplyr::funs("ym" = zoo::as.yearmon)
      ) %>%
      # can use the ym_get_wateryear b/c djf are all in same water year
      dplyr::mutate_at("ym", .funs = dplyr::funs("Year" = ym_get_wateryear)) %>%
      dplyr::select(-dplyr::one_of("ym"))
  }
  
  list(
    fun = djf_convert, 
    filter_months = month.name[c(12, 1, 2)], 
    group_tbl = c("Year")
  )
  
}

on.exit(rm(summer, djf, envir = globalenv()))

test_that("custom functions work for period_apply", {
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[1,]),
    rwtbl %>% 
      filter(ObjectSlot == slot_agg_matrix[1,]$slot, 
             Month %in% summer()$filter_months) %>%
      group_by(Year)
  )
  
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[2,]),
    rwtbl %>% 
      filter(ObjectSlot == slot_agg_matrix[2,]$slot, 
             Month %in% djf()$filter_months) %>%
      mutate(ym = zoo::as.yearmon(Timestep)) %>%
      mutate(Year = ym_get_wateryear(ym)) %>%
      select(-ym) %>%
      group_by(Year)
  )
})
