context("Footnote typography")

test_that("Valid typography passes", {
  expect_null(check_footnote_typography("valid-footnote-typography.tex"))
  expect_null(check_footnote_typography("./fnote-typogr/ok-ends-with-dbl-quote.tex"))
  expect_null(check_footnote_typography("./extract/road-congestion.tex"))
  expect_null(check_footnote_typography("./fnote-typogr/ok-end-itemize.tex"))
})

test_that("Invalid typography stops", {
  expect_error(check_footnote_typography("invalid-footnote-typography.tex"))
  expect_error(check_footnote_typography("./fnote-typogr/doesnt-end-with-period.tex"),
               regexp = "does not end with full stop")
  expect_error(check_footnote_typography("./fnote-typogr/doesnt-end-with-period-multiline.tex"),
               regexp = "does not end with full stop")
  expect_error(check_footnote_typography("./fnote-typogr/notok-end-itemize.tex"),
               regexp = "does not end with full stop")
  
  expect_error(check_footnote_typography("./fnote-typogr/full-stop-after.tex"),
               regexp = "[pP]unctuation after footnote")
  expect_error(check_footnote_typography("./fnote-typogr/full-stop-after-fcite.tex"),
               regexp = "[pP]unctuation mark after footcite")
  
  expect_error(check_footnote_typography("./fnote-typogr/colon-then-equation.tex"),
               regexp = "[pP]unctuation after footnotemark")
  
  options("TeXCheckR.capture.output" = TRUE)
  expect_output(tryCatch(check_footnote_typography("./fnote-typogr/colon-then-equation.tex"),
                         error = function(e) NULL),
                "14:")
  options("TeXCheckR.capture.output" = FALSE)
  
  
})

test_that("Space before footnotes.", {
  # a1 b1 b2  Test  Expect  Description
  #  T  T  T  1     PASS    Tabbed footnote on own line: b2 protects
  #  T  T  F  2     FAIL    Tabbed footnote without protection.
  #  T  F  T  3     FAIL    Ordinary space (and txt) before fn % irrelevant -- protective space has no effect
  #  T  F  F  4     FAIL    Ordinary space (and txt) before fn: lazy dog \footnote
  #  F  T  T  5     PASS    Non-tabbed footnote \footnote at start of text: b2 protects
  #  F  T  F  6     FAIL    Non-tabbed footnote without protection
  #  F  F  T  7     PASS    No footnote
  #  F  F  F  8     PASS    No footnote
  expect_null(check_footnote_typography("./fnote-typogr/1.tex"))
  expect_error(check_footnote_typography("./fnote-typogr/2.tex"))
  expect_error(check_footnote_typography("./fnote-typogr/3.tex"))
  expect_error(check_footnote_typography("./fnote-typogr/4.tex"))
  expect_null(check_footnote_typography("./fnote-typogr/5.tex"))
  expect_error(check_footnote_typography("./fnote-typogr/6.tex"))
  expect_null(check_footnote_typography("./fnote-typogr/7.tex"))
  expect_null(check_footnote_typography("./fnote-typogr/8.tex"))
  expect_null(check_footnote_typography("./fnote-typogr/isOK.tex"))
})

test_that("Works for footcite mishaps too", {
  expect_error(check_footnote_typography("./fnote-typogr/bad.tex"))
})

test_that("Leading space in footnote text", {
  expect_error(check_footnote_typography("./fnote-typogr/space-footnotetext.tex"))
})

test_that("Two footnotes same line will error", {
  expect_error(check_footnote_typography("./fnote-typogr/two-footnotes-same-line.tex"),
               regexp = "cannot occur twice")
})

test_that("Footcites and footcite in same document don't get confused about dots after", {
  expect_error(check_footnote_typography("./fnote-typogr/dot-after-footcites.tex"), 
               regexp = "Punctuation mark")
})

test_that("Hypercorrected % after footnote", {
  options("TeXCheckR.halt_on_error" = TRUE)
  tempf <- tempfile(fileext = ".tex")
  writeLines(c("\\documentclass{article}",
               "\\begin{document}", 
               "\\% not appropriate here:\\footnote{", 
               "Because it smudges the sentences together.}%", 
               "\\end{document}", 
               ""), 
             tempf)
  
  expect_error(check_footnote_typography(tempf))
  options("TeXCheckR.halt_on_error" = FALSE)
})

test_that("Don't panic", {
  options("TeXCheckR.halt_on_error" = TRUE)
  expect_null(check_footnote_typography("fnote-typogr/no-panic.tex"))
  options("TeXCheckR.halt_on_error" = FALSE)
})


