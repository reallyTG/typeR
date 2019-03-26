
create_mock_pkg <- function(pkg = "mock-pkg") {
  dir <- tempfile()

  dir.create(dir, recursive = TRUE)
  file.copy(pkg, dir, recursive = TRUE)

  # Enable `R CMD check` logging
  from <- file.path(dir, pkg)
  to <- paste0(from, ".Rcheck")
  file.rename(from, to)

  to
}
