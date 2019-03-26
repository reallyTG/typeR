context("check_labels")

test_that("Stops on absent prefixes", {
  expect_error(check_labels("check-labels/label-without-prefix.tex"), 
               regexp = "must contain a prefix")
  
  options("TeXCheckR.capture.output" = TRUE)
  expect_output(tryCatch(check_labels("check-labels/label-without-prefix.tex"),
                         error = function(e) NULL),
                regexp = "4:",
                fixed = TRUE)
  options("TeXCheckR.capture.output" = FALSE)
})

test_that("Stops when chapter prefixes wrong", {
  expect_error(check_labels("./check-labels/chapter-with-wrong-prefix.tex"))
  expect_error(check_labels("./check-labels/chapter-without-label.tex"))
})

test_that("Stops when chapref not used", {
  expect_error(check_labels("./check-labels/chapter-using-Vref.tex"), regexp = "Chapref")
})

test_that("Stops when Chapref is unlinked", {
  expect_error(figs_tbls_unrefd("./check-labels/Chapref-not-linked.tex"), regexp = "empty cross-reference")
})

test_that("Permit Chaprefand", {
  skip_on_cran()
  Chaprefand.tex <- tempfile(fileext = ".tex")
  writeLines(c("\\documentclass{report}",
               "\\begin{document}", 
               "See \\Chaprefand{chap:1}{chap:3}.",
               "\\chapter{one}\\label{chap:1}",
               "foo",
               "\\chapter{two}\\label{chap:2}",
               "\\Chapref{chap:1} and \\Chaprefrange{chap:2}{chap:3}",
               "\\chapter{three}\\label{chap:3}",
               "\\end{document}", 
               ""),
             Chaprefand.tex)
  expect_null(figs_tbls_unrefd(Chaprefand.tex))
})

test_that("Labels with space after", {
  temp_file <- tempfile(pattern = "labels",
                        fileext = ".tex")
  
  Cat <- function(...) base::cat(..., file = temp_file, append = TRUE, sep = "\n")
  
  Cat("\\documentclass{article}")
  Cat("")
  Cat("")
  Cat("\\begin{document}")
  Cat("Some figure.")
  Cat("\\begin{figure}")
  Cat("\\caption{Some label}\\label{fig:A B}")
  Cat("\\includegraphics{some-figure}")
  Cat("\\end{figure}")
  Cat("")
  Cat("\\end{document}")
  Cat("")
  
  expect_error(check_labels(temp_file)) 
})


test_that("Labels occuring twice, labelenumi", {
  temp_file <- tempfile(pattern = "labels",
                        fileext = ".tex")
  
  Cat <- function(...) base::cat(..., file = temp_file, append = TRUE, sep = "\n")
  
  Cat("\\documentclass{article}")
  Cat("")
  Cat("")
  Cat("\\begin{document}")
  Cat("Some figure.")
  Cat("\\chapter{A}\\label{chap:x}\\label{chap:y}")
  Cat("\\begin{enumerate}")
  Cat("\\renewcommand{\\labelenumi}{\\alpha{enumi}}")
  Cat("\\item A label.")
  Cat("\\end{enumerate}")
  Cat("\\begin{figure}")
  Cat("\\caption{Some label}\\label{fig:A B}")
  Cat("\\includegraphics{some-figure}")
  Cat("\\end{figure}")
  Cat("")
  Cat("\\end{document}")
  Cat("")
  
  expect_error(check_labels(temp_file)) 
})
