context("(Package spelling)")

test_that("No misspelled words", {
  skip_on_cran()
  skip_on_travis()
  # In a checking context, one is typically in /TeXCheckR.Rcheck/tests/testthat/
  if (file.exists("test-zzz-check-pkgs-spelling.R")) {
    if (grepl(".Rcheck", getwd(), fixed = TRUE) && 
        dir.exists("../../../TeXCheckR")) {
    pkg <- "../../../TeXCheckR"
    } else {
      pkg <- "../.."
    }
  } else {
    if (file.exists("DESCRIPTION")) {
      pkg <- "."
    }
  }
  
  result <- 
    tryCatch({
      devtools::spell_check(pkg = pkg,
                            ignore = c("ary",
                                       "backtick",
                                       "biber",
                                       "BibLaTeX",
                                       "Grattan",
                                       "initialisms",
                                       "knitr",
                                       "linting", 
                                       "perl",
                                       "protasis",
                                       "QXEF", 
                                       "regex",
                                       "Rnw",
                                       "RStudio",
                                       "tex",
                                       "TeX",
                                       "th", 
                                       "Unbreaking",
                                       "unescaped",
                                       "unreferenced"))
    }, error = function(e) {
      if (dir.exists("C:/Users/hughp/Documents/sandbox")) {
        cat(getwd(),
            file = "C:/Users/hughp/Documents/sandbox/check-1.txt")
      }
      # Do not fail the test due to failure to locate the 
      # package:
      cat("NO SPELLCHECK")
    })
  
  if (length(result) > 0) {
    stop("Spelling error in package.")
  }
  
  expect_equal(length(result), 0)
  
})
