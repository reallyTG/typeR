context("test `rwd_agg` class")

df <- read.csv(system.file(
  "extdata/rwd_agg_files/passing_aggs.csv", 
  package = "RWDataPlyr"
), stringsAsFactors = FALSE)

df_fact <- read.csv(system.file(
  "extdata/rwd_agg_files/passing_aggs.csv", 
  package = "RWDataPlyr"
))

# check construction --------------
test_that("rwd_agg is created properly", {
  expect_s3_class(tmp <- rwd_agg(df), c("rwd_agg", "data.frame"))
  expect_equal(dim(tmp), dim(df))
  expect_equal(colnames(tmp), colnames(df))
  expect_true(is_rwd_agg(tmp))
  expect_identical(is_rwd_agg(tmp), is.rwd_agg(tmp))
  # check the other creation method
  expect_s3_class(
    tmp <- rwd_agg(rdfs = c("this.rdf", "that.rdf")), 
    c("rwd_agg", "data.frame")
  )
  expect_equal(dim(tmp), c(2, 7))
  expect_equal(colnames(tmp), colnames(df))
  expect_true(is_rwd_agg(tmp))
  expect_identical(is_rwd_agg(tmp), is.rwd_agg(tmp))
})

# check errors --------------------
test_that("rwd_agg validation fails properly", {
  expect_error(
    rwd_agg(df[,c(1:5, 7, 6)]), 
    paste0("The `colnames(x)` must be exactly: ", 
           paste(colnames(df), collapse = ", ")), 
    fixed = TRUE
  )
  expect_error(rwd_agg(df_fact), "No columns should be factors.")
  expect_error(
    rwd_agg(rdfs = c("yes.rdf", "no.csv", "maybe.nc")), 
    "All `file` extensions should be: rdf",
    fixed = TRUE
  )
  expect_error(rwd_agg(df[c(1:5,1),]), "All `variable`s should be unique.")
  df2 <- df
  df2$summary[4] <- "max"
  expect_error(
    rwd_agg(df2), 
    "If the `period` is specified as 'asis', then the `summary` must be `NA`."
  )
  df2 <- df
  df2$summary[1] <- NA
  expect_error(
    rwd_agg(df2),
    "If the `period` is 'CY', or 'WY', then the `summary` should not be `NA`."
  )
  df2 <- df
  df2$eval[2] <- "%%"
  expect_error(
    rwd_agg(df2),
    paste0(
      "'%%' is not a valid `eval` value.\n",
      "The `eval` column in the slot agg matrix should either be\n",
      "`NA` or one of the 'Compare' S4 group generics. See ?S4groupGeneric."
    ),
    fixed = TRUE
  )
  df2 <- df
  df2$t_s[2] <- "else"
  expect_error(
    rwd_agg(df2),
    paste0(
      "'else' is not a valid `t_s` value.\n",
      "The `t_s` column in the slot agg matrix should either be\n",
      "`NA` or a numerical value."
    ),
    fixed = TRUE
  )
  df2 <- df
  df2$t_s[1] <- NA
  expect_error(
    rwd_agg(df2),
    paste0(
      "When the `eval` column is a comparison function, the `t_s` column\n",
      "must be a numerical value."
    ),
    fixed = TRUE
  )
  expect_false(is_rwd_agg(df))
  expect_identical(is_rwd_agg(df), is.rwd_agg(df))
  expect_error(
    rwd_agg(df, rdfs = c("KeySlot.rdf", "that.rdf")),
    "When creating a `rwd_agg`, specify either `x` or `rdfs`, not both.",
    fixed = TRUE
  )
})

context("check the as.rwd_agg methods")
# check as methods ----------------
mat <- as.matrix(df)
rwd_list <- list(
  file = df$file[1],
  slot = df$slot[1],
  period = df$period[1],
  summary = df$summary[1],
  eval = df$eval[1],
  t_s = df$t_s[1],
  variable = df$variable[1]
)
rwd_tbl <- tibble::as_tibble(df)

test_that("as.rwd_agg methods work", {
  expect_identical(as.rwd_agg(mat), rwd_agg(df))
  expect_identical(as_rwd_agg(rwd_list), rwd_agg(df[1,]))
  # default should work
  expect_identical(as_rwd_agg(rwd_tbl), rwd_agg(df))
  l2 <- rwd_list
  l2$period <- c("cy", "eocy")
  expect_error(
    as.rwd_agg(l2),
    "When attempting to coerce a `list` to a `rwd_agg`, all entries must have the same length.",
    fixed = TRUE
  )
})

# check combine methods ----------------
context("check the rbind.rwd_agg cbind.rwd_agg methods")

df1 <- data.frame(
  file = "KeySlots.rdf",
  slot = "Powell.Pool Elevation",
  period = "wy",
  summary = "min",
  eval = "<",
  t_s = 3550,
  variable = "powellLt3550",
  stringsAsFactors = FALSE
)
ra1 <- rwd_agg(df1)

ra2 <- rwd_agg(read.csv(
  system.file(
    "extdata/rwd_agg_files/passing_aggs.csv",
    package = "RWDataPlyr"
  ),
  stringsAsFactors = FALSE
))
df2 <- as.data.frame(ra2)

test_that("rbind method works on rwd_agg", {
  expect_s3_class(tmp <- rbind(ra1, ra2), c("rwd_agg", "data.frame"))
  expect_equal(dim(tmp), c(nrow(ra1) + nrow(ra2), 7))
  expect_true(all(tmp$variable %in% c(ra1$variable, ra2$variable)))
  expect_identical(tmp, as_rwd_agg(rbind(df1, df2)))
})

test_that("rbind method fails properly on rwd_agg", {
  expect_error(rbind(ra1, ra1))
})

test_that("cbind method fails on rwd_agg objects", {
  expect_error(
    cbind(ra1, ra2), 
    "`rwd_agg` objects cannot be combined by columns."
  )
})

# check the slotname function -----------------------
testSlots <- c("Mead.Pool Elevation", "Powell.Outflow", 
               "Morrow Point.Pool Elevation", "Blue Mesa.Evaporation", 
               "AggObject:WaterUser.Depletion Requested")
testAnswers <- c("mead_pe", "powell_outflow", "morrow_point_pe", 
                 "blue_mesa_evaporation", 
                 "aggobject_wateruser_depletion_requested")
test_that("`obj_slot_name()` creates names as expected", {
  expect_equal(RWDataPlyr:::obj_slot_name(testSlots), testAnswers, fixed = TRUE)
  expect_equal(RWDataPlyr:::obj_slot_name(testSlots[1]), testAnswers[1])
  expect_equal(RWDataPlyr:::obj_slot_name(testSlots[3]), testAnswers[3])
})

# check rwd_agg_build_all() ----------------------------
keytbl <- expect_warning(rdf_to_rwtbl(keyRdf))

test_that("`rwd_agg_build_all()` constructs proper rwd_agg object", {
  expect_s3_class(
    tmp <- RWDataPlyr:::rwd_agg_build_all(keytbl, "KeySlots.rdf"), 
    c("rwd_agg", "data.frame")
  )
  expect_identical(
    tmp,
    rwd_agg(data.frame(
      file = "KeySlots.rdf",
      slot = c("Mead.Pool Elevation", "Powell.Outflow"),
      period = "asis",
      summary = NA,
      eval = NA, 
      t_s = NA,
      variable = c("mead_pe", "powell_outflow"),
      stringsAsFactors = FALSE
    ))
  )
})

