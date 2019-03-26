context("Spellchecker")

test_that("Error if not interactive", {
  skip_if(interactive())
  expect_error(check_spelling(rstudio = TRUE), regexp = "interactive")
})

test_that("School funding report checks out", {
  expect_null(check_spelling("./SchoolFunding/SchoolFunding.tex",
                             known.correct = c("SRS", "SE.XPD.TOTL.GD.XS", "WDI", "SSNP", "underfunded",
                                               "overfund[a-z]*", "NMS", "WPI", "DET", "phas", "NP",
                                               "SATs", "ENG", "th", "stds", "RCTs", "CAGR"),
                             ignore.lines = 1551))
})

test_that("Check spelling of multiple input document", {
  expect_error(check_spelling("./spellcheck_multi_input/spellcheck_multi_input.tex"),
               regexp = "failed on above line")
})

test_that("Abbreviations", {
  expect_error(check_spelling("spellcheck-abbrevs.tex"))
})

test_that("Initalisms", {
  expect_null(check_spelling("./spelling/abbrev/abbrev-defd-ok.tex"))
  expect_null(check_spelling("./spelling/abbrev/abbrev-defd-ok-2.tex"))
  expect_equal(extract_validate_abbreviations(readLines("./spelling/abbrev/abbrev-defd-ok-stopwords.tex")),
               c("QXFEoC", "AIAS"))
  expect_equal(extract_validate_abbreviations(readLines("./spelling/abbrev/abbrev-plural.tex")),
               c("LVR"))
})

test_that("Initialism checking doesn't fail if at start of sentence", {
  expect_null(check_spelling("./spelling/abbrev/abbrev-at-line-start.tex"))
})

test_that("Add to dictionary, ignore spelling in", {
  expect_error(check_spelling("./spelling/add_to_dictionary-wrong.tex"), regexp = "[Ss]pellcheck failed")
  expect_error(check_spelling("./spelling/ignore_spelling_in-wrong.tex", pre_release = FALSE),
               regexp = "[Ss]pellcheck failed")

  expect_null(check_spelling("./spelling/add_to_dictionary-ok.tex"))
  expect_null(check_spelling("./spelling/ignore_spelling_in-ok.tex", pre_release = FALSE))
  expect_null(check_spelling("./spelling/ignore_spelling_in-ok-2.tex", pre_release = FALSE))

  expect_error(check_spelling("./spelling/ignore_spelling_in-ok.tex"),
               regexp = "pre_release = TRUE")
  
  expect_null(check_spelling("./spelling/add_to_dictionary-ok-req-hunspell.tex",
                             pre_release = FALSE))
})

test_that("Ignore spelling in input", {
  expect_error(check_spelling("./spelling/input/a.tex", pre_release = TRUE), 
               regexp = "Spellcheck failed on above line with .asofihsafioh")
  expect_null(check_spelling("./spelling/input/a.tex", pre_release = FALSE))
  expect_null(check_spelling("./spelling/input/b.tex", pre_release = TRUE))
})

test_that("Stop if present", {
  expect_error(check_spelling("./stop_if_present/should-stop.tex"), regexp = "skillset")
  expect_error(check_spelling("./stop_if_present/should-stop-2.tex"), regexp = "skillset")
  expect_error(check_spelling("./stop_if_present/stop_even_if_added.tex"), regexp = "skillset")
  expect_error(check_spelling("./stop_if_present_inputs/stop-if-held-in-inputs.tex"), regexp = "skillset")
  expect_error(check_spelling("./stop_if_present/should-stop-3.tex"), regexp = "percent")
  expect_null(check_spelling("./stop_if_present/should-not-stop.tex"))
})

test_that("Lower-case governments should error", {
  expect_error(check_spelling("./spelling/Govt/NSWgovt.tex"), regexp = "uppercase G")
  expect_error(check_spelling("./spelling/Govt/ACTgovt.tex"), regexp = "uppercase G")
  expect_error(check_spelling("./spelling/Govt/NTgovt.tex"), regexp = "uppercase G")
  expect_error(check_spelling("./spelling/Govt/Queenslandgovt.tex"), regexp = "uppercase G")
  expect_error(check_spelling("./spelling/Govt/WAgovt.tex"), regexp = "uppercase G")
})

test_that("Some lower-case governments should not", {
  expect_null(check_spelling("./spelling/Govt/ok-as-adj.tex"))
  expect_null(check_spelling("./spelling/Govt/ok-as-adj2.tex"))
})

test_that("'percent' error should only occur in a Grattan report", {
  percent_spellcheck.tex <- tempfile(fileext = ".tex")
  
  writeLines(
    text = c("\\documentclass{article}", 
             "\\begin{document}",
             "The word percent is not invalid.",
             "\\end{document}"),
    con = percent_spellcheck.tex
  )
  
  expect_null(check_spelling(percent_spellcheck.tex))
})

test_that("Includepdf doesn't result in a failed include message", {
  expect_null(check_spelling("./spelling/includepdf-ok.tex"))
})

test_that("Should error", {
  expect_error(check_spelling("spelling/misc-error.tex"), regexp = "Spellcheck")
  expect_error(check_spelling("spelling/typo-suggest.tex"), regex = "Spellcheck")
})

test_that("RStudio API", {
  skip_on_cran()
  skip_if_not(interactive())
  expect_error(check_spelling("spelling/typo-suggest.tex", rstudio = TRUE),
               regexp = "Spellcheck")
  expect_false(Sys.info()['sysname'] %in% "Windows" &&
                  utils::readClipboard() != "Sydney")
})

test_that("Inputs should respect dict_lang at top level", {
  expect_null(check_spelling("spelling/dict-lang-input/root.tex", 
                             dict_lang = "en_US"))
})

test_that("Lonesome footcites", {
  footcite.tex <- tempfile(fileext = ".tex")
  writeLines(c("\\documentclass{article}",
               "\\begin{document}", 
               "A claim.\\footnote{textcite{not-yet-cited}.}",
               "\\end{document}",
               ""),
             footcite.tex)
  expect_error(check_spelling(footcite.tex), regexp = "[Ss]pellcheck")
})

test_that("Multi-ignore", {
  multi.tex <- tempfile(fileext = ".tex")
  writeLines(c("\\documentclass{article}",
               "\\begin{document}", 
               "A claim.\\mymulticmd{okay}{sudifhds}{ihsodfidoshf}",
               "\\end{document}",
               ""),
             multi.tex)
  expect_null(check_spelling(multi.tex, ignore_spelling_in_nth = list("mymulticmd" = 2:3)))
  expect_error(check_spelling(multi.tex, ignore_spelling_in_nth = list("mymulticmd" = c(1L, 3L))), 
               regexp = "sudifhds")
})

test_that("Like Energy-2018-WholesaleMarketPower", {
  expect_null(check_spelling("spelling/chapref/in-comments.tex",
                             ignore_spelling_in_nth = list(Chaprefrange = 1:2)))
})

test_that("Spellcheck verb", {
  expect_null(check_spelling("spelling/verb.tex"))
})

test_that("pre-release + add to dictionary outside", {
  tempfile.tex <- tempfile(fileext = ".tex")
  writeLines(c("\\documentclass{article}", 
               "% add_to_dictionary: ok", 
               "\\begin{document}", 
               "% add_to_dictionary: notok", 
               "Not ok.",
               "\\end{document}"), 
             tempfile.tex)
  expect_null(check_spelling(tempfile.tex, pre_release = FALSE))
  expect_error(check_spelling(tempfile.tex, pre_release = TRUE),
               regexp = "When pre_release = TRUE, % add_to_dictionary: lines must not be situated outside the document preamble.",
               fixed = TRUE)
})

test_that("known.correct.fixed", {
  tempfile.tex <- tempfile(fileext = ".tex")
  writeLines(c("\\documentclass{article}", 
               "% add_to_dictionary: ok", 
               "\\begin{document}",
               "QETYY-high.",
               "\\end{document}"), 
             tempfile.tex)
  expect_null(check_spelling(tempfile.tex, pre_release = FALSE, known.correct.fixed = "QETYY"))
})




