context("test rdf_aggregate()")
library(dplyr)

ra1 <- read_rwd_agg(
  system.file("extdata/rwd_agg_files/passing_aggs.csv", package = "RWDataPlyr")
)
  
dnfmost_dir <- system.file(
  "extdata/Scenario/ISM1988_2014,2007Dems,IG,Most", 
  package = "RWDataPlyr"
)

keyrwtbl <- expect_warning(rdf_to_rwtbl(keyRdf))
sysrwtbl <- expect_warning(rdf_to_rwtbl(sysRdf))

# test rdf_aggregate() structure -------------------------
test_that("test rdf_aggregate() structure", {
  expect_s3_class(
    tmp <- rdf_aggregate(
      ra1,
      rdf_dir = dnfmost_dir,
      scenario = "DNFMost",
      keep_cols = FALSE
    ),
    c("tbl_df", "data.frame")
  )
  
  # check attribute has the ra1
  expect_identical(
    attributes(tmp)$rwd_agg, ra1
  )
  
  expect_identical(
    attributes(tmp)$scen_folder,
    data.frame(
      scenario = "DNFMost", 
      folder = normalizePath(dnfmost_dir), 
      stringsAsFactors = FALSE
    )
  )
  
  # check that it contains the same attributes as keyRdf
  expect_identical(
    attributes(tmp)$rdf_atts$KeySlots.rdf$mrm_config_name, 
    attributes(keyrwtbl)$mrm_config_name
  )
  expect_identical(
    attributes(tmp)$rdf_atts$KeySlots.rdf$owner, 
    attributes(keyrwtbl)$owner
  )
  expect_identical(
    attributes(tmp)$rdf_atts$KeySlots.rdf$create_date, 
    attributes(keyrwtbl)$create_date
  )
  expect_identical(
    attributes(tmp)$rdf_atts$KeySlots.rdf$description, 
    attributes(keyrwtbl)$description
  )
  expect_identical(
    attributes(tmp)$rdf_atts$KeySlots.rdf$n_traces, 
    attributes(keyrwtbl)$n_traces
  )
  # and check the sysRdf
  expect_identical(
    attributes(tmp)$rdf_atts$SystemConditions.rdf$mrm_config_name, 
    attributes(sysrwtbl)$mrm_config_name
  )
  expect_identical(
    attributes(tmp)$rdf_atts$SystemConditions.rdf$owner, 
    attributes(sysrwtbl)$owner
  )
  expect_identical(
    attributes(tmp)$rdf_atts$SystemConditions.rdf$create_date, 
    attributes(sysrwtbl)$create_date
  )
  expect_identical(
    attributes(tmp)$rdf_atts$SystemConditions.rdf$description, 
    attributes(sysrwtbl)$description
  )
  expect_identical(
    attributes(tmp)$rdf_atts$SystemConditions.rdf$n_traces, 
    attributes(sysrwtbl)$n_traces
  )
  # check that it contains all of the above variables
  expect_true(
    all(as.character(levels(as.factor(tmp$Variable))) %in% ra1$variable)
  )
  expect_true(
    all(ra1$variable %in% as.character(levels(as.factor(tmp$Variable))))
  )
  # check that it contains expected colnames
  expect_equal(
    colnames(tmp), 
    c("Year", "Month", "TraceNumber", "Scenario", "Variable", "Value")
  )
  # check that annual slots only containd December; 
  # check that monthly slots contains all months
  expect_true(all(
    (tmp %>% 
      filter(
        Variable %in% 
          c("peLt1000", "peEocy", "julyRel", "pwyRel", "short", "ueb823")
      ))$Month %in%
      "December"
  ))
  
  expect_true(all(
    month.name %in% (filter(tmp, Variable %in% c("pMonthlyGt400k")))$Month
  ))
})

# check that the "all" keyword gets all the data --------------------------
test_that("'all' keyword gets all data", {
  expect_is(
    tmp <- rdf_aggregate(
      rwd_agg(rdfs = "KeySlots.rdf"),
      rdf_dir = dnfmost_dir,
      scenario = "DNFMost",
      keep_cols = FALSE
    ),
    c("tbl_df")
  )
  expect_true(all(as.character(levels(as.factor(tmp$Variable))) %in% 
                    c("powell_outflow", "mead_pe")))
  
  # check function when the rwd_agg includes "all" and summary slots from the
  # same rdf
  expect_is(
    tmp2 <- rdf_aggregate(
      rbind(ra1, rwd_agg(rdfs = "KeySlots.rdf")),
      rdf_dir = dnfmost_dir,
      scenario = "DNFMost",
      keep_cols = FALSE
    ),
    c("tbl_df")
  )
  expect_true(all(as.character(levels(as.factor(tmp$Variable))) %in%
                    c("powell_outflow", "mead_pe", ra1$variable)))
  
  # compare the two data, they should be the same
  expect_equal(
    tmp %>% arrange(Year, Month, TraceNumber, Scenario, Variable),
    tmp2 %>% 
      filter(Variable %in% c("powell_outflow", "mead_pe")) %>%
      arrange(Year, Month, TraceNumber, Scenario, Variable)
  )
})

# check handling NaNs -----------------------------------
ss <- c("Shortage.ShortageFlag", "Coordinated Operation.ReducedReleaseFlag")
scenario_dir <- system.file("extdata/Scenario/", package = "RWDataPlyr")
flags_rdf <- expect_warning(
  rdf_to_rwtbl(read.rdf(file.path(scenario_dir, "Flags.rdf"))) %>%
    filter(ObjectSlot %in% ss)
)
short_ra <- rwd_agg(data.frame(
  file = "Flags.rdf", 
  slot = ss, 
  period = "asis", 
  summary = NA, 
  eval = NA, 
  t_s = NA, 
  variable = c("short_flag", "rdc_flag"),
  stringsAsFactors = FALSE
))

test_that("`NaN`s are treated properly in `rdf_aggregate()`", {
  expect_error(rdf_aggregate(
    rwd_agg(rdfs = "Flags.rdf"), 
    rdf_dir = scenario_dir, 
    nans_are = "error"
  ))
  
  expect_error(rdf_aggregate(
    short_ra, rdf_dir = scenario_dir, nans_are = "error"
  ))
  
  expect_is(
    t1 <- rdf_aggregate(short_ra, rdf_dir = scenario_dir, nans_are = "0"),
    "tbl_df"
  )
  # flags that have no NaNs should not be affected
  expect_equal(
    (t1 %>% filter(Variable == "rdc_flag"))$Value,
    (flags_rdf %>% filter(ObjectSlot == ss[2]))$Value
  )
  # converting to 0s should not affect the sum
  expect_equal(
    (t1 %>%
       filter(Variable == "short_flag") %>%
       group_by(Year, Month, TraceNumber) %>%
       summarise(Value = sum(Value)))$Value,
    (flags_rdf %>%
       filter(ObjectSlot == ss[1]) %>%
       group_by(Year, Month, TraceNumber) %>%
       summarise(Value = sum(Value, na.rm = TRUE)))$Value
  )
})

# check handling `find_all_slots` ----------------
ra2 <- rbind(
  ra1[1,],
  rwd_agg(data.frame(
    file = "KeySlots.rdf",
    slot = "Powell.Pool Elevation",
    period = "wy",
    summary = "min",
    eval = "<",
    t_s = 3550,
    variable = "powellLt3550",
    stringsAsFactors = FALSE
  ))
)

test_that("`find_all_slots` parameter fails and gets data correctly", {
  expect_error(
    tmp <- rdf_aggregate(
      ra2,
      rdf_dir = dnfmost_dir
    ),
    paste0(
      "`find_all_slots` is `TRUE`, and the following slots were not found in ",
      "the KeySlots.rdf file:\n",
      paste(paste("   ", "Powell.Pool Elevation"), collapse = "\n")
    )
  )
  
  expect_s3_class(
    tmp <- rdf_aggregate(
      ra2,
      rdf_dir = dnfmost_dir,
      find_all_slots = FALSE
    ),
    c("tbl_df", "data.frame")
  )
  
  expect_setequal(
    as.character(levels(as.factor(tmp$Variable))), 
    c("powellLt3550", "peLt1000")
  )
  tmp <- tmp %>% 
    filter(Variable == "powellLt3550")
  expect_equal(nrow(tmp), 1)
  expect_equal(tmp$TraceNumber, -99)
  expect_equal(tmp$Value, NaN)
  expect_equal(tmp$Year, NaN)
})

# single trace ------------------
trace13_dir <- system.file(
  "extdata/Scenario/T13,CT,IG", 
  package = "RWDataPlyr"
)
t13 <- read.rdf(system.file(
  "extdata/Scenario/T13,CT,IG/KeySlots.rdf", 
  package = "RWDataPlyr"
))
t13pe <- rdf_get_slot(t13, "Mead.Pool Elevation")

test_that("rdf_aggregate() can handle 1 trace of data", {
  expect_s3_class(
    tmp <- rdf_aggregate(ra1, rdf_dir = trace13_dir),
    c("tbl_df", "data.frame")
  )
  
  expect_equal(range(tmp$TraceNumber), c(1, 1))
  
  expect_equivalent(
    tmp %>% 
      filter(Variable == "peEocy") %>% 
      ungroup() %>% 
      select(Value) %>% 
      as.matrix(),
    t13pe[seq(12, nrow(t13pe), 12),, drop = FALSE]
  )
})

# compare the different versions of `rdf_to_tbl()`'s `cpp` parameter ------
test_that("`cpp` parameters don't change results", {
  expect_equal(
    rdf_aggregate(
      rwd_agg(rdfs = "KeySlots.rdf"),
      rdf_dir = dnfmost_dir,
      scenario = "DNFMost",
      keep_cols = FALSE,
      cpp = TRUE
    ),
    expect_warning(rdf_aggregate(
      rwd_agg(rdfs = "KeySlots.rdf"),
      rdf_dir = dnfmost_dir,
      scenario = "DNFMost",
      keep_cols = FALSE,
      cpp = FALSE
    ))
  )
  
  expect_equal(
    rdf_aggregate(
      ra1,
      rdf_dir = dnfmost_dir,
      scenario = "DNFMost",
      keep_cols = FALSE,
      cpp = TRUE
    ),
    expect_warning(rdf_aggregate(
      ra1,
      rdf_dir = dnfmost_dir,
      scenario = "DNFMost",
      keep_cols = FALSE,
      cpp = FALSE
    ))
  )
  
  expect_equal(
    rdf_aggregate(ra1, rdf_dir = trace13_dir, cpp = TRUE),
    expect_warning(rdf_aggregate(ra1, rdf_dir = trace13_dir, cpp = FALSE))
  )
})
