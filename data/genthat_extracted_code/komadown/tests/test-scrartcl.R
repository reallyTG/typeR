# This test file has been copied verbatim from
# https://github.com/rstudio/rticles and is copyrighted to RStudio and
# licensed under GPL-3

context("Format")

test_format <- function(name, os_skip = NULL) {
  test_that(paste(name, "format"), {

    # don't run on cran because pandoc is required
    skip_on_cran()

    # skip on travis (which seems to currently fail)
    skip_on_travis()

    # skip on os if requested
    if (!is.null(os_skip))
      skip_on_os(os_skip)

    # work in a temp directory
    dir <- tempfile()
    dir.create(dir)
    oldwd <- setwd(dir)
    on.exit(setwd(oldwd), add = TRUE)

    # create a draft of the format
    testdoc <- "testdoc.Rmd"
    rmarkdown::draft(
      testdoc,
      system.file("rmarkdown", "templates", name, package = "komadown"),
      create_dir = FALSE,
      edit = FALSE
    )

    # render it
    output_file <- rmarkdown::render(testdoc)
    expect_true(file.exists(output_file))
  })
}

test_format("scrartcl")
