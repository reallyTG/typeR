context("Transition analyses")
library(PAutilities)

# Manual legacy test (verified 02/20/2019) --------------------------------

## used `data-raw/hri_version_compare/hri_0_3_6.R` to manually step through
## `get_transition_info` (needed `library(rJava)` first) and stored final
## `prefs` object in rds file to compare against output obtained
## post-installation of matchingMarkets >= 1.0-1 -- All of this is a workaround
## for failed installation of 0.3-6 via
## `devtools::install_version("matchingMarkets", "0.3-6")`.
##
## See "data-raw/hri_version_compare/prefs_old_CREATE.R" for the full code

# rm(list = ls())
# devtools::load_all()
# set.seed(8)
# predictions <- sample(c(0,1), 100, TRUE, c(3, 1))
# references  <- sample(c(0,1), 100, TRUE, c(4,1))
#
# info <- get_transition_info(predictions, references, 10)
# info_old <- readRDS("data-raw/hri_version_compare/prefs_old.rds")
# all.equal(info, info_old)
# all.equal(summary(info), summary(info_old))

testthat::test_that("Transition analyses produce expected output", {
  set.seed(8)
  predictions <- sample(c(0,1), 100, TRUE, c(3, 1))
  references  <- sample(c(0,1), 100, TRUE, c(4,1))

  info <- get_transition_info(predictions, references, 10)

  testthat::expect_equal_to_reference(
    info,
    "transition_info.rds"
  )
  testthat::expect_equal_to_reference(
    summary(info),
    "transition_summary.rds"
  )
})
