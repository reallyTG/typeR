context("check the apply_eval function")
library(dplyr)

slot_agg_matrix <- rwd_agg(read.csv(
  system.file("extdata/rwd_agg_files/passing_aggs.csv", package = "RWDataPlyr"),
  stringsAsFactors = FALSE
))[1:5,]

rwtbl <- expect_warning(rdf_to_rwtbl(keyRdf))

# check results --------------------------
test_that("apply_eval works as expected", {
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[1,]) %>%
      RWDataPlyr:::apply_summary(slot_agg_matrix[1,]) %>%
      RWDataPlyr:::apply_eval(slot_agg_matrix[1,]),
    rwtbl %>%
      filter(Month %in% month.name, ObjectSlot == slot_agg_matrix[1,]$slot) %>%
      group_by(Year, TraceNumber, ObjectSlot) %>%
      summarise(Value = min(Value)) %>%
      mutate(Value = as.numeric(Value <= 1000))
  )
  
  expect_equal(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[2,]) %>%
      RWDataPlyr:::apply_summary(slot_agg_matrix[2,]) %>%
      RWDataPlyr:::apply_eval(slot_agg_matrix[2,]),
    rwtbl %>%
      filter(Month %in% "December", ObjectSlot == slot_agg_matrix[2,]$slot) %>%
      select(-Timestep, -Month) %>%
      group_by(Year, TraceNumber)
    
  )
  
  expect_equal(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[3,]) %>%
      RWDataPlyr:::apply_summary(slot_agg_matrix[3,]) %>%
      RWDataPlyr:::apply_eval(slot_agg_matrix[3,]),
    rwtbl %>%
      filter(Month %in% "July", ObjectSlot == slot_agg_matrix[3,]$slot) %>%
      group_by(Year, TraceNumber) %>%
      select(-Timestep, -Month)
  )
  
  expect_equal(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[4,]) %>%
      RWDataPlyr:::apply_summary(slot_agg_matrix[4,]) %>%
      RWDataPlyr:::apply_eval(slot_agg_matrix[4,]),
    filter(rwtbl, ObjectSlot == slot_agg_matrix[4,]$slot) %>%
      group_by(Year, Month, TraceNumber) %>%
      select(-Timestep) %>%
      mutate(Value = as.numeric(as.numeric(Value > 400000)))
  )
  
  expect_identical(
    RWDataPlyr:::apply_period(rwtbl, slot_agg_matrix[5,]) %>%
      RWDataPlyr:::apply_summary(slot_agg_matrix[5,]) %>%
      RWDataPlyr:::apply_eval(slot_agg_matrix[5,]),
    rwtbl %>%
      filter(ObjectSlot == slot_agg_matrix[5,]$slot) %>%
      mutate(ym = zoo::as.yearmon(Timestep)) %>%
      mutate(Year = ym_get_wateryear(ym)) %>%
      select(-ym) %>%
      filter(Year < max(Year)) %>%
      group_by(Year, TraceNumber, ObjectSlot) %>%
      summarise(Value = sum(Value)) %>%
      mutate(Value = Value * 0.001)
  )
})

# check errors --------------------------
sam <- data.frame(matrix(c(
  "KeySlots.rdf", "Mead.Pool Elevation", "cy", "sum", "<=", NA, "peLt1000",
  "KeySlots.rdf", "Mead.Pool Elevation", "cy", "sum", "sum", "1000", "peLt1000",
  "KeySlots.rdf", "Mead.Pool Elevation", "cy", "sum", NA, "weird", "peLt1000"
), ncol = 7, byrow = TRUE), stringsAsFactors = FALSE)

colnames(sam) <- c("file", "slot", "period", "summary", "eval", 
                   "t_s", "variable")

test_that("apply_eval errors properly", {
  expect_error(
    RWDataPlyr:::apply_period(rwtbl, sam[1,]) %>%
      RWDataPlyr:::apply_summary(sam[1,]) %>%
      RWDataPlyr:::apply_eval(sam[1,]),
    paste0(
      "When the `eval` column is a comparison function, the `t_s` column\n",
      "must be a numerical value."
    ),
    fixed = TRUE
  )
  
  expect_error(
    RWDataPlyr:::apply_period(rwtbl, sam[2,]) %>%
      RWDataPlyr:::apply_summary(sam[2,]) %>%
      RWDataPlyr:::apply_eval(sam[2,]),
    paste0(
      "'sum' is not a valid `eval` value.\n",
      "The `eval` column in the slot agg matrix should either be\n",
      "`NA` or one of the 'Compare' S4 group generics. See ?S4groupGeneric."
    ),
    fixed = TRUE
  )
  
  expect_error(
    RWDataPlyr:::apply_period(rwtbl, sam[3,]) %>%
      RWDataPlyr:::apply_summary(sam[3,]) %>%
      RWDataPlyr:::apply_eval(sam[3,]),
    paste0(
      "'weird' is not a valid `t_s` value.\n",
      "The `t_s` column in the slot agg matrix should either be\n",
      "`NA` or a numerical value."
    ),
    fixed = TRUE
  )
})
