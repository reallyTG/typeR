context("Minimal bib")

test_that("Error handling", {
  skip_on_cran()
  skip_on_travis()
  skip_if_not(nzchar(Sys.which("pdflatex")))
  skip_if_not(nzchar(Sys.which("biber")))
  
  current_wd <- getwd()
  temp_dir <- file.path(tempdir(), sprintf("minimal-%d-bib", sample.int(1e5, size = 1)[1]))
  hutils::provide.dir(temp_dir)
  skip_if(length(dir(path = temp_dir, pattern = "\\.bbl$")))
  expect_error(minimal_bib(temp_dir), 
               regexp = "did not contain a .bbl file", 
               fixed = TRUE)
  setwd("minimal-bib")
  
  invisible({
    system("pdflatex -halt-on-error -interaction=batchmode article-for-min-bib.tex",
           intern = TRUE)
    system("biber article-for-min-bib",
           intern = TRUE)
    system("pdflatex -halt-on-error -interaction=batchmode article-for-min-bib.tex", 
           intern = TRUE)
  })
  minimal_bib(out.bib = "minimal-actual.bib")
  expect_equal(read_lines("minimal-actual.bib"),
               read_lines("minimal-expected.bib"))
  setwd(current_wd)
})
