test_that("all exported functions have examples", {

  exFiles <- normalizePath(dir("../../man", full.names = TRUE))
  # use for loop as it keeps control at top level
  owd <- getwd()
  tmpdir <- file.path(tempdir(), "test_Examples")
  dir.create(tmpdir)
  setwd(tmpdir)
  on.exit({
    unlink(tmpdir, recursive = TRUE)
    setwd(owd)}
    , add = TRUE)
  for (file in exFiles) {
    test_example(file)
  }
})
