context("check biber") 

test_that("Couldn't find an entry for", {
  skip_if_not(nzchar(Sys.which("biber")))
  skip_on_cran()
  # skip_on_travis()
  get_wd <- getwd()
  setwd("check-biber/lost-entry/")
  
  system2(command = "pdflatex", c("-draftmode", "-halt-on-error", "a.tex"), stdout = TRUE)
  system2(Sys.which("biber"), args = c("--onlylog",  "a"), stdout = TRUE)
  expect_error(check_biber(), "Biber emitted a warning")
  Sys.sleep(0.5)
  # Put this here so different runs of pdflatex don't affect
  # the test
  vapply(setdiff(dir(path = "."),
                 c("a.tex", "b.bib")),
         file.remove, 
         FALSE)
  setwd(get_wd)
})


test_that("No journal title", {
  skip_if_not(nzchar(Sys.which("biber")))
  skip_on_cran()
  skip_on_travis()
  get_wd <- getwd()
  setwd("check-biber/no-journal-title/")
  invisible(system2(command = "pdflatex", c("-draftmode", "-halt-on-error", "a.tex"), stdout = TRUE))
  invisible(system2(Sys.which("biber"), args = c("--onlylog", "-V",  "a"), stdout = TRUE))
  invisible(expect_error(check_biber(), regexp = "Biber emitted a warning"))
  Sys.sleep(0.5)
  # Put this here so different runs of pdflatex don't affect
  # the test
  vapply(setdiff(dir(path = "."),
                 c("a.tex", "b.bib")),
         file.remove, 
         FALSE)
  setwd(get_wd)
})
