context("Reports")

test_that("Housing affordability (current)", {
  skip_on_cran()
  skip_if_not_installed("readr")
  skip_if_not(nzchar(Sys.which("biber")))
  library(data.table)
  h <- sample(letters, size = 1)
  ha <- file.path(tempdir(), h)
  hutils::provide.dir(ha)
  get_wd <- getwd()
  setwd(ha)
  dl_status <- 
    download.file(url = "https://github.com/grattan/zzz-2018-Housing-affordability/zipball/master",
                  mode = "wb",
                  cacheOK = FALSE,
                  destfile = "ha.zip", 
                  quiet = TRUE)
  unzip("ha.zip", exdir = ".")
  setwd(grep("grattan-zzz-2018-Housing-affordability", 
             list.dirs(), 
             fixed = TRUE, 
             value = TRUE))
  Report <- read_tex_document("Report.tex")
  Report.tex <- tempfile(fileext = ".tex")
  readr::write_lines(Report, Report.tex)
  expect_null(check_spelling("Report.tex"))
  expect_null(check_footnote_typography(Report.tex))
})
  
test_that("Housing affordability (original)", {  
  skip_on_cran()
  skip_if_not(nzchar(Sys.which("biber")))
  library(data.table)
  h <- sample(LETTERS, size = 1)
  ha <- file.path(tempdir(), h)
  hutils::provide.dir(ha)
  get_wd <- getwd()
  setwd(ha)
  dl_status <- 
    download.file(url = "https://github.com/grattan/zzz-2018-Housing-affordability/zipball/f51db0a2782508a78877eb29f33eec6eb3f021df",
                  mode = "wb",
                  cacheOK = FALSE,
                  destfile = "ha.zip", 
                  quiet = TRUE)
  unzip("ha.zip", exdir = ".")
  setwd(grep("grattan-zzz-2018-Housing-affordability", 
             list.dirs(), 
             fixed = TRUE, 
             value = TRUE))
  
  Report <- read_tex_document("Report.tex")
  Report.tex <- tempfile(fileext = ".tex")
  skip_if_not_installed("readr")
  readr::write_lines(Report, Report.tex)
  footnotes <- extract_LaTeX_argument(Report, "footnote")
  expect_equal(footnotes[262][["extract"]], 
               "For example, at Ormond and Moonee Ponds.")
  
  expect_identical(footnotes[69L][["char_no_max"]], 103841L)
  
  expect_null(check_cite_pagerefs(Report.tex))
  expect_null(check_dashes(Report.tex))
  expect_null(check_escapes(Report.tex))
  
  expect_null(check_labels(Report.tex))
  expect_null(check_literal_citations(Report.tex))
  
  
  tempf_consecutive <- tempfile(pattern = "consecutive",
                                fileext = ".txt")
  system("pdflatex -interaction=batchmode Report.tex")
  system("biber --onlylog Report")
  system("pdflatex -interaction=batchmode Report.tex")
  consecutive_outfile <- tempfile(pattern = "con_out")
  expect_error(check_consecutive_words(latex_file = "Report.tex",
                                       outfile = consecutive_outfile))
  
  # Separate land tax schedules could be introduced for residential and
  # commercial land, with residential land paying a low flat rate and
  # commercial land remaining subject to a progressive land tax schedule
  # in order to to prevent windfall gains to large existing commercial
  # landholders.
  if (file.exists(consecutive_outfile)) {
    con_outf <- trimws(readLines(consecutive_outfile, warn = FALSE))
    expect_true("commercial land, with residential land paying a low flat rate and" %chin% con_outf)
    expect_true("commercial land remaining subject to a progressive land tax schedule" %chin% con_outf)
  }
  
  
  setwd(get_wd)
})

