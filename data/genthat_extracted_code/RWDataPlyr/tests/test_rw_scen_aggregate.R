context("test `rw_scen_aggregate()`")
library(dplyr)

rwa <- rwd_agg(read.csv(
  system.file("extdata/rwd_agg_files/passing_aggs.csv", package = "RWDataPlyr"),
  stringsAsFactors = FALSE
))

scens1 <- c("ISM1988_2014,2007Dems,IG,2002", "ISM1988_2014,2007Dems,IG,Most")
scens2 <- c(scens1[1], "nonExisting")
scens3 <- scens1
scenNames <- c("2002", "Most")
names(scens3) <- scenNames
scenPath <- system.file("extdata/Scenario", package = "RWDataPlyr")

# check errors ----------------------------------------
test_that("`rw_scen_aggregate()` arguments verify correctly", {
  expect_error(
    rw_scen_aggregate(scens2, rwa, scenPath),
    paste0("The following scenario directories do not exist:\n",
           file.path(normalizePath(scenPath), "nonExisting")
    ),
    fixed = TRUE
  )
  expect_error(rw_scen_aggregate(scens1, rwa, "~/apath/that/doesnt/exist"))
  expect_error(
    rw_scen_aggregate(scens1, rwa, c(".", "~")),
    "`scen_dir` should only have a length of 1.",
    fixed = TRUE
  )
  expect_error(
    rw_scen_aggregate(scens1, as.data.frame(rwa), scenPath),
    "In `rw_scen_aggregate()`, `agg` must be a `rwd_agg` object.",
    fixed = TRUE
  )
  expect_error(
    rw_scen_aggregate(scens3, rwa, scenPath, scen_names = scenNames),
    "In `rw_scen_aggregate()`, `scenarios` have `names()`, so `scen_names` should not be specified.",
    fixed = TRUE
  )
  expect_error(rw_scen_aggregate(scens3, rwa, scenPath, errors_are = "zeros"))
  expect_error(
    rw_scen_aggregate(
      scens3, 
      rwa, 
      scenPath, 
      file = c("this.csv", "that.feather")
    ),
    "In `rw_scen_aggregate()`, `file` should have a length of 1.",
    fixed = TRUE
  )
  expect_error(
    rw_scen_aggregate(scens3, rwa, scenPath, file = c("this.that")),
    "In `rw_scen_aggregate()`, `file` should have a .csv, .feather, or .txt extension.",
    fixed = TRUE
  )
  expect_error(
    rw_scen_aggregate(scens3, rwa, scenPath, file = c("invalid/loc/ofile.csv")),
    "In `rw_scen_aggregate()`, `file` should point to a valid location.",
    fixed = TRUE
  )
  expect_error(
    rw_scen_aggregate(scens1, rwa, scenPath, scen_names = scenNames[1]),
    "In `rw_scen_aggregate()`, `scenarios` and `scen_names` must have the same length.",
    fixed = TRUE
  )
})

# check data ------------------------------------------
t1 <- rdf_aggregate(rwa, file.path(scenPath, scens1[1]), scenNames[1])
t2 <- rdf_aggregate(rwa, file.path(scenPath, scens1[2]), scenNames[2]) 
t3 <- bind_rows(t1, t2)

test_that("`rw_scen_aggregate()` returns proper data", {
  expect_is(
    tmp <- rw_scen_aggregate(scens3, agg = rwa, scen_dir = scenPath),
    "tbl_df"
  )
  
  expect_equivalent(
    tmp %>% 
      arrange(Year, Month, TraceNumber, Scenario, Variable),
    t3 %>% 
      arrange(Year, Month, TraceNumber, Scenario, Variable)
  )
  expect_setequal(names(attributes(tmp)), names(attributes(t1)))
  expect_identical(attr(tmp, "rwd_agg"), attr(t1, "rwd_agg"))
  expect_identical(attr(tmp, "rwd_agg"), attr(t2, "rwd_agg"))
  expect_identical(attr(tmp, "rdf_atts")[[scenNames[1]]], attr(t1, "rdf_atts"))
  expect_identical(attr(tmp, "rdf_atts")[[scenNames[2]]], attr(t2, "rdf_atts"))
  expect_identical(
    attr(tmp, "scen_folder"), 
    rbind(attr(t1, "scen_folder"), attr(t2, "scen_folder"))
  )
})

# compare to getDataForAllScens() ----------------------------
context("compare `rw_scen_aggregate()` to `getDataForAllScens()`")
sal <- slot_agg_list(system.file(
  "extdata/sat_all_aggs.csv", 
  package = "RWDataPlyr"
))
ra <- read_rwd_agg(
  system.file(
    "extdata/rwd_agg_files/rwd_agg_all_aggs.csv", 
    package = "RWDataPlyr"
  )
)

expect_warning(
  t1 <- getDataForAllScens(
    scens1, 
    scenNames, 
    sal, 
    scenPath
  )
)

t2 <- rw_scen_aggregate(scens3, ra, scenPath)
allVars <- ra$variable

test_that("returned data is the same", {
  for (var in allVars) {
    expect_equivalent(
      t1 %>%
        filter(Variable == var) %>%
        arrange(Scenario, Trace, Year) %>%
        select(Value),
      t2 %>%
        ungroup() %>%
        filter(Variable == var) %>%
        arrange(Scenario, TraceNumber, Year) %>%
        select(Value),
      info = var
    )
  }
})

# compare monthly data ----------------------------

expect_warning(
  t1 <- getDataForAllScens(
    scens1, 
    scenNames, 
    list(list(rdf = "KeySlots.rdf", slots = "all")), 
    scenPath
  )
)

t2 <- rw_scen_aggregate(scens3, rwd_agg(rdfs = "KeySlots.rdf"), scenPath)

test_that("monthly data are equal", {
  expect_equivalent(
    t1 %>% 
      filter(Variable == "Mead.Pool Elevation_Monthly_1") %>%
      arrange(Scenario, Trace, Year) %>%
      select(Value),
    t2 %>%
      ungroup() %>%
      filter(Variable == "mead_pe") %>%
      arrange(Scenario, TraceNumber, Year) %>%
      select(Value)
  )
  
  expect_equivalent(
    t1 %>% 
      filter(Variable == "Powell.Outflow_Monthly_1") %>%
      arrange(Scenario, Trace, Year) %>%
      select(Value),
    t2 %>%
      ungroup() %>%
      filter(Variable == "powell_outflow") %>%
      arrange(Scenario, TraceNumber, Year) %>%
      select(Value)
  )
})

context("test the rw_scen_aggregate helpers")

test_that("`get_scen_names()` works with different combinations", {
  scens <- c("DNF,CT", "DNF,2007Dems")
  scen_names <- c("scen1", "scen2")
  scen_named <- scens
  names(scen_named) <- scen_names
  s2 <- scens
  names(s2) <- s2
  
  expect_identical(RWDataPlyr:::get_scen_names(scens, scen_names), scen_named)
  expect_identical(RWDataPlyr:::get_scen_names(scens, NULL), s2)
  expect_error(RWDataPlyr:::get_scen_names(scen_named, scen_names))
  expect_identical(RWDataPlyr:::get_scen_names(scen_named, NULL), scen_named)
})
