library(RWDataPlyr)
context('check creation of slot aggregation list')

samFail <- matrix(c(
  "KeySlots.rdf", "Powell.Outflow", "Monthly", 10, "powellMothly10",
  "KeySlots.rdf", "Mead.Pool Elevation", "EOCY", NA, "meadMonthly001"),
  ncol = 5, byrow = TRUE
)

n4Warning <- paste(
  "Attempting to convert `iData` to a N x 4 matrix. Results may be unexpected.",
  "Probably better to stop and pass a matrix to `slot_agg_list()`.",
  sep = "\n"
)

n5Warning <- paste(
  "Attempting to convert `iData` to a N x 5 matrix. Results may be unexpected.",
  "Probably better to stop and pass a matrix to `slot_agg_list()`.",
  sep = "\n"
)

# slot_agg_list errors --------------------------
test_that("slot_agg_list returns proper errors", {
  expect_error(
    slot_agg_list(matrix(1:6, ncol = 3)), 
    "`iData` is a matrix with 3 columns. There should either be 4 or 5 columns."
  )
  expect_error(
    slot_agg_list(matrix(1:6, ncol = 6)), 
    "`iData` is a matrix with 6 columns. There should either be 4 or 5 columns."
  )
  expect_error(
    slot_agg_list(1:3), 
    "`iData` is not a matrix, nor can it be converted to an Nx4 or Nx5 matrix"
  )
  expect_error(
    slot_agg_list(1:17),
    "`iData` is not a matrix, nor can it be converted to an Nx4 or Nx5 matrix"
  )
  expect_warning(
    slot_agg_list(
      c('KeySlots.rdf','Mead.Pool Elevation','AnnMax',NA, 'KeySlots.rdf',
        'Powell.Outflow','AnnMin',NA)
    ),
    n4Warning,
    fixed = TRUE
  )
  
  expect_warning(
    slot_agg_list(c('KeySlots.rdf','Mead.Pool Elevation','EOCY',NA)),
    n4Warning,
    fixed = TRUE
  )
  
  expect_warning(
    slot_agg_list(c('KeySlots.rdf','Mead.Pool Elevation','EOCY',NA, "var1",
                    'KeySlots.rdf','Mead.Pool Elevation','EOCY',NA, "var2",
                    'KeySlots.rdf','Mead.Pool Elevation','EOCY',NA, "var3")),
    n5Warning,
    fixed = TRUE
  )
  expect_warning(
    slot_agg_list(c('KeySlots.rdf','Mead.Pool Elevation','EOCY',NA, "var1")),
    n5Warning,
    fixed = TRUE
  )
  expect_error(
    slot_agg_list(file.path("some", "crazy", "file.txt")),
    paste(file.path("some", "crazy", "file.txt"),'does not exist.')
  )
  expect_error(
    slot_agg_list(samFail),
    paste0(
      "The \"Monthly\" aggregation method cannot currently be mixed with other aggregation methods.\n",
      "Please create a seperate slot aggregation list with only the monthly data."
    )
  )
  expect_error(
    slot_agg_list(
      matrix(
        c('KeySlots.rdf','Mead.Pool Elevation','Weird',NA,
          "KeySlots.rdf", "Mead.Pool Elevation", "TooWeird", NA),
        nrow = 2, 
        byrow = TRUE
      )
    ),
    paste0("Invalid aggregation methods:\n    ", 
           paste(c("Weird", "TooWeird"), collapse = ", "), "\n  ",
           paste("Fix the", 2, "aggregation method(s) and try again.")), 
    fixed = TRUE
  )
  expect_error(
    slot_agg_list(
      matrix(
        c('KeySlots.rdf','Mead.Pool Elevation','EOCY',NA,
          "KeySlots.rdf", "Mead.Pool Elevation", "TooWeird", NA),
        nrow = 2, 
        byrow = TRUE
      )
    ),
    paste0("Invalid aggregation methods:\n    ", 
           paste(c("TooWeird"), collapse = ", "), "\n  ",
           paste("Fix the", 1, "aggregation method(s) and try again.")), 
    fixed = TRUE
  )
  
  expect_error(
    slot_agg_list(matrix(
      c('KeySlots.rdf','Mead.Pool Elevation','EOCY',NA, "var1",
        'KeySlots.rdf','Mead.Pool Elevation','EOCY',NA, "var1",
        'KeySlots.rdf','Mead.Pool Elevation','EOCY',NA, "var1"),
      ncol = 5,
      byrow = TRUE
    )),
    "All variable names passed to `slot_agg_list()` must be unique.",
    fixed = TRUE
  )
})


sal <- slot_agg_list(system.file(
  "extdata/SlotAggTable.csv", 
  package = "RWDataPlyr"
))
sam <- matrix(c(
  "KeySlots.rdf", "Mead.Pool Elevation", "EOCY", NA, "meadPe",
  "SystemConditions.rdf", "Shortage.ShortageFlag", "AnnualRaw", 100, "lbShort",
  "KeySlots.rdf", "Powell.Outflow", "AnnualSum", NA, "powellRel"), 
  ncol = 5, 
  byrow = TRUE
)
sal2 <- slot_agg_list(sam)

test_that("format of slot_agg_list is correct", {
  expect_equal(length(sal), 1)
  expect_equal(length(sal[[1]]$rdf), 1)
  expect_equal(length(sal[[1]]$slots), 3)
  expect_equal(nrow(sal[[1]]$annualize), 2)
  expect_equal(ncol(sal[[1]]$annualize), 3)
  expect_equal(length(sal[[1]]$varNames), 3)
  expect_true(all(is.na(sal[[1]]$varNames)))
  
  expect_equal(length(sal2), 2)
  expect_equal(length(sal2[[1]]$rdf), 1)
  expect_equal(length(sal2[[1]]$slots), 2)
  expect_equal(nrow(sal2[[1]]$annualize), 2)
  expect_equal(ncol(sal2[[1]]$annualize), 2)
  expect_equal(length(sal2[[1]]$varNames), 2)
  expect_false(all(is.na(sal2[[1]]$varNames)))
  expect_equal(length(sal2[[2]]$rdf), 1)
  expect_equal(length(sal2[[2]]$slots), 1)
  expect_equal(nrow(sal2[[2]]$annualize), 2)
  expect_equal(ncol(sal2[[2]]$annualize), 1)
  expect_equal(length(sal2[[2]]$varNames), 1)
  expect_false(all(is.na(sal2[[2]]$varNames)))
})

# compare old function to new -----------------------
test_that("createSlotAggList matches slot_agg_list", {
  expect_warning(expect_equivalent(
    createSlotAggList(sam),
    slot_agg_list(sam)
  ))
})
